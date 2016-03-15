unit WiseDome;

interface

uses
  ExtCtrls, DateUtils, SysUtils, ScktComp, StrUtils, Types,
  WiseHardware, WiseDaq, WiseEncoder, WisePin, WiseLogger, DomeProtocol,
  StopWatch, Math, cbw;

type TWiseDomeState      = ( Idle = 0, MovingCCW = 1, MovingCW = 2, AutoShutdown = 3 );
type TWiseShutterState   = ( ShutterIdle, ShutterOpening, ShutterOpen, ShutterClosing, ShutterClosed );
type TWiseDomeStuckPhase = ( NotStuck, FirstStop, GoBackward, SecondStop, ResumeForward );
type TAutoShutdown       = procedure of object;


// ----------------------------------------------
// Dome
// ----------------------------------------------
type TWiseDome = class

private
  Encoder:            TWiseDomeEncoder;

  CaliPin:            TWisePin;
  fCalibrated:        boolean;
  fAutoCal:           boolean;

  LeftPin:            TWisePin;
  RightPin:           TWisePin;
  targetAz:           real;
  fState:             TWiseDomeState;

  fStuck:             boolean;

  OpenPin:            TWisePin;
  ClosePin:           TWisePin;
  fShutterState:      TWiseShutterState;
  fShutterOpenPcent:  real;
  activityStart:      TDateTime;

  fVentIsOpen:        boolean;
  VentPin:            TWisePin;

  prevTicks:          integer;

  timer:              TTimer;
  movementTimer:      TTimer;
  stuckTimer:         TTimer;

  logger:             TWiseLogger;

  client:             TCustomWinSocket;
  fConnected:         boolean;
  fCalibrating:       boolean;
  waitingForMessage:  boolean;
  messageForClient:   string;

  server:             TServerSocket;
  AutoShutdown:       TAutoShutdown;

  //Start Stop Debugging
  SD_startTime:       TDateTime;
  SD_startTicks:      integer;
  SD_startAz:         real;
  SD_state:           TWiseDomeState;

  // unStuck
  currentStuckState:  TWiseDomeStuckPhase;
  currentStuckStateStr: string;
  nextStuckEvent:     TDateTime;

  procedure           SD_start;
  procedure           SD_report;
  // End Stop debugging


  procedure           onClientRead      (Sender: TObject; Socket: TCustomWinSocket);
  procedure           onClientConnect   (Sender: TObject; Socket: TCustomWinSocket);
  procedure           onClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
  procedure           onClientError     (Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);

  procedure           SendStatus;
  procedure           SendError;

  procedure           onStuckTimer(Sender: TObject);

public
  constructor Create(autoshutdown: TAutoShutdown; autocal: boolean = false);
  destructor  Destroy; override;

  // Movement methods
  procedure   Left;  procedure   MoveCW;
  procedure   Right; procedure   MoveCCW;
  procedure   Stop;

  // Shutter methods
  procedure   Open;
  procedure   Close;
  procedure   FullOpen;
  procedure   FullClose;
  procedure   StopShutter;
  function    GetShutterOpenPcent: real;

  // Azimuth methods
  procedure   SetAzimuth(az: real);
  function    GetAzimuth: real;
  procedure   MoveTo(tgtAz: real);
  function    AtCalibrationPoint: boolean;
  procedure   FindCalibrationPoint;

  // Periodic methods
  procedure   onDomeTimer(Sender: TObject);
  procedure   onMovementTimer(Sender: TObject);

  // Vent methods
  procedure   OpenVent;
  procedure   CloseVent;

  // Status methods
  function    stateStr:        string;
  function    shutterStateStr: string;
  function    debug:           string;

  procedure   log(s: string);

  property    Azimuth:      real    read GetAzimuth write SetAzimuth;
  property    State:        string  read stateStr;
  property    ShutterState: string  read shutterStateStr;
  property    ShutterPcent: real    read GetShutterOpenPcent;
  property    Calibrated:   boolean read fCalibrated;
  property    Stuck:        boolean read fStuck;
  property    AutoCal:      boolean read fAutoCal write fAutoCal;

  property    Connected:    boolean read fConnected;
  property    Calibrating:  boolean read fCalibrating;

  property    VentIsOpen:   boolean read fVentIsOpen;
  
end;


implementation

