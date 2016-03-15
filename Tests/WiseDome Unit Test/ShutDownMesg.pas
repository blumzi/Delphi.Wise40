unit ShutDownMesg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WinTypes;

type
  TShutDownMsg = class(TForm)
    CloseBtn:    TButton;
    CancelBtn:   TButton;
    ShutDownMsg: TLabel;
    SDTimer:     TTimer;
    procedure    SDTimerTimer(Sender: TObject);
  private
    { Private declarations }
    procedure    CreateParams (var Params: TCreateParams); override;
  public
    { Public declarations }
end;

var
  ShutDownMsg: TShutDownMsg;

implementation

{$R *.dfm}

procedure TShutDownMsg.SDTimerTimer(Sender: TObject);
begin
   SDTimer.Tag := SDTimer.Tag -1;
   Beep(900,150);
   if (SDTimer.Tag >=0) then
     ShutDownMsg.Caption := 'Dome shutting down in '+ IntToStr(SDTimer.Tag) +' sec'
   else begin
     CloseBtn.Click;
     Beep(900,450);
   end
end;
procedure TShutDownMsg.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do begin
    ExStyle := ExStyle or WS_EX_TOPMOST;
    WndParent := GetDesktopwindow;
  end;
end;

end.
