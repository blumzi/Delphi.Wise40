unit WiseDaq;

interface

uses
    Windows, Classes, SysUtils, cbw, Contnrs, WiseHardware;

type TDaqId           = word;                // (Dir << 8 | ((Board << 6) | port)) = 9bits

type TBoardInfo = record
     model:      PChar;
     num:        integer;
     ndaqs:      integer;
     bitsPerDaq: array of integer;
end;
type PTBoardInfo = ^TBoardInfo;

type TDaqPortNumbers  = set of FIRSTPORTA .. EIGHTHPORTCH;
type PTDaqPortNumbers = ^TDaqPortNumbers;

type TWiseDaq         = class(TWiseObject)
  private
     fDir:            Integer;              // The port direction
     Mask:            Byte;
     fValue:          word;                 // Remembered by software
     fId:             TDaqId;
     fNbits:          integer;
     refcount:        integer;

  public
     Board:           Integer;              // The Daq board number
     Port:            Integer;              // The port number on the Daq board

    constructor Create(name: string; board: integer; port: integer; dir: integer; mask: integer); overload;
    constructor Create(name: string; did: TDaqId; mask: integer); overload;
    constructor Create(name: string; did: TDaqId); overload;
    destructor  Destroy();   override;

    function    GetValue(): word;
    procedure   SetValue(val: word);

    procedure   IncRef();
    procedure   DecRef();
    function    GetKey(): integer;

    procedure   _Create(name: string; board: integer; port: integer; dir: integer; mask: integer);

    property Id:    TDaqId    read fId       write fId;
    property Value: word      read GetValue  write SetValue;
    property Nbits: integer   read fNbits    write fNbits;
    property Dir:   integer   read fDir      write fDir;
    property Key:   integer   read GetKey;
end;

var
  WiseBoards:           array of TBoardInfo;
  NullString:           array [0..BOARDNAMELEN] of Char;
  WiseDaqPortNames:     array [AUXPORT .. EIGHTHPORTCH] of string;
  
  domeboard:            integer;
  teleboard:            integer;
  focusboard:           integer;

  WiseDaqsInfoInitialized: boolean;

function  InitDaqsInfo(): string;
function  lookupDaq(board: integer; port: integer; direction: integer): TWiseDaq; overload;
function  lookupDaq(did: TDaqId): TWiseDaq; overload;

function  daqId(board: integer; port: integer; direction: integer): TDaqId; overload;
function  daqId(board: integer; port: integer): TDaqId; overload;
procedure reverseDaqId(daqid: TDaqId; out board: integer; out port: integer; out dir: integer);

implementation

var
  DaqsInUse: TObjectBucketList;

function daqId(board: integer; port: integer; direction: integer): TDaqId; overload;
var
  r: integer;
begin
  r := (board SHL 6) OR port;
  if direction = DIGITALIN then
    r := r OR (1 SHL 8)
  else
    r := r OR (0 SHL 8);

  Result := r;
end;

function daqId(board: integer; port: integer): TDaqId; overload;
var
  r: integer;
begin
  r := (board SHL 6) OR port;
  Result := r;
end;

procedure reverseDaqId(daqid: TDaqId; out board: integer; out port: integer; out dir: integer);
begin
  if (daqid AND (1 SHL 8) <> 0) then
    dir := DIGITALIN
  else
    dir := DIGITALOUT;

  board := (daqid SHR 6) AND $3;
  port  := daqid AND $3f;
end;

function TWiseDaq.GetKey(): integer;
begin
  Result := (Self.Board SHL 6) OR Self.Port;
end;

procedure TWiseDaq._Create(name: string; board: integer; port: integer; dir: integer; mask: integer);
var
  key, stat: integer;
begin
  key := daqId(board, port);

  if DaqsInUse.Exists(Pointer(key)) then
    raise EWiseError.CreateFmt('[%s]: %s: Daq for Board #%d.%s already created, only one can exist!',
      ['TWiseDaq._Create', name, board, WiseDaqPortNames[port]]);

  stat := cbDConfigPort(board, port, dir);
  if (stat <> 0) then
    raise EWisePortError.CreateFmt('%s: Cannot cbDConfigPort "%s" on board %d for %s',
               [name, WiseDaqPortNames[Self.Port], board, DirNames[dir]]);

  Self.Name     := name;
  Self.Board    := board;
  Self.Port     := port;
  Self.Dir      := dir;
  Self.Mask     := mask;
  Self.Value    := 0;
  Self.Id       := daqId(board, port, dir);
  Self.Nbits    := WiseBoards[board].bitsPerDaq[port - FIRSTPORTA];
  Self.refcount := 0;

  DaqsInUse.Add(Pointer(Self.Key), Self);