const
  TicksPerDomeRevolution:    integer = 1018;      // measured by Yftach
  TicksPerEncoderRevolution: integer = 1024;      // as per the dome encoder specifications
  MillisPerShutterTravel:    integer = 22 * 1000; // measured by Yftach
  CallibrationPointAzimuth:  real    = 254.6;     // measured by Shai
  TicksPerSecond:            integer = 6;         // measured by Yftach

  {
    NOTE:
      - These measurements are while the dome moved CCW, it may be that the
         inertia on CW movement may be different.
  }
  DegPerInertia:             real    = 0.7;       // measured by Arie
  TicksPerInertia:           integer = 2;         // measured by Arie, with SD (stop debugging)

var
  reportedState:             TWiseDomeState;
  reportedShutterState:      TWiseShutterState;
  reportedShutterPcent:      real;
  reportedAz:                real;

(*
  Calculates the dome movement direction for the shortest
   travel from one azimuth to another.
*)
function ShortestWayToAz(fromAz: real; toAz: real): TWiseDirection;
var
  deltaCCW, deltaCW: real;
begin
  if fromAz > toAz then begin
    deltaCW  := (360 - fromAz) + toAz;
    deltaCCW := fromAz - toAz;
  end else begin
    deltaCW  := toAz - fromAz;
    deltaCCW := (360 - toAz) + fromAz;
  end;

  if deltaCCW < deltaCW then
    Result := DirCCW
  else if deltaCW < deltaCCW then
    Result := DirCW
  else
    Result := DirNone;
end;

(*
  Produces a human-readable version of the dome's status.
*)
function TWiseDome.stateStr: string;
var
 qual: string;
begin
  case Self.fState of
  Idle:        Result := 'Idle';
  MovingCCW:   Result := 'Moving CCW';
  MovingCW:    Result := 'Moving CW';
  end;

  qual := '';
  if Self.Stuck then begin
    qual := qual + 'Stuck';
    if Self.currentStuckStateStr <> '' then
      qual := qual + ': ' + currentStuckStateStr;
  end;
  if Self.Calibrating then
    if qual <> '' then
      qual := qual + ', Cali'
    else
      qual := qual + 'Cali';

  if qual <> '' then
    Result := Result + ' <' + qual + '>';
end;

(*
  Produces a human-readable version of the dome's shutter status.
*)
function TWiseDome.shutterStateStr: string;
begin
  case Self.fShutterState of
  ShutterIdle:     Result := 'Idle';
  ShutterOpening:  Result := 'Opening';
  ShutterOpen:     Result := 'Open';
  ShutterClosing:  Result := 'Closing';
  ShutterClosed:   Result := 'Closed';
  end;
end;

(*
  Checks whether the dome is at the calibration point.
  NOTE: On the production machine the pin is normaly pulled-up
*)
function TWiseDome.AtCalibrationPoint: boolean;
begin
{$ifdef SIMULATE_DOME_ENCODER}
  if Abs(Self.Encoder.Value - 512) <= 10 then
    Result := true
  else
    Result := false;
{$else}
  Result := not Self.CaliPin.IsOn
{$endif SIMULATE_DOME_ENCODER}
end;

(*
  Performs periodic tasks:
  - Restarts the dome's motors if the dome is stuck
  - Stops the dome's motors if the dome has reached its target Azimuth
  - Calibrates the dome if it has reached the calibration point
  - Stops the shutter motors if the shutter has reached the intended position
  - Sends a periodic status report to the Remote Commander
*)
procedure TWiseDome.onDomeTimer(Sender: TObject);
begin

  if Self.AtCalibrationPoint then begin
    Self.SetAzimuth(CallibrationPointAzimuth);  // always calibrate

    if Self.Calibrating then begin
      Self.Stop;                                // dome was sent to find cali. point
      Self.fCalibrating := false;
    end;
  end;

  (* If moving and within inertia range of the target Azimuth, stop. *)
  if (Self.targetAz <> -1) and
       ((Self.fState = MovingCW) or (Self.fState = MovingCCW)) and
       (Abs(Self.targetAz - Self.Encoder.Azimuth) <= DegPerInertia) then begin
     Self.Stop;
     Self.targetAz := -1;
  end;

  (*
    Take care of the shutter, ignore the opening percent (the dome may have been manually
      opened or closed).
  *)
  if (Self.activityStart <> 0) and (MilliSecondsBetween(Now, Self.activityStart) >= MillisPerShutterTravel) then
    Self.StopShutter;

  // Start Stop Debugging
  if (Self.SD_startTime <> 0) and (MilliSecondsBetween(Now, Self.SD_startTime) >= 2000) then begin
     Self.SD_startTime := 0;
     SD_report;
  end;
  // End Stop Debugging

  if (Self.fState        <> reportedState)        or
     (Self.fShutterState <> reportedShutterState) or
     (Self.ShutterPcent  <> reportedShutterPcent) or
     (Self.Azimuth       <> reportedAz)           then
    SendStatus;

