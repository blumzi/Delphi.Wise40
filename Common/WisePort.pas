unit WisePort;

interface

uses
  Windows, cbw, WiseHardware, WiseDaq, StopWatch;


type TWiseMultiPortSpec = record
  daqid:        TDaqId;
  mask:         word;
  shiftR:       integer;
  shiftL:       integer;
end;
type TWiseMultiPortSpecs = array of TWiseMultiPortSpec;

{
      TWiseMultiPort - A specialized type of port, mainly used for TWiseEncoder objects.

      A multi-port:
        - Includes one or more ordered Daqs (either 4 or 8 bit).  The order is defined by the
          sequence of DaqIds passed to the constructor. Example: (FIRSTPORTA, FIRSTPORTCL).

        - All but last Daq have full masks (either $f or $ff).  The last Daq can
          have a partial mask (e.g. $3)

        - When reading a multi-port:
           o The Daqs are read in the pre-defined order
           o A maximal time-out is imposed between the Daq reads. If it is exceeded, the
             process is re-started. This tries to make the multi-port readings as atomic as possible.
           o An end-value is composed by shifting and masking the intermediate values in
             the pre-defined order.
}
type TWiseMultiPort = class(TWiseObject)
 private
    Daqs:       array of TWiseDaq;    // Interfaces to the MCC Daqs
    shrs:       array of byte;        // Each byte[i] read from the hardware is first shifted right by shrs[i]
    masks:      array of word;        //  then masked with masks[i]
    shls:       array of byte;        //  then shifted into the result by shls[i]
    stopper:    TStopWatch;
    timeout:    TLargeInteger;

 public
    constructor Create(Name: string; specs: TWiseMultiPortSpecs; timeout: TLargeInteger = 50); overload;
    constructor Create(Name: string; DaqIds: array of TDaqId; lastmask: word; timeout: TLargeInteger = 50); overload;
    destructor  Destroy(); override;

    procedure   SetVal(val: integer);
    function    GetVal(): integer;

    property    Value: integer read GetVal write SetVal;
end;

{
    TWisePort - The most commonly used port abstraction
}
type TWisePort = class(TWiseObject)
 private
    Daq:        TWiseDaq;
    Mask:       word;
 public
    constructor Create(Name: string; did: TDaqId; mask: integer); overload;
    constructor Create(Name: string; did: TDaqId); overload;
    destructor  Destroy(); override;
    procedure   _Create(Name: string; did: TDaqId; mask: integer);

    function    GetVal(): word;      // reads the current port value
    procedure   SetVal(val: word);   // sets the port to the given value

    property    Value: word read GetVal write SetVal;
end;


implementation

const EightBitPortIds: array[0..15] of integer = (
      FIRSTPORTA,    FIRSTPORTB,    SECONDPORTA,  SECONDPORTB,
      THIRDPORTA,    THIRDPORTB,    FOURTHPORTA,  FOURTHPORTB,
      FIFTHPORTA,    FIFTHPORTB,    SIXTHPORTA,   SIXTHPORTB,
      SEVENTHPORTA,  SEVENTHPORTB,  EIGHTHPORTA,  EIGHTHPORTB
      );

const FourBitPortIds: array[0..15] of integer = (
      FIRSTPORTCL,   FIRSTPORTCH,   SECONDPORTCL, SECONDPORTCH,
      THIRDPORTCL,   THIRDPORTCH,   FOURTHPORTCL, FOURTHPORTCH,
      FIFTHPORTCL,   FIFTHPORTCH,   SIXTHPORTCL,  SIXTHPORTCH,
      SEVENTHPORTCL, SEVENTHPORTCH, EIGHTHPORTCL, EIGHTHPORTCH
      );

{ TWiseMultiPort implementation }
constructor TWiseMultiPort.Create(Name: string; specs: TWiseMultiPortSpecs; timeout: TLargeInteger = 50);
var
   i:    Integer;
   daq:  TWiseDaq;
   board, port, dir, firstDir: integer;
   keys: array of integer;
begin

  SetLength(keys, High(specs) + 1);
  SetLength(Self.masks, High(specs) + 1);
  SetLength(Self.shrs, High(specs) + 1);
  SetLength(Self.shls, High(specs) + 1);
  firstDir := -1;

  for i := 0 to High(specs) do begin       // Check that all directions are the same
    reverseDaqId(specs[i].daqid, board, port, dir);
    keys[i] := daqId(board, port);
    
    if i = 0 then
      firstDir := dir
    else
      if dir <> firstDir then
        raise EWiseError.CreateFmt('[%s]: %s: All directions must be the same!', ['TWiseMultiPort.Create', name]);

    daq := lookupDaq(keys[i]);
    if (daq <> nil) and (daq.Dir <> dir) then
      raise EWiseError.CreateFmt('[%s]: %s: A Daq for Board%d.%s was already configured for the oposite direction!',
        ['TWiseMultiPort.Create', name, board, WiseDaqPortNames[port]]);
  end;

  Inherited Create(Name);

  SetLength(Self.Daqs, High(specs) + 1);
  for i := 0 to High(Daqs) do begin
    daq := lookupDaq(keys[i]);
    if specs[i].mask = 0 then
      Self.masks[i] := $ff
    else
      Self.masks[i] := specs[i].mask;

    Self.shrs[i] := specs[i].shiftR;
    if specs[i].shiftL <> 0 then
      Self.shls[i] := specs[i].shiftL
    else
      Self.shls[i] := i * 8;

    if daq <> nil then
      Self.Daqs[i] := daq
    else
      Self.Daqs[i] := TWiseDaq.Create(name, specs[i].daqid, Self.masks[i]);

    Self.Daqs[i].IncRef;
  end;

  Self.stopper := TStopWatch.Create;
  Self.Timeout := timeout;
