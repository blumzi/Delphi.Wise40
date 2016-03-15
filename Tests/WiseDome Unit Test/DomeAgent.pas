unit DomeAgent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  WiseHardware, WiseDome, ShutDownMesg,
  ExtCtrls, DateUtils, CheckLst, ComCtrls, cbw, Winsock, Buttons, Math,
  ScktComp;

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
begin
  shutterPcent           := Floor(Dome.ShutterPcent);
  DomeBox.Caption        := Format(' Dome (%s) ',    [Dome.State]);
  ShutterBox.Caption     := Format(' Shutter (%s) ', [Dome.ShutterState]);
  PercentLabel.Caption   := Format('%d%%',           [shutterPcent]);

  if (shutterPcent = 0) or (shutterPcent = 100) then begin
    for i := 0 to High(DisabledShutterButtons) do
      if DisabledShutterButtons[i] <> nil then
        DisabledShutterButtons[i].Enabled := true;
  end;

  if Dome.Calibrated then
    AzimuthValue.Caption := Format('%.01f°',         [Dome.Azimuth])
  else
    AzimuthValue.Caption := 'Not calibrated';

  if Dome.Connected then
    Self.Caption := 'Dome (remote)'
  else
    Self.Caption := 'Dome Agent'
    
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
begin Dome.Destroy; end;

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
begin
  if Key <> #13 then
    exit;

  if (Sender = SetAzimuth) then begin
    az := StrToFloat(SetAzimuth.Text);
    if (az > 360) or (az < 0) then begin
      SetAzimuth.Text := '';
      Status('Azimuth must be 0..360 !', 2000, clRed);
    end else
      Dome.Azimuth := az;
  end;

  if (Sender = ManualAz) then begin
    az := StrToFloat(ManualAz.Text);
    if (az > 360) or (az < 0) then begin
      ManualAz.Text := '';
      Status('Azimuth must be 0..360 !', 2000, clRed);
    end else
      Dome.MoveTo(az);
  end;
end;


procedure TDomeForm.Status(s: string; millis: integer = -1; color: TColor = clWindowText);
begin
  StatusBar.Font.Color := color;
  StatusBar.Caption := s;
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
  (*
     DMStuckInProgress := 0;
     DomeOff(Sender,mbLeft,[],0,0);
     ShutterOff(Sender,mbLeft,[],0,0);
     ShutterOn(CloseDomeButton, mbLeft, [ssShift ], 0,0);
  *)
    Dome.Stop;
    Dome.StopShutter;
    Dome.Close;
    Shutdownmsg.SDTimer.Enabled := false;
  end else
    Shutdownmsg.SDTimer.Enabled := false;
end;

initialization

end.