end;

{
  Handling of 'Dome Stuck', theory of operation:

  - The movementTimer is activated when the dome moves and de-activated when
     the dome is Idle
  - The movementTimer interval is two seconds.
  - At every movementTimer event we check if the dome's encoder has changed by at least a minimal
     amount during the last timer interval (two seconds).  If it didn't change:
     - we turn the relevant motor off
     - remember we are stuck (fStuck := true)
     - let the next movementTimer event turn the relevant motor back on
}
procedure TWiseDome.onMovementTimer(Sender: TObject);
var
  currTicks, deltaTicks: integer;
const
  leastExpectedTicks: integer = 2;  // number of Ticks expected in two seconds
begin
  // the movementTimer should not be Enabled unless the dome is moving
  if Self.fStuck or not (Self.fState in [MovingCW, MovingCCW]) then
    exit;

  currTicks  := Self.Encoder.Value;

  if currTicks = Self.prevTicks then
    Self.fStuck := true
  else begin
    case Self.fState of
    MovingCW:        // encoder decreases
      begin
        if Self.prevTicks > currTicks then
          deltaTicks := Self.prevTicks - currTicks
        else
          deltaTicks := Self.Encoder.Ticks - currTicks + Self.prevTicks;

        if deltaTicks < leastExpectedTicks then
          Self.fStuck := true;
      end;

    MovingCCW:       // encoder increases
      begin
        if Self.prevTicks > currTicks then
          deltaTicks := Self.prevTicks - currTicks
        else
          deltaTicks := Self.Encoder.Ticks - Self.prevTicks + currTicks;

        if deltaTicks < leastExpectedTicks then
          Self.fStuck := true;
      end;
    end;
  end;

  if Self.fStuck then begin
    Self.currentStuckState    := NotStuck;
    Self.nextStuckEvent       := Now;
    Self.onStuckTimer(nil); // call first phase immediately
    Self.stuckTimer.Enabled := true;
  end;

  Self.prevTicks := currTicks;
end;

constructor TWiseDome.Create(autoshutdown: TAutoShutdown; autocal: boolean = false);
begin
  Self.AutoShutdown              := autoshutdown;
  Self.logger                    := TWiseLogger.Create('dome-agent');
  Self.Encoder                   := TWiseDomeEncoder.Create('DomeEncoder',
                                     [daqId(domeboard, FIRSTPORTB,  DIGITALIN), daqId(domeboard, FIRSTPORTCH, DIGITALIN)],
                                     $3, TicksPerDomeRevolution, TicksPerEncoderRevolution);

  Self.OpenPin                   := TWisePin.Create('DomeOpenPin',  daqId(domeboard, FIRSTPORTA,  DIGITALOUT), 0);
  Self.ClosePin                  := TWisePin.Create('DomeClosePin', daqId(domeboard, FIRSTPORTA,  DIGITALOUT), 1);
  Self.LeftPin                   := TWisePin.Create('DomeLeftPin',  daqId(domeboard, FIRSTPORTA,  DIGITALOUT), 2);
  Self.RightPin                  := TWisePin.Create('DomeRightPin', daqId(domeboard, FIRSTPORTA,  DIGITALOUT), 3);
  Self.CaliPin                   := TWisePin.Create('DomeCaliPin',  daqId(domeboard, FIRSTPORTCL, DIGITALIN),  0);

  if production then
    Self.VentPin                 := TWisePin.Create('VentPin',      daqId(teleboard, THIRDPORTCL, DIGITALOUT), 0)
  else
    Self.VentPin                 := TWisePin.Create('VentPin',      daqId(domeboard, FIRSTPORTA,  DIGITALOUT), 7);
  Self.fVentIsOpen               := false;

  Self.timer                     := TTimer.Create(nil);
  Self.timer.Interval            := 10;
  Self.timer.Enabled             := true;
  Self.timer.Name                := 'DomeTimer';
  Self.timer.OnTimer             := onDomeTimer;

  Self.movementTimer             := TTimer.Create(nil);
  Self.movementTimer.Enabled     := false;
  Self.movementTimer.Interval    := 2000;              // Two seconds
  Self.movementTimer.Name        := 'movementTimer';
  Self.movementTimer.OnTimer     := onMovementTimer;

  Self.fShutterOpenPcent         := 0.0;

  Self.fCalibrated               := false;
  Self.fAutoCal                  := autocal;
  Self.targetAz                  := -1;

  Self.fConnected                := false;
  Self.fStuck                    := false;

  Self.server                    := TServerSocket.Create(nil);
  Self.server.Port               := 7080;
  Self.server.ServerType         := stNonBlocking;
  Self.server.OnClientConnect    := onClientConnect;
  Self.server.OnClientDisconnect := onClientDisconnect;
  Self.server.OnClientRead       := onClientRead;
  Self.server.OnClientError      := onClientError;
  Self.server.Active             := true;

  Self.currentStuckState         := NotStuck;
  Self.stuckTimer                := TTimer.Create(nil);
  Self.stuckTimer.Enabled        := false;
  Self.stuckTimer.Interval       := 1000;     // 1Hz
  Self.stuckTimer.OnTimer        := onStuckTimer;

  Self.log('Dome agent started');
