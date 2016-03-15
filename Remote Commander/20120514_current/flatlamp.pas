unit FlatLamp;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, OKCANCL1, ComCtrls;

type
  TDomeFlatDlg = class(TOKBottomDlg)
    ApplyBtn: TButton;
    HelpBtn: TButton;
    DomeFlatPower: TRadioGroup;
    LampVoltage: TGroupBox;
    LampVEdit: TEdit;
    Label2: TLabel;
    TrackBar1: TTrackBar;
    Label1: TLabel;
    ComboBox1: TComboBox;
    procedure HelpBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DomeFlatDlg: TDomeFlatDlg;

implementation

{$R *.dfm}

procedure TDomeFlatDlg.HelpBtnClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

procedure TDomeFlatDlg.FormActivate(Sender: TObject);
begin
  inherited;
  LampVEdit.Text:='44';

end;

procedure TDomeFlatDlg.CancelBtnClick(Sender: TObject);
begin
  inherited;
        Self.Hide;
end;

procedure TDomeFlatDlg.ApplyBtnClick(Sender: TObject);
begin
  inherited;
 //do something;
end;

end.
 
