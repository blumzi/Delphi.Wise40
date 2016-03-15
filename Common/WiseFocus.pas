unit WiseFocus;

interface

uses
  ExtCtrls, SysUtils, DateUtils,
  WiseHardware, WiseDaq, WisePort, WiseEncoder, WisePin, WiseLogger,
  cbw;

type TWiseFocusState = (FocusIdle, FocusMovingUp, FocusMovingDown );

type TWiseFocus = class(TWiseObject)
private
  UpPin, DownPin:       TWisePin;
  Encoder:              TWiseEncoder;
  Logger:               TWiseLogger;
  Timer:                TTimer;
  lastValue:            integer;
  fChanging:            boolean;
  fState:               TWiseFocusState;
  sameValues:           integer;
  fSpeed:               integer;  // ticks/second
  stopTime:             TDateTime;
  stopVal:              integer;

public
  constructor Create;
  destructor  Destroy; override;
  function    GetValue: integer;
  procedure   SetValue(val: integer);
  function    GetStateStr: string;
  function    GetStatus: string;
  procedure   log(s: string);

  procedure   StartUp;
  procedure   StopUp;
  procedure   StartDown;
  procedure   StopDown;
  procedure   FullUp;
  procedure   FullDown;
  procedure   Stop;
  procedure   onTimer(Sender: TObject);

  property    Value: integer read GetValue write SetValue;
  property    Changing: boolean read fChanging;
  property    StateStr: string read GetStateStr;
  property    Speed: integer read fSpeed;
  property    Status: string read GetStatus;
end;

implementation

constructor TWiseFocus.Create;
var
  specs: TWiseMultiPortSpecs;
begin
  if production then begin
    Self.DownPin    := TWisePin.Create('FocusDownPin', daqId(focusboard, FIRSTPORTCH,  DIGITALOUT), 0);
    Self.UpPin      := TWisePin.Create('FocusUpPin',   daqId(focusboard, FIRSTPORTCH,  DIGITALOUT), 1)
  end else begin
    Self.DownPin    := TWisePin.Create('FocusDownPin', daqId(domeboard, FIRSTPORTA,  DIGITALOUT), 0);
    Self.UpPin      := TWisePin.Create('FocusUpPin',   daqId(domeboard, FIRSTPORTA,  DIGITALOUT), 1)
  end;

  SetLength(specs, 2);
  if production then begin
    specs[0].daqid  := daqId(focusboard, FIRSTPORTA, DIGITALIN);  // bit[0..2] - FIRSTPORTA[0..2]
    specs[0].mask   := $3;
    specs[0].shiftL := 0;
    specs[0].shiftR := 0;

    specs[1].daqid  := daqId(focusboard, FIRSTPORTB, DIGITALIN);  // bit[3..9] - FIRSTPORTB[0..6]
    specs[1].mask   := $7f;
    specs[1].shiftL := 0;
    specs[0].shiftR := 3;
  end else begin
    specs[0].daqid  := daqId(domeboard, FIRSTPORTB, DIGITALIN);
    specs[0].mask   := $3;
    specs[0].shiftL := 0;
    specs[0].shiftR := 0;

    specs[1].daqid  := daqId(domeboard, FIRSTPORTCL, DIGITALIN);
    specs[1].mask   := $7f;
    specs[1].shiftL := 0;
    specs[1].shiftR := 3;
  end;

  Self.Encoder        := TWiseFocusEncoder.Create('FocusEncoder', specs);
  Self.Timer          := TTimer.Create(nil);
  Self.Timer.Enabled  := false;
  Self.Timer.Interval := 1000;
  Self.Timer.OnTimer  := onTimer;

  Self.lastValue      := -1;
  Self.Logger         := TWiseLogger.Create('focus-proto');
  Self.log('Started.');
end;

function TWiseFocus.GetValue: integer;
begin
  result := Self.Encoder.Value;
end;

procedure TWiseFocus.SetValue(val: integer);
begin
  // tbd
end;

procedure TWiseFocus.StartUp;
begin
  Self.UpPin.SetOn;
  Self.fState := FocusMovingUp;
end;

procedure TWiseFocus.StopUp;
begin
  Self.Stop;
end;

procedure TWiseFocus.StartDown;
begin
  Self.DownPin.SetOn;
  Self.fState := FocusMovingDown;
end;

procedure TWiseFocus.StopDown;
begin
  Self.Stop;
end;

procedure TWiseFocus.onTimer(Sender: TObject);
var
  currValue: integer;
begin
  if not ((Self.fState = FocusMovingUp) or (Self.fState = FocusMovingDown)) then
    exit;

  currValue := Self.Encoder.Value;
  Self.log(Format('currValue: %d, lastValue: %d, delta: %d', [currValue, Self.lastValue, currValue - Self.lastValue]));

  if Self.lastValue = -1 then begin
    Self.lastValue := currValue;
    exit;
  end;

  if currValue = Self.lastValue then begin
    Inc(Self.sameValues);
    if Self.sameValues = 3 then begin
      Self.Stop;
      Self.Timer.Enabled := false;
    end;
  end;

  Self.lastValue := currValue;
  Self.fSpeed    := Abs(currValue - Self.lastValue);
  if SecondsBetween(Now, Self.stopTime) >= 2 then
    Self.log(Format('stop at %d, inertia: %d', [Self.stopVal, Abs(Self.Value - Self.stopVal)]));
end;

procedure TWiseFocus.FullUp;
begin
  Self.StartUp;
  Self.sameValues := 0;
  Self.Timer.Enabled := true;
end;

procedure TWiseFocus.FullDown;
begin
  Self.StartDown;
  Self.sameValues := 0;
  Self.Timer.Enabled := true;
end;

procedure TWiseFocus.Stop;
begin
  Self.UpPin.SetOff;
  Self.DownPin.SetOff;

  Self.fState   := FocusIdle;
  Self.stopTime := Now;
  Self.stopVal  := Self.Value;
end;

procedure TWiseFocus.log(s: string);
begin
  Self.Logger.log(s);
end;

destructor TWiseFocus.Destroy;
begin
  Self.Stop;

  inherited Destroy;
end;

function TWiseFocus.GetStateStr: string;
begin
  case Self.fState of
  FocusIdle:       result := 'Idle';
  FocusMovingUp:   result := 'Up';
  FocusMovingDown: result := 'Down';
  end;
end;

function TWiseFocus.GetStatus: string;
begin
  result := '';
end;

end.
