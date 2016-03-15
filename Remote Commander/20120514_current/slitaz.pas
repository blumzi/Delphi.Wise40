unit SlitAz;

interface

uses
  SysUtils, StrUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, ComCtrls, Math, Spin, Mask,
  WiseStr, WiseConst;

type
  TSlitAzDlg = class(TForm)
    GoAzBtn: TButton;
    CancelBtn: TButton;
    HelpBtn: TButton;
    OKBtn: TButton;
    DomeSetCal: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    CurDomeAzLbl: TLabel;
    StopAzBtn: TButton;
    GoCCWBtn: TButton;
    GoCWBtn: TButton;
    DomeSpecialPos: TComboBox;
    DomeAzSB: TSpinButton;
    DomeAzEdt: TEdit;
    Label_Deg: TLabel;
    procedure DomeAzSelect(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GoAzBtnClick(Sender: TObject);
    procedure StopAzBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure DomeSetCalClick(Sender: TObject);
    procedure DomeAzSBDClick(Sender: TObject);
    procedure DomeAzSBUClick(Sender: TObject);
    procedure DomeAzEdtChange(Sender: TObject);
    procedure DomeAzEdtEnter(Sender: TObject);
    procedure DomeAzEdtExit(Sender: TObject);
    procedure GoCCWBtnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GoCCWBtnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  end;

var
  SlitAzDlg: TSlitAzDlg;

implementation

{$R *.DFM}
uses main, DomeProtocol;

procedure TSlitAzDlg.DomeAzSelect(Sender: TObject);
begin
    case  DomeSpecialPos.ItemIndex of
        0: DomeAzEdt.Text :=Format('%f',[DomeParkPos]);//Zenith Park
        1: DomeAzEdt.Text :=Format('%f',[DomeFlatPos]);//Dome Flats
        2: DomeAzEdt.Text :=Format('%f',[DomeVentsPos]);//VentBox
        3: if (ROForm.SlitThAzLbl.Enabled) then
//              DomeAzEdt.Text :=LeftStr(ROForm.SlitThAzLbl.Caption,Length(ROForm.SlitThAzLbl.Caption-1));
              DomeAzEdt.Text :=Format('%f',[DomeTelescopeAz]);//Telescope Position;
    end;
end;

procedure TSlitAzDlg.CancelBtnClick(Sender: TObject);
begin
        Self.Hide;
end;

procedure TSlitAzDlg.FormShow(Sender: TObject);
begin
  DomeAzEdt.Text :=Format('%f',[DomeTelescopeAz]);//Telescope Position;
  DomeAzEdt.SetFocus;
  DomeAzEdt.SelectAll;
end;

procedure TSlitAzDlg.GoAzBtnClick(Sender: TObject);
begin
  if DomeSetCal.ItemIndex = 0 then
     ROForm.DomeSocket.Socket.SendText(format('%s%d',[DmMove, Round(StrToFloat(DomeAzEdt.Text)*10)]));
end;

procedure TSlitAzDlg.StopAzBtnClick(Sender: TObject);
begin
     ROForm.DomeSocket.Socket.SendText(DmStop);
end;

procedure TSlitAzDlg.OKBtnClick(Sender: TObject);
begin
        Self.Hide;
end;

procedure TSlitAzDlg.DomeSetCalClick(Sender: TObject);
begin
   if DomeSetCal.ItemIndex = 0 then begin//Set
     GoAzBtn.Caption   := 'Go';
     GoCCWBtn.Visible  := TRUE;
     GoCWBtn.Visible   := TRUE;
     StopAzBtn.Visible := TRUE;
   end
   else begin
     GoAzBtn.Caption   := 'Calibrate';
     GoCCWBtn.Visible  := FALSE;
     GoCWBtn.Visible   := FALSE;
     StopAzBtn.Visible := FALSE;
   end;

end;

procedure TSlitAzDlg.DomeAzSBDClick(Sender: TObject);
begin
    DomeAzEdt.Text := FloatToStr(Max(0.1, StrToFloatDef(DomeAzEdt.Text,-MaxExtended)-1));
    DomeSpecialPos.ItemIndex := -1;
end;
procedure TSlitAzDlg.DomeAzSBUClick(Sender: TObject);
begin
   DomeAzEdt.Text := FloatToStr(Max(0.1, StrToFloatDef(DomeAzEdt.Text,-MaxExtended)+1));
   DomeSpecialPos.ItemIndex := -1;
end;

procedure TSlitAzDlg.DomeAzEdtChange(Sender: TObject);
var
 n :extended;
begin
  GoAzBtn.Enabled := TRUE;
  n := StrTofloatDef(DomeAzEdt.Text,-MaxExtended);
  if (DomeAzEdt.Text ='')then
     GoAzBtn.Enabled := FALSE
  else if (n<0) then begin
     DomeAzEdt.Clear;
     GoAzBtn.Enabled := FALSE;
  end else if (n>359.999) then
     GoAzBtn.Enabled := FALSE;

   if (DomeAzEdt.Tag =1) then begin
     DomeAzEdt.Tag :=0;
     DomeSpecialPos.ItemIndex := -1;
  end;
end;

procedure TSlitAzDlg.DomeAzEdtEnter(Sender: TObject);
begin
  DomeAzEdt.Tag :=1;
end;

procedure TSlitAzDlg.DomeAzEdtExit(Sender: TObject);
begin
  DomeAzEdt.Tag :=0;
end;

procedure TSlitAzDlg.GoCCWBtnMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Sender = GoCCWBtn) then
        ROForm.DomeSocket.Socket.SendText(DmMoveL)
  else if (Sender = GoCWBtn) then
        ROForm.DomeSocket.Socket.SendText(DmMoveR)

end;

procedure TSlitAzDlg.GoCCWBtnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     ROForm.DomeSocket.Socket.SendText(DmStop);

end;

end.
