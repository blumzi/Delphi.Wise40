unit TestExpDlg;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, Spin, Math;

type
  TTestExpDialog = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    TestExpDialog: TLabel;
    TestExpE: TEdit;
    SpinButton1: TSpinButton;
    procedure TestExpEChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpinButton1DownClick(Sender: TObject);
    procedure SpinButton1UpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestExpDialog: TTestExpDialog;

implementation

{$R *.dfm}

procedure TTestExpDialog.TestExpEChange(Sender: TObject);
var
 n :extended;
begin
  OKBtn.Enabled := TRUE;
  n := StrTofloatDef(TestExpE.Text,-MaxExtended);
  if (TestExpE.Text ='')then
     OKBtn.Enabled := FALSE
  else if (n<0) then begin
     TestExpE.Clear;
     OKBtn.Enabled := FALSE;
  end else if (n<0.01) then
     OKBtn.Enabled := FALSE;
end;

procedure TTestExpDialog.FormShow(Sender: TObject);
begin
  if (StrToFloatDef(TestExpE.Text,-MaxExtended) < 0.0 ) then
     TestExpE.Text := '10.0';
  TestExpE.SetFocus;
  TestExpE.SelectAll;
end;

procedure TTestExpDialog.SpinButton1DownClick(Sender: TObject);
begin
  TestExpE.Text := FloatToStr(Max(0.1, StrToFloatDef(TestExpE.Text,-MaxExtended)-2));
end;

procedure TTestExpDialog.SpinButton1UpClick(Sender: TObject);
begin
  TestExpE.Text := FloatToStr(Max(0.1, StrToFloatDef(TestExpE.Text,-MaxExtended)+2));
end;

end.