end;
 
destructor TWiseDome.Destroy;
begin

  Self.server.Active := false;
  Self.Stop;

  Self.CaliPin.Free;
  Self.RightPin.Free;
  Self.Encoder.Free;

  if Self.ShutterPcent > 0 then begin
     Self.FullClose;
     while Self.ShutterPcent > 0 do
       sleep(100);
  end;
  Self.StopShutter;
  Self.OpenPin.Free;
  Self.ClosePin.Free;
  Self.timer.Free;
  Self.movementTimer.Free;

  Self.server.Active := false;

  Self.log('Dome agent exited.');
  inherited Destroy;
end;

// Movement methods
procedure TWiseDome.Stop;
begin
  Self.LeftPin.SetOff;
  Self.RightPin.SetOff;
  Self.fState                := Idle;
  Self.fStuck                := false;
  Self.fCalibrating          := false;
  Self.movementTimer.Enabled := false;
{$ifdef SIMULATE_DOME_ENCODER}
  Self.Encoder.SimulateMovement(DirNone);
{$endif SIMULATE_DOME_ENCODER}

  Self.SD_Start;
end;

procedure TWiseDome.Left;
begin
  if not Self.LeftPin.IsOn then
    Self.LeftPin.SetOn;

  Self.fState                := MovingCCW;
  Self.prevTicks             := Self.Encoder.Ticks;
  Self.movementTimer.Enabled := true;
{$ifdef SIMULATE_DOME_ENCODER}
  Self.Encoder.SimulateMovement(DirCCW);
{$endif SIMULATE_DOME_ENCODER}
end;

procedure TWiseDome.Right;
begin
  if not Self.RightPin.IsOn then
    Self.RightPin.SetOn;

  Self.fState                := MovingCW;
  Self.prevTicks             := Self.Encoder.Ticks;
  Self.movementTimer.Enabled := true;
{$ifdef SIMULATE_DOME_ENCODER}
  Self.Encoder.SimulateMovement(DirCW);
{$endif SIMULATE_DOME_ENCODER}
end;

procedure TWiseDome.MoveCW;  begin Self.Right; end;
procedure TWiseDome.MoveCCW; begin Self.Left;  end;

// Shutter methods
procedure TWiseDome.Open;
begin
  Self.fShutterState := ShutterOpening;
  Self.activityStart := Now;
  Self.OpenPin.SetOn;
end;

procedure TWiseDome.Close;
begin
  Self.fShutterState := ShutterClosing;
  Self.activityStart := Now;
  Self.ClosePin.SetOn;
end;

procedure TWiseDome.StopShutter;
var
  elapsedPcent: real;
