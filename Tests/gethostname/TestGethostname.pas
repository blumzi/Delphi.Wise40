unit TestGethostname;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSock;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  hostname: array[0..63] of Char;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  stat:    integer;
  WSAData: TWSAData;
begin
  WSAStartup($0101,WSAData);
  stat := gethostname(hostname, sizeof(hostname));
  ShowMessage(Format('hostname: [%s] %d', [hostname, stat]));
end;

end.
