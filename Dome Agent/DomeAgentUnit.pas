unit DomeAgentUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  WiseHardware, WiseDome, ShutDownMesg,
  ExtCtrls, DateUtils, CheckLst, ComCtrls, cbw, Winsock, Buttons, Math,
  ScktComp, Menus;

type
  TDomeForm = class(TForm)
    MainTimer:       TTimer;
    AzimuthLabel:    TLabel;
    AzimuthValue:    TLabel;
    DomeBox:         TGroupBox;
    DomeLeft:        TButton;
    DomeRight:       TButton;
    CaliLabel:       TLabel;
    ManualAz:        TLabeledEdit;
    StopButton:      TBitBtn;
    OpenButton:      TButton;
    CloseButton:     TButton;
    PercentLabel:    TLabel;
    ShutterBox:      TGroupBox;
    SetAzimuth:      TLabeledEdit;
    FullOpenButton:  TButton;
    FullCloseButton: TButton;
    StopShutter:     TButton;

    StatusBar:       TLabel;
    StatusTimer:     TTimer;
    MainMenu:        TMainMenu;
    AboutMenuItem:   TMenuItem;
    ProgressBar:     TProgressBar;
    CalibrateButton: TButton;
    VentBox:         TGroupBox;
    VentButton: TButton;
    VentPanel: TPanel;

    procedure MainTimerTick      (Sender: TObject);
    procedure OnCreate           (Sender: TObject);
    procedure FormDestroy        (Sender: TObject);

    procedure DomeLeftStart      (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DomeLeftStop       (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DomeRightStart     (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DomeRightStop      (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DomeOpenStart      (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DomeShutterStop    (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DomeCloseStart     (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure ManualAzKeyPress   (Sender: TObject; var Key: Char);
    
    procedure StopButtonClick    (Sender: TObject);
    procedure FullOpenClick      (Sender: TObject);
    procedure FullCloseClick     (Sender: TObject);

    procedure OnStatusTimer(Sender: TObject);
    procedure Status(s: string; millis: integer = -1; color: TColor = clWindowText);

    procedure AutoShutdown;
    procedure AboutButtonClick(Sender: TObject);
    procedure CalibrateButtonClick(Sender: TObject);
    procedure VentButtonClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
end;

var
  DomeAgentForm:          TDomeForm;
  StatusExp:              TDateTime;

  Dome:                   TWiseDome;
  i:                      integer;
  initResult:             string;
  DisabledShutterButtons: array[0..3] of TButton;

implementation

{$R *.dfm}

procedure TDomeForm.MainTimerTick(Sender: TObject);
var
  i, shutterPcent: integer;
  state, shutterState: string;
begin
  state                  := Dome.State;
  shutterState           := Dome.ShutterState;
  shutterPcent           := Floor(Dome.ShutterPcent);
  DomeBox.Caption        := Format(' Dome (%s) ',    [state]);
  ShutterBox.Caption     := Format(' Shutter (%s) ', [shutterState]);
  PercentLabel.Caption   := Format('%d%%',           [shutterPcent]);
  ProgressBar.Position   := shutterPcent;

  if (shutterState <> 'Opening') and (shutterState <> 'Closing') then begin
    for i := 0 to High(DisabledShutterButtons) do
      if DisabledShutterButtons[i] <> nil then
        DisabledShutterButtons[i].Enabled := true;
  end;

  if state = 'Idle' then begin
    DomeLeft.Enabled  := true;
    DomeRight.Enabled := true;
  end;

  if Dome.Calibrated then begin
    if Dome.Stuck then
      AzimuthValue.Font.Color := clMaroon
    else
      AzimuthValue.Font.Color := clGreen;
    AzimuthValue.Font.Size  := 18;
    AzimuthValue.Caption    := Format('%.01f°',     [Dome.Azimuth])
  end else begin
    AzimuthValue.Font.Color := clRed;
    AzimuthValue.Font.Size  := 8;
    AzimuthValue.Caption    := 'Not calibrated';
  end;

  if Dome.Connected then
    Self.Caption := 'Dome (remote)'
  else
    Self.Caption := 'Dome Agent';
    
{$ifdef DEBUG}
  Status(Dome.debug);
{$endif DEBUG}
end;

procedure TDomeForm.OnCreate(Sender: TObject);
begin
  Self.Caption := 'Dome Agent';
  if initResult <> '' then begin
    Status(initResult + ' STOPPED!', 1000000000, clRed);
    exit;
  end;

  Dome := TWiseDome.Create(AutoShutdown);
end;

procedure TDomeForm.DomeLeftStart(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Dome.Stop;
  Dome.Left;
end;

procedure TDomeForm.DomeLeftStop(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin Dome.Stop; end;

procedure TDomeForm.DomeRightStart(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Dome.Stop;
  Dome.Right;
end;

procedure TDomeForm.DomeRightStop(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin Dome.Stop; end;

procedure TDomeForm.StopButtonClick(Sender: TObject);
begin Dome.Stop; end;

procedure TDomeForm.FormDestroy(Sender: TObject);
begin (* Dome.Destroy; *) end;

procedure TDomeForm.FullOpenClick(Sender: TObject);
var
  i: integer;
begin
  DisabledShutterButtons[0] := OpenButton;
  DisabledShutterButtons[1] := CloseButton;
  DisabledShutterButtons[2] := FullCloseButton;
  for i := 0 to 2 do
    DisabledShutterButtons[i].Enabled := false;
  Dome.FullOpen;
end;

procedure TDomeForm.FullCloseClick(Sender: TObject);
var
  i: integer;
begin
  DisabledShutterButtons[0] := OpenButton;
  DisabledShutterButtons[1] := CloseButton;
  DisabledShutterButtons[2] := FullOpenButton;
  for i := 0 to 2 do
    DisabledShutterButtons[i].Enabled := false;
  Dome.FullClose;
end;

procedure TDomeForm.DomeOpenStart(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin Dome.Open; end;

procedure TDomeForm.DomeShutterStop(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Dome.StopShutter;
  OpenButton.Enabled      := true;
  CloseButton.Enabled     := true;
  FullCloseButton.Enabled := true;
  FullOpenButton.Enabled  := true;
end;

procedure TDomeForm.DomeCloseStart(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin Dome.Close; end;

procedure TDomeForm.ManualAzKeyPress(Sender: TObject; var Key: Char);
var
  az: real;
  badAz: string;
begin
  if Key <> #13 then
    exit;

  badAz := 'Greater-equal to 0.0, less than 360.0!';

  if (Sender = SetAzimuth) then begin
    az := StrToFloat(SetAzimuth.Text);
    if (az >= 360) or (az < 0) then begin
      SetAzimuth.Text  := '';
      Status(badAz, 2000, clRed);
    end else begin
      Dome.Azimuth     := az;
      ManualAz.Enabled := true;
    end;
  end;

  if (Sender = ManualAz) then begin
    az := StrToFloat(ManualAz.Text);
    if (az >= 360) or (az < 0) then begin
      ManualAz.Text     := '';
      Status(badAz, 2000, clRed);
    end else begin
      DomeLeft.Enabled  := false;
      DomeRight.Enabled := false;
      Dome.MoveTo(az);
    end;
  end;
end;


procedure TDomeForm.Status(s: string; millis: integer = -1; color: TColor = clWindowText);
begin
  StatusBar.Font.Color := color;
  StatusBar.Caption    := s;
  if millis = -1 then
    StatusExp := IncYear(Now)
  else
    StatusExp := IncMillisecond(Now, millis);
end;

procedure TDomeForm.OnStatusTimer(Sender: TObject);
begin
  if CompareTime(Now, StatusExp) = 1 then
    StatusBar.Caption := '';
end;

procedure TDomeForm.Autoshutdown;
const
  SocketTimeOut = 10;  // [sec]
begin
  Shutdownmsg.ShutDownMsg.Caption := 'Dome shutting down in '+ IntToStr(SocketTimeOut)+' sec';
  Shutdownmsg.SDTimer.Tag         := SocketTimeOut;
  Shutdownmsg.SDTimer.Enabled     := true;

  if (Shutdownmsg.ShowModal = mrOK ) then begin
    Dome.Stop;
    Dome.StopShutter;
    Dome.Close;
    //Dome.CloseVent;
    Shutdownmsg.SDTimer.Enabled := false;
  end else
    Shutdownmsg.SDTimer.Enabled := false;
end;

procedure TDomeForm.AboutButtonClick(Sender: TObject);
const
  crlf: string = #13#10;
  InfoNum = 3;
  InfoStr: array[1..InfoNum] of string = ('CompanyName', 'FileDescription', 'FileVersion');
var
  S: string;
  n, Len, i: DWORD;
  Buf: PChar;
  Values: array[1..InfoNum] of PChar;
  dt: TDateTime;
begin

  S := Application.ExeName;
  n := GetFileVersionInfoSize(PChar(S), n);
  if n > 0 then begin
    Buf := AllocMem(n);
    GetFileVersionInfo(PChar(S), 0, n, Buf);
    for i := 1 to InfoNum do
      VerQueryValue(Buf, PChar('StringFileInfo\040904E4\' + InfoStr[i]), Pointer(Values[i]), Len);
    FreeMem(Buf, n);
  end;

  dt := FileDateToDateTime(FileAge(Application.ExeName));

  ShowMessage(Format('%s'                                 + crlf +
                 '  version %s (%s)'                      + crlf +
                 '  %s'                                   + crlf +
                                                            crlf +
                 'Written:    in 2006 by Yiftah Lipkin'   + crlf +
                 'Maintained: since 2007 by Shai Kaspi'   + crlf +
                 'Rewritten:  in 2015 by Arie Blumenzweig', [Values[2], Values[3], FormatDateTime('d-mmm-yyyy@hh:nn.ss', dt), Values[1]]));
end;

procedure TDomeForm.CalibrateButtonClick(Sender: TObject);
begin
  Dome.FindCalibrationPoint;
  ManualAz.Enabled := true;
end;

procedure TDomeForm.VentButtonClick(Sender: TObject);
begin
  if Dome.VentIsOpen then begin
    Dome.CloseVent;
    VentButton.Caption := 'Open Vent';
    VentPanel.Color    := clBtnFace;
  end else begin
    Dome.OpenVent;
    VentButton.Caption := 'Close Vent';
    VentPanel.Color    := clLime;
  end;
end;

initialization

finalization
  Dome.Stop;

end.