begin
  elapsedPcent := MilliSecondsBetween(Now, Self.activityStart) * 100 / MillisPerShutterTravel;
  case Self.fShutterState of
  ShutterOpening: begin
      Self.OpenPin.SetOff;
      Self.fShutterOpenPcent := Self.fShutterOpenPcent + elapsedPcent;
    end;
  ShutterClosing: begin
      Self.ClosePin.SetOff;
      Self.fShutterOpenPcent := Self.fShutterOpenPcent - elapsedPcent;
    end;
  end;

  if Self.fShutterOpenPcent > 100 then
    Self.fShutterOpenPcent := 100;
  if Self.fShutterOpenPcent <= 0 then
    Self.fShutterOpenPcent := 0;

  Self.fShutterState := ShutterIdle;
  Self.activityStart := 0;
end;

procedure TWiseDome.FullOpen;
begin
  Self.StopShutter;
  Self.Open;
end;

procedure TWiseDome.FullClose;
begin
  Self.StopShutter;
  Self.Close;
end;

{$ifdef SIMULATE_ACCESS_VIOLATION}
procedure TriggerAccessViolation;
var
  ptr: PInteger;
begin
  ptr  := nil;
  ptr^ := 0;
end;
{$endif SIMULATE_ACCESS_VIOLATION}

// Azimuth methods
procedure TWiseDome.SetAzimuth(az: real);
begin
{$ifdef SIMULATE_ACCESS_VIOLATION}
  TriggerAccessViolation;
{$endif SIMULATE_ACCESS_VIOLATION}
  Self.Encoder.Calibrate(az);
  Self.fCalibrated := true;
end;

{
  Calibration: Theory of operation:
  --------------------------------
  The dome cannot report its Azimuth unless it has been calibrated.
  Calibration needs to be acquired each-and-every-time the DomeAgent application
   starts.  Previous session values are not remembered because the dome can be moved
   manually, thus rendering the remembered values irrelevant.

  At calibration-time the dome object remembers a (encoder-value, azimuth) tuple.
  Such a tuple can be acquired:
  - Manually:     by calling TWiseDome.SetAzimuth(azimuth)
  - Mecahnically: by telling the dome to find the calibration switch.

  Auto Calibration.
  ----------------
  The fAutoCal property can be set either at Create() time or via AutoCal().
  It is 'false' by default.
  If the dome is asked for its Azimuth before it has been calibrated:
  - if fAutoCal is 'true' it will first search for the calibration point and then report its azimuth
  - if fAutoCal is 'false' it will report -1.0 as its azimuth.
}

function TWiseDome.GetAzimuth: real;
begin
  if not Self.Calibrated then
    if Self.fAutoCal then begin
      Self.FindCalibrationPoint;
      Result := Self.Encoder.Azimuth;
    end else
      Result := -1
  else
    Result := Self.Encoder.Azimuth;
end;

procedure TWiseDome.MoveTo(tgtAz: real);
var
  shortestWay: TWiseDirection;
  dir: string;
begin
  shortestWay := ShortestWayToAz(Self.Azimuth, tgtAz);
  if shortestWay = DirCW then begin
    Self.targetAz := tgtAz;
    dir := 'CW';
    Self.MoveCW;
  end else if shortestWay = DirCCW then begin
    Self.targetAz := tgtAz;
    dir := 'CCW';
    Self.MoveCCW;
  end else
    exit;

  Self.log(Format('MoveTo: from %5.1f to %5.1f moving %s', [Self.Azimuth, Self.targetAz, dir]));
end;

(*
  Sends the dome to find the calibration switch.
  If already calibrated, we can calculate the shortest way,
  otherwise just move left (ccw)
*)
procedure TWiseDome.FindCalibrationPoint;
var
  shortestWay: TWiseDirection;
begin
  Self.fCalibrating := true;
  if not Self.Calibrated then begin
    Self.MoveCCW;
    exit;
  end;

  shortestWay := ShortestWayToAz(Self.Azimuth, CallibrationPointAzimuth);
  if shortestWay = DirCW then
    Self.MoveCW
  else if shortestWay = DirCCW then
   Self.MoveCCW;
end;


// Status methods
(*
  We don't have position sensors on the shutter, so we
  deduce the position from the period of motor activity.
*)
function TWiseDome.GetShutterOpenPcent: real;
var
  elapsedPcent: real;
