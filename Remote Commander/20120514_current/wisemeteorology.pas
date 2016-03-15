unit WiseMeteorology;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TWise_Meteorology = class(TForm)
    TemperatureE: TLabeledEdit;
    PressureE: TLabeledEdit;
    HumidityE: TLabeledEdit;
    Button1: TButton;
    TransCoord: TCheckBox;
    WindSpeedE: TLabeledEdit;
    WindDirE: TLabeledEdit;
    procedure FormHide(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Wise_Meteorology: TWise_Meteorology;

implementation

uses main;

{$R *.dfm}

procedure TWise_Meteorology.FormHide(Sender: TObject);
begin
  ROForm.MeteorologyMnu.Checked := False;
end;

procedure TWise_Meteorology.Button1Click(Sender: TObject);
begin
  Self.Hide;
end;


end.
