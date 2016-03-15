unit AcquireDlg;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, Spin, Math;

type
  TAcquireDialog = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    TestExpDialog: TLabel;
    AcExpE: TEdit;
    SpinButton1: TSpinButton;
    procedure AcExpEChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpinButton1DownClick(Sender: TObject);
    procedure SpinButton1UpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AcquireDialog: TAcquireDialog;

implementation

{$R *.dfm}

procedure TAcquireDialog.AcExpEChange(Sender: TObject);
var
 n :extended;
begin
  OKBtn.Enabled := TRUE;
  n := StrTofloatDef(AcExpE.Text,-MaxExtended);
  if (AcExpE.Text ='')then
     OKBtn.Enabled := FALSE
  else if (n<0) then begin
     AcExpE.Clear;
     OKBtn.Enabled := FALSE;
  end else if (n<0.01) then
     OKBtn.Enabled := FALSE;
end;

procedure TAcquireDialog.FormShow(Sender: TObject);
begin
  if (StrToFloatDef(AcExpE.Text,-1) < 0.0 ) then
     AcExpE.Text := '5.0';
  AcExpE.SetFocus;
  AcExpE.SelectAll;

end;

procedure TAcquireDialog.SpinButton1DownClick(Sender: TObject);
begin
  AcExpE.Text := FloatToStr(Max(0.1, StrToFloatDef(AcExpE.Text,-MaxExtended)-1));

end;

procedure TAcquireDialog.SpinButton1UpClick(Sender: TObject);
begin
  AcExpE.Text := FloatToStr(Max(0.1, StrToFloatDef(AcExpE.Text,-MaxExtended)+1));

end;

end.
