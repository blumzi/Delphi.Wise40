unit EncoderUnitTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WiseHardware, WiseDaq, WiseEncoder, WisePin, ExtCtrls, DateUtils,
  CheckLst, ComCtrls, cbw, Winsock, Buttons;

const
  MaxDaqs = 4;

type
  TForm1 = class(TForm)
    MainTimer: TTimer;
    ConfigurationBox: TGroupBox;
    PortSelector0: TComboBox;
    PortStatusTimer: TTimer;
    BoardSelector0: TComboBox;
    ValueBox: TGroupBox;
    StatusBar: TLabel;
    BoardSelector1: TComboBox;
    PortSelector1: TComboBox;
    BoardSelector2: TComboBox;
    BoardSelector3: TComboBox;
    PortSelector2: TComboBox;
    PortSelector3: TComboBox;
    TicksValue: TStaticText;
    nBitsLabel: TLabel;
    lastMask: TLabeledEdit;
    DaqBox0: TGroupBox;
    DaqBox2: TGroupBox;
    DaqBox1: TGroupBox;
    DaqBox3: TGroupBox;
    Daqs: TGroupBox;
    GrayBox: TCheckBox;
    ClicksLabel: TLabel;
    ClicksValue: TLabel;
    AzimuthLabel: TLabel;
    AzimuthValue: TLabel;
    OkBox: TCheckBox;
    TicksPerRevolution: TLabeledEdit;
    EncoderSelector: TRadioGroup;
    DomeBox: TGroupBox;
    DomeLeft: TButton;
    DomeRight: TButton;
    TelescopeControls: TGroupBox;
    DomeLabel: TLabel;
    RaUpButton: TButton;
    RaDownButton: TButton;
    HaUpButton: TButton;
    HaDownButton: TButton;
    RaLabel: TLabel;
    HaLabel: TLabel;
    DecUpButton: TButton;
    DecDownButton: TButton;
    DecLabel: TLabel;
    CaliLabel: TLabel;
    ManualAz: TLabeledEdit;
    CaliButton: TBitBtn;
    StopButton: TBitBtn;
    procedure MainTimerTick(Sender: TObject);
    procedure PortStatusTimerTick(Sender: TObject);
    procedure RedefineEncoder(Sender: TObject);
    procedure ChangeBoard(Sender: TObject);
    procedure ShowEncoderValue();
    procedure OnCreate(Sender: TObject);
    procedure ChangeEncoder(Sender: TObject);
    procedure DomeLeftStart(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DomeLeftStop(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DomeRightStart(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DomeRightStop(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ManualAzKeyPress(Sender: TObject; var Key: Char);
    procedure CaliButtonClick(Sender: TObject);
    procedure StopButtonClick(Sender: TObject);
    procedure DomeFindCalibration;
    procedure FormDestroy(Sender: TObject);

  private
    { Private declarations }
    BoardSelectors: array[0..MaxDaqs-1] of TComboBox;
    PortSelectors:  array[0..MaxDaqs-1] of TComboBox;
  public
    procedure SetStatus(s: string); overload;
    procedure SetStatus(s: string; millis: integer); overload;
    procedure SetStatus(s: string; millis: integer; color: TColor); overload;
    procedure ClearStatus;
    { Public declarations }
  end;

var
  Form1:                TForm1;
  PortStatusExpiration: TDateTime;

  Encoder:              TWiseDomeEncoder;
  DomeLeftPin:          TWisePin;
  DomeRightPin:         TWisePin;
  DomeCaliPin:          TWisePin;
  DomeActivePin:        TWisePin;
  i:                    integer;
  initResult:           string;

implementation

var
  domeState:            (DomeStatic, DomeGoingSomewhere, DomeCalibrating);
  targetAz:             real;
{$R *.dfm}

function DomeAtCalibration: boolean;
begin
  if production then
    Result := not DomeCaliPin.IsOn
  else
    Result := DomeCaliPin.IsOn;
end;

procedure TForm1.MainTimerTick(Sender: TObject);
begin
  if production and (Encoder <> nil) and OkBox.Checked then
    ShowEncoderValue;

  if DomeAtCalibration then
     Encoder.Calibrate(254.6);

  case domeState of
    DomeStatic:
      exit;

    DomeGoingSomewhere:  // dome was sent to specific Az
      if Abs(Encoder.Azimuth - targetAz) < 2.0 then begin
        DomeActivePin.SetOff;
        DomeActivePin := nil;
        domeState     := DomeStatic;
      end;

    DomeCalibrating:    // dome was sent to find calibration point
      begin
        DomeActivePin.SetOff;
        DomeActivePin := nil;
        domeState     := DomeStatic;
      end;
  end;
end;

procedure TForm1.PortStatusTimerTick(Sender: TObject);
begin
     if (Time > PortStatusExpiration) then
        ClearStatus;
end;

procedure TForm1.ClearStatus;
begin
  StatusBar.Caption := '';
end;

procedure TForm1.SetStatus(s: string);
begin
  StatusBar.Caption := s;
  PortStatusExpiration := IncYear(Time, 1);
end;

procedure TForm1.SetStatus(s: string; millis: integer);
begin
  StatusBar.Caption := s;
  PortStatusExpiration := IncMilliSecond(Time, millis)
end;

procedure TForm1.SetStatus(s: string; millis: integer; color: TColor);
begin
  StatusBar.Font.Color := color;
  StatusBar.Caption    := s;
  PortStatusExpiration := IncMilliSecond(Time, millis)
end;

procedure TForm1.ChangeBoard(Sender: TObject);
var
  bs, ps:    TComboBox;
  rowno, boardno, daqno: integer;
begin
  bs    := TComboBox(Sender);
  rowno := bs.Tag;
  ps    := PortSelectors[rowno];

  if bs.ItemIndex = 0 then
    exit;

  boardno := bs.ItemIndex - 1;
  ps.Items.Clear;
  ps.Items.Add('None');
  for daqno := 0 to WiseBoards[boardno].ndaqs - 1 do
    ps.Items.Add(WiseDaqPortNames[daqno + FIRSTPORTA]);
  ps.ItemIndex := 0;
  ps.Text := 'None';
end;

procedure TForm1.RedefineEncoder(Sender: TObject);
var
   ndaqs, nbits, x, y, nticks:      integer;
   daqIds:        array of TDaqId;
   newEncoder:    TWiseDomeEncoder;
   boardno, portno: integer;
   selector:      integer;
   ticksPer360:   integer;
begin

  if not OkBox.Checked then
    exit;

  ndaqs := 0;
  nbits := 0;
  for selector := 0 to MaxDaqs - 1 do begin
    if (BoardSelectors[selector].ItemIndex = 0) or (PortSelectors[selector].ItemIndex = 0) then
      break;
    Inc(ndaqs);
  end;

  if ndaqs = 0 then
    exit;

  SetLength(daqIds, ndaqs);
  for selector := 0 to ndaqs - 1 do begin
    boardno := BoardSelectors[selector].ItemIndex - 1;
    portno  := PortSelectors[selector].ItemIndex - 1 + FIRSTPORTA;

    daqIds[selector] := daqId(boardno, portno, DIGITALIN);
    x := WiseBoards[boardno].bitsPerDaq[PortSelectors[selector].ItemIndex - 1];
    nbits := nbits + x;
  end;

  nbits := nbits - x;
  y := StrToInt(lastMask.Text);
  while (y AND 1) <> 0 do begin
    Inc(nbits);
    y := y SHR 1;
  end;
  nticks := 1 SHL nbits;

  ticksPer360 := StrToInt(TicksPerRevolution.Text);

  try
    newEncoder := TWiseDomeEncoder.Create('TestEncoder', daqIds, $3, ticksPer360, nticks);
  except begin
      SetStatus('Could not create encoder', 1000000, clRed);
      exit;
    end;
  end;

  if Encoder <> nil then
    Encoder.Destroy;
  Encoder := newEncoder;
  TicksValue.Caption := Format('%d', [nticks]);

  ShowEncoderValue;
end;

procedure TForm1.ShowEncoderValue();
begin
  ClicksValue.Caption  := Format('%d',   [Encoder.Value]);
  AzimuthValue.Caption := Format('%.1f', [Encoder.Azimuth]);
end;


procedure TForm1.OnCreate(Sender: TObject);
var
   rowno, boardno: integer;
begin
  BoardSelectors[0] := BoardSelector0;
  BoardSelectors[1] := BoardSelector1;
  BoardSelectors[2] := BoardSelector2;
  BoardSelectors[3] := BoardSelector3;

  PortSelectors[0] := PortSelector0;
  PortSelectors[1] := PortSelector1;
  PortSelectors[2] := PortSelector2;
  PortSelectors[3] := PortSelector3;

  if initResult <> '' then begin
    SetStatus(initResult + ' STOPPED!', 1000000000, clRed);
    exit;
  end;

  for rowno := 0 to MaxDaqs - 1 do begin
    BoardSelectors[rowno].Items.Clear;
    BoardSelectors[rowno].Items.Add('None');
    BoardSelectors[rowno].ItemIndex := 0;

    for boardno := 0 to High(WiseBoards) - 1 do
      if (WiseBoards[boardno].model <> nil) then begin
        BoardSelectors[rowno].Items.Add(Format('Board%d', [WiseBoards[boardno].num]));
        BoardSelectors[rowno].Tag := rowno;
      end;

    PortSelectors[rowno].Items.Clear;
    PortSelectors[rowno].Text      := '';
    PortSelectors[rowno].ItemIndex := 0;
    PortSelectors[rowno].Tag       := rowno;
  end;

  RedefineEncoder(Form1);
end;

procedure TForm1.ChangeEncoder(Sender: TObject);
begin
  case EncoderSelector.ItemIndex of
    0: begin    // Dome
         BoardSelector0.Tag       := 0;
         BoardSelector0.ItemIndex := domeboard + 1; // domeboard
         ChangeBoard(BoardSelector0);
         PortSelector0.ItemIndex  := 2; // FIRSTPORTB

         BoardSelector1.ItemIndex := domeboard + 1; // domeboard
         ChangeBoard(BoardSelector1);
         PortSelector1.ItemIndex  := 4; // FIRSTPORTCH

         lastMask.Text            := '$3';
         TicksPerRevolution.Text  := '1018';
         GrayBox.Checked          := true;
       end;
  end;

  RedefineEncoder(Form1);
end;


procedure TForm1.DomeLeftStart(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DomeLeftPin.SetOn;
end;

procedure TForm1.DomeLeftStop(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DomeLeftPin.SetOff;
end;

procedure TForm1.DomeRightStart(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DomeRightPin.SetOn;
end;

procedure TForm1.DomeRightStop(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DomeRightPin.SetOff;
end;

procedure TForm1.ManualAzKeyPress(Sender: TObject; var Key: Char);
var
  currentAz: real;
begin
  if Key <> #13 then
    exit;

  targetAz  := StrToFloat(ManualAz.Text);
  currentAz := Encoder.Azimuth;

  if (targetAz >= currentAz) then
    DomeActivePin := DomeLeftPin
  else
    DomeActivePin := DomeRightPin;
  domeState := DomeGoingSomewhere;
  DomeActivePin.SetOn;
  ManualAz.Text   := '';
end;

procedure TForm1.DomeFindCalibration();
var
  currentTicks:     integer;
  left, right:      integer;
  msg:              string;
  calibrationTicks: integer;
const
  defaultCalibrationTicks: integer = 50;
begin
  currentTicks     := Encoder.Value;
  calibrationTicks := Encoder.LastCalibrationValue;
  if calibrationTicks = -1 then
    calibrationTicks := defaultCalibrationTicks;

  if currentTicks > calibrationTicks then begin
    left  := currentTicks - calibrationTicks;
    right := 1024 - currentTicks + calibrationTicks
  end else begin
    right := calibrationTicks - currentTicks;
    left  := currentTicks + 1024 - calibrationTicks;
  end;

  if left <= right then begin
    msg := 'Moving left (CCW)';
    DomeActivePin := DomeLeftPin
  end else begin
    msg := 'Moving right (CW)';
    DomeActivePin := DomeRightPin;
  end;

  SetStatus(msg);
  domeState := DomeCalibrating;
  DomeActivePin.SetOn;
end;

procedure TForm1.CaliButtonClick(Sender: TObject);
begin
  DomeFindCalibration;
end;

procedure TForm1.StopButtonClick(Sender: TObject);
begin
  DomeLeftPin.SetOff;
  DomeRightPin.SetOff;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
   DomeLeftPin.SetOff;
   DomeRightPin.SetOff;
end;

initialization

   initResult   := InitDaqsInfo();

   DomeLeftPin  := TWisePin.Create('DomeLeftPin',  daqId(domeboard, FIRSTPORTA, DIGITALOUT), 2);
   DomeRightPin := TWisePin.Create('DomeRightPin', daqId(domeboard, FIRSTPORTA, DIGITALOUT), 3);
   DomeCaliPin  := TWisePin.Create('DomeCaliPin',  daqId(domeboard, FIRSTPORTCL, DIGITALIN), 0);


end.
