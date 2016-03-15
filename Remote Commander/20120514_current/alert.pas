unit Alert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TAlertForm = class(TForm)
    AlertTxt: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AlertForm: TAlertForm;

implementation

{$R *.dfm}

procedure TAlertForm.Button1Click(Sender: TObject);
begin
   AlertForm.Hide;
end;

end.
