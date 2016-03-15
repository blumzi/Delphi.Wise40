unit Login;
//******************************************************************************
// UNIT NAME         Login
// USED BY PROJECTS  TelescopeAgent
// AUTHOR            Yiftah Lipkin
// DESCRIPTION       Login popup of TelescopeAgent
// LAST MODIFIED     2004 Apr 02
//******************************************************************************

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TLogoutForm = class(TForm)
    UserTXT: TLabeledEdit;
    PassTXT: TLabeledEdit;
    NameTXT: TLabeledEdit;
    LoginButton: TButton;
    ExitButton: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TXTChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LogoutForm: TLogoutForm;

implementation

uses main;
{$R *.dfm}

procedure TLogoutForm.FormShow(Sender: TObject);
begin
   UserTXT.Clear;
   PassTXT.Clear;
   NameTXT.Clear;
   LoginButton.Enabled := FALSE;
   USerTXT.SetFocus;
end;

procedure TLogoutForm.FormCreate(Sender: TObject);
begin
   MainForm.FormLogout(Sender);
end;

procedure TLogoutForm.TXTChange(Sender: TObject);
begin
  LoginButton.Enabled := (length(UserTXT.Text)>0) AND (length(PassTXT.Text)>0) AND (length(NameTXT.Text)>0);
end;

end.
