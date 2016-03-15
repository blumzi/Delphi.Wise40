unit FocusProto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  WiseDaq, WiseFocus, StdCtrls, ExtCtrls, ComCtrls;

type
  TProtoFrame = class(TForm)
    FocusBox:       TGroupBox;
    UpButton:       TButton;
    DownButton:     TButton;
    EncLabel:       TLabel;
    EncValue:       TLabel;
    FullUpButton:   TButton;
    FullDownButton: TButton;
    StopButton:     TButton;
    mainTimer:      TTimer;
    SpeedLabel:     TLabel;
    SpeedVal:       TLabel;
    StatusBar:      TStatusBar;
    procedure       StartUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure       EndUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure       StartDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure       EndDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure       FormCreate(Sender: TObject);
    procedure       FullUpClick(Sender: TObject);
    procedure       FullDownClick(Sender: TObject);
    procedure       StopButtonClick(Sender: TObject);
    procedure       onMainTimer(Sender: TObject);
  private
    { tbd }
  public

  end;

var
  ProtoFrame: TProtoFrame;
  wisefocus1:  TWiseFocus;

implementation

{$R *.dfm}

procedure TProtoFrame.StartUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  wisefocus1.StartUp;
end;

procedure TProtoFrame.EndUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  wisefocus1.StopUp;
end;

procedure TProtoFrame.StartDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  wisefocus1.StartDown
end;

procedure TProtoFrame.EndDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  wisefocus1.StopDown;
end;

procedure TProtoFrame.FormCreate(Sender: TObject);
begin
  wisefocus1 := TWiseFocus.Create;
  mainTimer.Enabled := true;
end;

procedure TProtoFrame.FullUpClick(Sender: TObject);
begin
  wisefocus1.FullUp;
end;

procedure TProtoFrame.FullDownClick(Sender: TObject);
begin
  wisefocus1.FullDown;
end;

procedure TProtoFrame.StopButtonClick(Sender: TObject);
begin
  wisefocus1.Stop;
end;

procedure TProtoFrame.onMainTimer(Sender: TObject);
begin
  FocusBox.Caption     := Format(' Focus (%s)', [wisefocus1.StateStr]);
  EncValue.Caption     := Format('%d', [wisefocus1.Value]);
  SpeedVal.Caption     := Format('%d', [wisefocus1.Speed]);
  StatusBar.SimpleText := wisefocus1.Status;
end;

initialization

  if not WiseDaqsInfoInitialized then
    InitDaqsInfo();

end.
