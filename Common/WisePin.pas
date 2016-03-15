unit WisePin;

interface

uses
  Windows, cbw, WiseHardware, WiseDaq, WisePort, Contnrs, SysUtils;

type  TWisePin = class(TWiseObject)
  private
    Daq:        TWiseDaq;
    Pin:        Integer;

  public
    constructor Create(Name: string; did: TDaqId; Pin: Integer);
    destructor  Destroy(); override;

    procedure   SetOn();             // sets the corresponding bit to 1
    procedure   SetOff();            // sets the corresponding bit to 0
    function    IsOn(): boolean;
end;

implementation

constructor TWisePin.Create(Name: string; did: TDaqId; Pin: Integer);
var
  daq:     TWiseDaq;
  b, p, d: integer;
  daqname: string;
begin
  if not Pin in [0 .. 7] then
    raise EWisePinError.CreateFmt('[%s]: %s: Invalid pin number "%d", must be in [0 .. 7]', ['TWisePin.Create', Name, Pin]);

  reverseDaqId(did, b, p, d);

  daqname := Format('board%d.%s[%d]', [b, WiseDaqPortNames[p], Pin]);
  Inherited Create(Name + '@' + daqname);

  daq := lookupDaq(did);
  if daq <> nil then
    Self.Daq := daq
  else
    Self.Daq := TWiseDaq.Create(daqname, did);

  Self.Pin := Pin;
  Self.Daq.IncRef;
end;

destructor TWisePin.Destroy();
begin
     Self.Daq.DecRef;
     inherited Destroy;
end;

procedure TWisePin.SetOn();
begin
  Self.Daq.Value := Self.Daq.Value OR (1 SHL Self.Pin);
end;

procedure TWisePin.SetOff();
begin
  Self.Daq.Value := Self.Daq.Value AND NOT (1 SHL Self.Pin);
end;

function TWisePin.IsOn(): boolean;
begin
  Result := (Self.Daq.Value AND (1 SHL Self.Pin)) <> 0;
end;

end.
