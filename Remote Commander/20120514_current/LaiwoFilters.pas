unit LaiwoFilters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TLaiwoFiltersSetup = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
{    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
}
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LaiwoFiltersSetup: TLaiwoFiltersSetup;

  LaiwoFiltersFile: TextFile;
  LaiwoFilter1 : string;
  LaiwoFilter2 : string;
  LaiwoFilter3 : string;


implementation

uses main;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure TLaiwoFiltersSetup.FormCreate(Sender: TObject);
//------------------------------------------------------------------------------
begin

  Label4.Caption := 'Enter/confirm LAIWO Filters'#10'and current position:' ;
  AssignFile(LaiwoFiltersFile, 'c:\RemoteObs\LaiwoFilters.txt') ;
  RadioButton1.Checked := True ;
  ROForm.FilterWheel.ItemIndex := 0 ;
  ROForm.FilterWheel.Tag := 1 ;

   if FileExists('c:\RemoteObs\LaiwoFilters.txt') then
                begin
                Reset(LaiwoFiltersFile);
                ReadLn(LaiwoFiltersFile,LaiwoFilter1);
                ReadLn(LaiwoFiltersFile,LaiwoFilter2);
                ReadLn(LaiwoFiltersFile,LaiwoFilter3);
                CloseFile(LaiwoFiltersFile);
                Edit1.Text := LaiwoFilter1;
                Edit2.Text := LaiwoFilter2;
                Edit3.Text := LaiwoFilter3;
                end;
end;

//------------------------------------------------------------------------------
procedure TLaiwoFiltersSetup.Button1Click(Sender: TObject);
//------------------------------------------------------------------------------
begin
  LaiwoFilter1 :=  Edit1.Text;
  LaiwoFilter2 :=  Edit2.Text;
  LaiwoFilter3 :=  Edit3.Text;

  ROForm.FilterWheel.Items.Clear;
  ROForm.FilterWheel.Items.Add(LaiwoFilter1);
  ROForm.FilterWheel.Items.Add(LaiwoFilter2);
  ROForm.FilterWheel.Items.Add(LaiwoFilter3);
  ROForm.FilterWheel.Enabled := True;

  If (RadioButton1.Checked = True)then ROForm.FilterWheel.ItemIndex := 0 ;
  If (RadioButton2.Checked = True)then ROForm.FilterWheel.ItemIndex := 1 ;
  If (RadioButton3.Checked = True)then ROForm.FilterWheel.ItemIndex := 2 ;
  ROForm.FilterWheel.Tag := ROForm.FilterWheel.ItemIndex + 1;

  ReWrite(LaiwoFiltersFile);
  WriteLn(LaiwoFiltersFile, LaiwoFilter1);
  WriteLn(LaiwoFiltersFile, LaiwoFilter2);
  WriteLn(LaiwoFiltersFile, LaiwoFilter3);
  CloseFile(LaiwoFiltersFile);
  self.hide;
end;

//------------------------------------------------------------------------------
procedure TLaiwoFiltersSetup.Button2Click(Sender: TObject);
//------------------------------------------------------------------------------
begin
 self.hide;
end;

{
//------------------------------------------------------------------------------
procedure TLaiwoFiltersSetup.RadioButton1Click(Sender: TObject);
//------------------------------------------------------------------------------
begin
  ROForm.FilterWheel.ItemIndex := 0 ;
  ROForm.FilterWheel.Tag := 1 ;
end;

//------------------------------------------------------------------------------
procedure TLaiwoFiltersSetup.RadioButton2Click(Sender: TObject);
//------------------------------------------------------------------------------
begin
  ROForm.FilterWheel.ItemIndex := 1 ;
  ROForm.FilterWheel.Tag := 2 ;
end;

//------------------------------------------------------------------------------
procedure TLaiwoFiltersSetup.RadioButton3Click(Sender: TObject);
//------------------------------------------------------------------------------
begin
  ROForm.FilterWheel.ItemIndex := 2 ;
  ROForm.FilterWheel.Tag := 3 ;
end;
}

end.