end;

constructor TWiseDaq.Create(name: string; board: integer; port: integer; dir: integer; mask: integer);
begin
  _Create(name, board, port, dir, mask);
end;

constructor TWiseDaq.Create(name: string; did: TDaqId; mask: integer);
var
  board, port, dir: integer;
begin
  reverseDaqId(did, board, port, dir);
  _Create(name, board, port, dir, mask);
end;

constructor TWiseDaq.Create(name: string; did: TDaqId);
var
  board, port, dir, mask: integer;
begin

  reverseDaqId(did, board, port, dir);

  mask := $ff;
  if WiseBoards[board].bitsPerDaq[port - FIRSTPORTA] = 4 then
    mask := $f;
  _Create(name, board, port, dir, mask);
end;

destructor TWiseDaq.Destroy();
begin
  DaqsInUse.Remove(Pointer(Self.Key));
  inherited Destroy;
end;

function lookupDaq(board: integer; port: integer; direction: integer): TWiseDaq; overload
var
  key: TDaqId;
  daq: TWiseDaq;
begin
  key := daqId(board, port);

  if DaqsInUse.Find(Pointer(key), Pointer(daq)) then
    Result := daq
  else
    Result := nil;
end;

function lookupDaq(did: TDaqId): TWiseDaq; overload
var
  x, key, b, p, d: integer;
begin
  reverseDaqId(did, b, p, d);
  key := daqId(b, p);

  if DaqsInUse.Find(Pointer(key), Pointer(x)) then
    Result := TWiseDaq(x)
  else
    Result := nil;
end;

function TWiseDaq.GetValue(): word;
var
  tries, stat: integer;
  val:         word;
begin
  for tries := MaxTries downto 0 do begin
    stat := cbDIn(Self.Board, Self.Port, val);
    if (stat = 0) then begin
      Self.fValue := val AND Self.Mask;
      Result      := Self.fValue;
      exit;
    end;
  end;

  raise EWisePortError.CreateFmt('[%s]: %s: Cannot read "%s" on board %d after %d tries.',
           ['TWiseDaq.GetVal', Self.Name, WiseDaqPortNames[Self.Port], Self.Board, MaxTries]);
end;

procedure TWiseDaq.SetValue(val: word);
var
   stat, tries: Integer;
begin
  val := val AND Self.Mask;
  Self.fValue := val;
  if (Self.Dir = DIGITALIN) then
    exit;

  for tries := MaxTries downto 0 do begin
    stat := cbDOut(Self.Board, Self.Port, val);
    if (stat = 0) then
      exit;
  end;

  raise EWisePortError.CreateFmt('[%s]: %s: Cannot cbDout(%d, "%s", %x) => %d (after %d tries).',
           ['TWiseDaq.SetVal', Self.Name, Self.Board, WiseDaqPortNames[Self.Port], val, stat, MaxTries]);
end;

procedure TWiseDaq.IncRef;
begin
  Self.refcount := Self.refcount + 1;
end;

procedure TWiseDaq.DecRef;
begin
  if (Self.refcount = 1) then begin
    DaqsInUse.Remove(Pointer(Self.Id));
    Destroy;
    exit;
  end;

  Self.refcount := Self.refcount - 1;
end;

function InitDaqsInfo(): string;
var
   nboards, boardno: integer;
   daqno:            integer;
   val:              integer;
