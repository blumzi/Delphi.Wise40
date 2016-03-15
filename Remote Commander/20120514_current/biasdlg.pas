unit BiasDlg;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, Spin, ComCtrls, Mask;

type
  TBiasDialog = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    UpDown1: TUpDown;
    BiasSpin: TEdit;
    procedure BiasSpinExit(Sender: TObject);
    procedure BiasSpinChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BiasDialog: TBiasDialog;

implementation

{$R *.dfm}

procedure TBiasDialog.BiasSpinExit(Sender: TObject);
begin
  if (StrToIntDef(BiasSpin.Text,-1) < 0 )then
     BiasSpin.Text := '0';
end;

procedure TBiasDialog.BiasSpinChange(Sender: TObject);
var
 n :integer;
begin
  OKBtn.Enabled := TRUE;
  n := StrToIntDef(BiasSpin.Text,-MaxInt);

  if (BiasSpin.Text ='')then
     OKBtn.Enabled := FALSE
  else if (n<0) then begin
     BiasSpin.Clear;
     OKBtn.Enabled := FALSE;
  end else if  (n>30) then
     BiasSpin.Text :='30';

  if  (n<1) then
     OKBtn.Enabled := FALSE
end;

procedure TBiasDialog.FormShow(Sender: TObject);
begin
  if (StrToIntDef(BiasSpin.Text,-MaxInt) < 0 ) then
     BiasSpin.Text := '10';
  BiasSpin.SetFocus;
  BiasSpin.SelectAll;
end;

end.
