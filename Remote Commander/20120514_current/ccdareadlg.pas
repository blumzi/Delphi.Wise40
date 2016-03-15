unit CCDAreaDlg;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, ComCtrls, Spin, Math;

type
  TCCDAreaDialog = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    IAreaE: TEdit;
    Label1: TLabel;
    SpinButton1: TSpinButton;
    procedure IAreaEChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpinButton1DownClick(Sender: TObject);
    procedure SpinButton1UpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CCDAreaDialog: TCCDAreaDialog;

implementation

{$R *.dfm}

procedure TCCDAreaDialog.IAreaEChange(Sender: TObject);
var
  n :integer;
begin
  OKBtn.Enabled := TRUE;
  n := StrToIntDef(IAreaE.Text,-MaxInt);

  if (IAreaE.Text ='')then
     OKBtn.Enabled := FALSE
  else if (n<0) then begin
     IAreaE.Clear;
     OKBtn.Enabled := FALSE;
  end else if  (n>1024) then
     IAreaE.Text :='1024';

  if  (n<100) then
     OKBtn.Enabled := FALSE
end;

procedure TCCDAreaDialog.FormShow(Sender: TObject);
begin
  if (StrToIntDef(IAreaE.Text,-MaxInt) < 0 ) then
     IAreaE.Text := '1024';
  IAreaE.SetFocus;
  IAreaE.SelectAll;
end;

procedure TCCDAreaDialog.SpinButton1DownClick(Sender: TObject);
begin
  IAreaE.Text := IntToStr(Max(100, StrToIntDef(IAreaE.Text,-MaxInt)-100));
end;

procedure TCCDAreaDialog.SpinButton1UpClick(Sender: TObject);
begin
  IAreaE.Text := FloatToStr(Max(100, Min(1024,StrToIntDef(IAreaE.Text,-MaxInt)+100)));

end;

end.