end;

constructor TWiseMultiPort.Create(Name: string; DaqIds: array of TDaqId; lastmask: word; timeout: TLargeInteger = 50);
var
  i:     Integer;
  specs: TWiseMultiPortSpecs;
begin

  SetLength(specs, High(DaqIds) + 1);
  for i := 0 to High(DaqIds) - 1 do begin
    specs[i].daqid  := DaqIds[i];
    specs[i].mask   := $ff;
    specs[i].shiftL := 0;
    specs[i].shiftR := 0;
  end;

  i := High(DaqIds);
  specs[i].daqid    := DaqIds[i];
  specs[i].mask     := lastmask;
  specs[i].shiftL   := 0;
  specs[i].shiftR   := 0;

  Create(Name, specs, timeout);
end;

destructor TWiseMultiPort.Destroy();
var
  i: integer;
begin
  for i := 0 to High(Self.Daqs) do
    Self.Daqs[i].DecRef;
  inherited Destroy;
end;

function TWiseMultiPort.GetVal(): integer;
var
  daqno, tries, elapsed:   integer;
  val: word;
begin
  tries    := 0;
  elapsed  := 0;

  repeat
    Result := 0;
    daqno  := 0;

    repeat
      if (daqno > 0) then
        Self.stopper.Start;                                               // start the stopper
      val := Self.Daqs[daqno].Value;
      if (daqno > 0) then begin
        Self.stopper.Stop;                                                // stop the stopper
        elapsed := Self.stopper.ElapsedMicroseconds;
      end;

      if (daqno > 0) and (elapsed > Self.Timeout) then begin
        daqno := 0;                                                       // read failed or took too long between reads => start over
        continue;
      end;

      if Self.shrs[daqno] <> 0 then                     // shift left to get rid of unwanted LSBs
        val := val SHR Self.shrs[daqno];

      if Self.masks[daqno] <> 0 then
        val := val AND Self.masks[daqno];               // mask off unwanted bits

      Result := Result OR (val SHL Self.shls[daqno]);   // shift byte into its position in the Result

      Inc(daqno);
    until daqno = High(Self.Daqs) + 1;

    if daqno = High(Self.Daqs) + 1 then
      break;

    Inc(tries)
  until tries = MaxTries;

  if tries = MaxTries then
    raise EWiseEncoderError.CreateFmt('[%s]: %s: Cannot read after %d tries.', ['TWiseEncoder.ReadDaqs', Self.Name, MaxTries]);
end;

procedure TWiseMultiPort.SetVal(val: integer);
begin
  // TBD
end;

procedure TWisePort._Create(Name: string; did: TDaqId; mask: integer);
var
  daq: TWiseDaq;
  key, board, port, dir: integer;
begin
  reverseDaqId(did, board, port, dir);
  key := daqId(board, port);

  daq := lookupDaq(key);
  if (daq <> nil) then begin
    if (daq.Dir <> dir) then
      raise EWiseError.CreateFmt('[%s]: %s: A Daq for Board%d.%s was already configured for the oposite direction!',
        ['TWisePort._Create', name, board, WiseDaqPortNames[port]]);
    Self.Daq := daq
  end else
    Self.Daq := TWiseDaq.Create(name, did);

  inherited Create(Name);
  Self.Mask := mask;
  Self.Daq.IncRef;
end;

constructor TWisePort.Create(Name: string; did: TDaqId; mask: integer);
begin
  _Create(Name, did, mask);
end;


constructor TWisePort.Create(Name: string; did: TDaqId);
var
  mask, board, port, dir: integer;
begin
  reverseDaqId(did, board, port, dir);
  if WiseBoards[board].bitsPerDaq[port - FIRSTPORTA] = 8 then
    mask := $ff
  else
    mask := $f;
  _Create(Name, did, mask);
end;

destructor TWisePort.Destroy();
begin
     Self.Daq.DecRef;
     inherited Destroy;
end;

function TWisePort.GetVal(): word;
begin
  Result := Self.Daq.Value;
end;

procedure TWisePort.SetVal(val: word);
begin
  Self.Daq.Value := val;
end;

end.
