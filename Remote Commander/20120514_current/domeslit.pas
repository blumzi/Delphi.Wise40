unit DomeSlit;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Dialogs, OKCANCL1,
  WiseConst, ComCtrls;

type
  TDomeSlitDlg = class(TOKBottomDlg)
    HelpBtn: TButton;
    StatusMsg: TLabel;
    OpenBtn: TButton;
    CloseBtn: TButton;
    StopBtn: TButton;
    ShutterProgressBar: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    procedure BtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure HelpBtnClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  DomeSlitDlg: TDomeSlitDlg;

implementation

uses main, DomeProtocol;

{$R *.dfm}


procedure TDomeSlitDlg.BtnClick(Sender: TObject);
var
  Cmd : string;
begin
 if Sender = OpenBtn then
    Cmd := DmShOpen
 else if Sender = CloseBtn then
    Cmd := DmShClose
 else if Sender = StopBtn then
    Cmd := DmShStop;

 ROForm.DomeSocket.Socket.SendText(Cmd);
end;

procedure TDomeSlitDlg.OKBtnClick(Sender: TObject);
begin
   Self.Hide;
end;

procedure TDomeSlitDlg.CancelBtnClick(Sender: TObject);
begin
           Self.Hide;
end;

procedure TDomeSlitDlg.HelpBtnClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

end.