begin
   {
     Get the number of boards installed in system
   }
   nboards := 0;
   cbGetConfig (GLOBALINFO, 0, 0, GINUMBOARDS, nboards);
   if (nboards = 0) then begin
      Result := Format('Could not find any MCC boards!', []);
      exit;
   end;

   Result := '';
   SetLength(WiseBoards, nboards);
   for boardno := 0 to nboards do begin
       cbGetConfig (BOARDINFO, boardno, 0, BIBOARDTYPE, val);
       if (val <= 0) then
          continue;

       WiseBoards[boardno].num   := boardno;
       WiseBoards[boardno].model := NullString;
       cbGetBoardName(boardno, WiseBoards[boardno].model);

       {get the number of digital devices for this board }
       cbGetConfig (BOARDINFO, boardno, 0, BIDINUMDEVS, WiseBoards[boardno].ndaqs);
       SetLength(WiseBoards[boardno].bitsPerDaq, WiseBoards[boardno].ndaqs);
       for daqno := 0 to WiseBoards[boardno].ndaqs - 1 do begin
            {For each digital device, get the base address and number of bits }
            cbGetConfig (DIGITALINFO, boardno, daqno, DINUMBITS, val);
            WiseBoards[boardno].bitsPerDaq[daqno] := val;
       end;
   end;
   WiseDaqsInfoInitialized := true;

  if production then begin
    focusboard := 2;
    teleboard  := 1;
    domeboard  := 0;
  end else begin
    focusboard := 0;
    teleboard  := 0;
    domeboard  := 0;
  end;

end;


initialization

  WiseDaqPortNames[AUXPORT]          := 'AUXPORT';
  WiseDaqPortNames[FIRSTPORTA]       := 'FIRSTPORTA';
  WiseDaqPortNames[FIRSTPORTB]       := 'FIRSTPORTB';
  WiseDaqPortNames[FIRSTPORTCL]      := 'FIRSTPORTCL';
  WiseDaqPortNames[FIRSTPORTCH]      := 'FIRSTPORTCH';
  WiseDaqPortNames[SECONDPORTA]      := 'SECONDPORTA';
  WiseDaqPortNames[SECONDPORTB]      := 'SECONDPORTB';
  WiseDaqPortNames[SECONDPORTCL]     := 'SECONDPORTCL';
  WiseDaqPortNames[SECONDPORTCH]     := 'SECONDPORTCH';
  WiseDaqPortNames[THIRDPORTA]       := 'THIRDPORTA';
  WiseDaqPortNames[THIRDPORTB]       := 'THIRDPORTB';
  WiseDaqPortNames[THIRDPORTCL]      := 'THIRDPORTCL';
  WiseDaqPortNames[THIRDPORTCH]      := 'THIRDPORTCH';
  WiseDaqPortNames[FOURTHPORTA]      := 'FOURTHPORTA';
  WiseDaqPortNames[FOURTHPORTB]      := 'FOURTHPORTB';
  WiseDaqPortNames[FOURTHPORTCL]     := 'FOURTHPORTCL';
  WiseDaqPortNames[FOURTHPORTCH]     := 'FOURTHPORTCH';
  WiseDaqPortNames[FIFTHPORTA]       := 'FIFTHPORTA';
  WiseDaqPortNames[FIFTHPORTB]       := 'FIFTHPORTB';
  WiseDaqPortNames[FIFTHPORTCL]      := 'FIFTHPORTCL';
  WiseDaqPortNames[FIFTHPORTCH]      := 'FIFTHPORTCH';
  WiseDaqPortNames[SIXTHPORTA]       := 'SIXTHPORTA';
  WiseDaqPortNames[SIXTHPORTB]       := 'SIXTHPORTB';
  WiseDaqPortNames[SIXTHPORTCL]      := 'SIXTHPORTCL';
  WiseDaqPortNames[SIXTHPORTCH]      := 'SIXTHPORTCH';
  WiseDaqPortNames[SEVENTHPORTA]     := 'SEVENTHPORTA';
  WiseDaqPortNames[SEVENTHPORTB]     := 'SEVENTHPORTB';
  WiseDaqPortNames[SEVENTHPORTCL]    := 'SEVENTHPORTCL';
  WiseDaqPortNames[SEVENTHPORTCH]    := 'SEVENTHPORTCH';
  WiseDaqPortNames[EIGHTHPORTA]      := 'EIGHTHPORTA';
  WiseDaqPortNames[EIGHTHPORTB]      := 'EIGHTHPORTB';
  WiseDaqPortNames[EIGHTHPORTCL]     := 'EIGHTHPORTCL';
  WiseDaqPortNames[EIGHTHPORTCH]     := 'EIGHTHPORTCH';


  DaqsInUse := TObjectBucketList.Create(bl128);
  WiseDaqsInfoInitialized := false;

end.