begin
  Result := fShutterOpenPcent;
  if Self.activityStart <> 0 then begin
    elapsedPcent := MilliSecondsBetween(Now, Self.activityStart) * 100 / MillisPerShutterTravel;
    case Self.fShutterState of
      ShutterOpening: Result := Result + elapsedPcent;
      ShutterClosing: Result := Result - elapsedPcent;
    end;
  end;

  { Account for overshoot or undershoot }
  if Result > 100 then
    Result := 100;
  if Result < 0 then
    Result := 0;
end;

// Remote commander communication methods
procedure TWiseDome.onClientConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
//  if Self.Connected then
//     Self.client.Close;

  Self.client      := Socket;
  Self.fConnected  := true;

  Self.log(Format('connected from %s:%d.', [Socket.RemoteAddress, Self.client.RemotePort]));
end;

procedure TWiseDome.onClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  Self.fConnected := false;
  Self.log(Format('disconnected from %s:%d.', [Self.client.RemoteAddress, Self.client.RemotePort]));

  if ((Self.fState <> Idle) OR (Self.fShutterState <> ShutterIdle) OR (Self.ShutterPcent > 0)) then
     Self.AutoShutdown;
end;

procedure TWiseDome.onClientError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  Self.log(Format('Socket error #%d with %s:%d', [ErrorCode, Self.client.RemoteAddress, Self.client.RemotePort]));
  ErrorCode := 0;
  Self.onClientDisconnect(Sender, Socket);
end;

procedure TWiseDome.onClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
 cmd:     char;
 msg:     string;
 param:   integer;
begin
   msg := Socket.ReceiveText;

   if length(Self.messageForClient) > 0 then begin
     Self.client.SendText(Self.messageForClient);
     Self.messageForClient  := '';
     Self.waitingForMessage := true;
  end else
     Self.waitingForMessage := false;

   if msg = msgOK then
     exit;

   msg   := AnsiReplaceText(msg, msgOK, '');
   cmd   := msg[1];
   param := StrToIntDef(RightStr(msg, Length(msg) - 1), -MaxInt);

   case cmd of
       DMSendState :
          Self.SendStatus;

       { Shutter }
       DMShOpen :
          if (Self.fShutterState = ShutterIdle) then
            Self.FullOpen
          else
            Self.SendError;

       DMShClose :
          if (Self.fShutterState = ShutterIdle) then
            Self.FullClose
          else
            SendError;

       DMShStop :
          if (Self.fShutterState <> ShutterIdle) then
            Self.StopShutter
          else
            SendError;

       { Dome }
       DmMoveL:
          if Self.fState = Idle then
              Self.Left
          else
            SendError;

       DmMoveR:
          if Self.fState = Idle then
              Self.Right
          else
            SendError;

       DmMove:
          if ( (Self.fState = Idle) and ((param >= 0) and (param < 3600)) ) then
             Self.MoveTo(param / 10)
          else
            SendError;

       DMStop:
          if Self.fState in [MovingCW, MovingCCW] then
            Self.Stop
          else
            SendError;
   end;
end;

procedure TWiseDome.SendStatus;
var
  stat: string;
  domeState, shutterState: string;
begin
  if not Self.Connected then
     exit;

  if Self.fStuck then
    domeState := DmStuck
  else
    case Self.fState of
      Idle:       domeState := DmIdle;
      MovingCW:   domeState := DmMovingR;
      MovingCCW:  domeState := DmMovingL;
    end;

  case Self.fShutterState of
    ShutterIdle,
    ShutterOpen,
    ShutterClosed:     shutterState := DmShIdle;
    ShutterOpening:    shutterState := DmShOpening;
    ShutterClosing:    shutterState := DmShClosing;
  end;

  stat := Format('S%s%s%d %d',[shutterState, domeState, Round(Self.ShutterPcent * 10), Round(Self.Azimuth * 10)]);

  if not Self.waitingForMessage then begin
     Self.client.SendText(stat);
     reportedState          := Self.fState;
     reportedShutterState   := Self.fShutterState;
     reportedShutterPcent   := Self.ShutterPcent;
     reportedAz             := Self.Azimuth;

     Self.waitingForMessage := true;
  end;
end;

procedure TWiseDome.SendError;
begin
  if not Self.Connected then
     exit;

  if not Self.waitingForMessage then
     Self.client.SendText(msgErr);
  Self.waitingForMessage := true;
end;

procedure TWiseDome.log(s: string);
begin
  Self.logger.log(s);
end;

// Vent methods
procedure TWiseDome.OpenVent;
begin
  if not Self.fVentIsOpen then begin
    Self.VentPin.SetOn;
    Self.fVentIsOpen := true;
  end;
end;

function TWiseDome.debug: string;
begin
  Result := Format('encoder: %4d', [Self.Encoder.Value]);
{
  Result := Format('e: %d, a: %.01f, Ce: %d, Ca: %.01f, dE: %d, dA: %.01f',
         [Self.Encoder.Value, Self.Azimuth,
          Self.Encoder.CaliTicks, Self.Encoder.CaliAz,
          Abs(Self.Encoder.Value - Self.Encoder.CaliTicks),
          Abs(Self.Azimuth - Self.Encoder.CaliAz)
         ]);
}
end;

procedure TWiseDome.CloseVent;
begin
  if Self.fVentIsOpen then begin
    Self.VentPin.SetOff;
    Self.fVentIsOpen := false;
  end;
end;

// Stop debugging methods
procedure TWiseDome.SD_Start;
begin
  Self.SD_startTicks    := Self.Encoder.Value;
  Self.SD_startAz       := Self.Encoder.Azimuth;
  Self.SD_state         := Self.fState;
  Self.SD_startTime     := Now;
end;

procedure TWiseDome.SD_report;
var
  delta, prev, curr: integer;
  moving:            string;
begin
  curr  := Self.Encoder.Value;
  prev  := Self.SD_startTicks;
  delta := Floor(min(Self.Encoder.Ticks - abs(curr - prev), abs(curr - prev)));

  case Self.SD_state of
    MovingCW:  moving := 'CW';
    MovingCCW: moving := 'CCW';
    Idle:      moving := 'Idle';
  end;

  log(Format('SD: az: %5.1f, dir: %4s, curr: %d, prev: %d, delta: %d', [Self.SD_startAz, moving, curr, prev, delta]));
end;


procedure TWiseDome.onStuckTimer(Sender: TObject);
var
  rightNow: TDateTime;
  backwardPin, forwardPin: TWisePin;
begin
  rightNow := Now;

  if CompareDateTime(rightNow, Self.nextStuckEvent) = LessThanValue then
    exit;

  case Self.fState of
    MovingCCW: begin
      forwardPin  := Self.LeftPin;
      backwardPin := Self.RightPin;
      end;

    MovingCW: begin
      forwardPin  := Self.RightPin;
      backwardPin := Self.LeftPin;
      end;

    else
      exit;
  end;

  case Self.currentStuckState of
    NotStuck: begin             // Stop, let the wheels cool down
        forwardPin.SetOff;
        backwardPin.SetOff;
        Self.currentStuckState    := FirstStop;
        Self.currentStuckStateStr := 'cooling';
        Self.nextStuckEvent       := IncMilliSecond(rightNow, 10000);
        Self.log(Format('stuck: %5.1f deg, phase1: stopped moving, letting wheels cool for 10 seconds', [Self.Azimuth]));
      end;

    FirstStop: begin            // Go backward for two seconds
        backwardPin.SetOn;
        Self.currentStuckState    := GoBackward;
        Self.currentStuckStateStr := 'backing';
        Self.nextStuckEvent       := IncMilliSecond(rightNow, 2000);
        Self.log(Format('stuck: %5.1f deg, phase2: going backwards for 2 seconds', [Self.Azimuth]));
      end;

    GoBackward: begin           // Stop again for two seconds
        backwardPin.SetOff;
        Self.currentStuckState    := SecondStop;
        Self.currentStuckStateStr := 'pausing';
        Self.nextStuckEvent       := IncMilliSecond(rightNow, 2000);
        Self.log(Format('stuck: %5.1f deg, phase3: stopping for 2 seconds', [Self.Azimuth]));
      end;

    SecondStop: begin           // Done, resume original movement
        forwardPin.SetOn;
        Self.currentStuckState    := NotStuck;
        Self.currentStuckStateStr := '';
        Self.fStuck               := false;
        Self.stuckTimer.Enabled   := false;
        Self.nextStuckEvent       := 0;
        Self.log(Format('stuck: %5.1f deg, phase4: resumed original motion', [Self.Azimuth]));
      end;
  end;
end;

initialization

  if not WiseDaqsInfoInitialized then
    InitDaqsInfo();

end.
