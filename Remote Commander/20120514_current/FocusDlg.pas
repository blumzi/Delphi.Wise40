unit FocusDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls;

type
  TFocusDialog = class(TForm)
    FocusLabel: TLabel;
    IterLabel: TLabel;
    GotoButton: TButton;
    StopButton: TButton;
    AutoFocusButton: TButton;
    FocusWantedVal: TSpinEdit;
    FocusWaitCCDTimer1: TTimer;
    FocusWaitFocusTimer1: TTimer;
    procedure GotoButtonClick(Sender: TObject);
    procedure StopButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AutoFocusButtonClick(Sender: TObject);
    procedure FocusWaitCCDTimer1Timer(Sender: TObject);
    procedure FocusWaitFocusTimer1Timer(Sender: TObject);
    procedure AnalizeFocus(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FocusDialog: TFocusDialog;

implementation
{$R *.dfm}

uses main, WiseConst, tpmath, Alert, WiseStr;


var
  LastFocus_    : integer;
  Focus_        : integer;
  Iter_         : integer;
  LastIter_     : Boolean = FALSE;

  FocusVal_ : array [0..8] of integer;
  FWHMsVal_ : array [0..8] of extended;

procedure TFocusDialog.GotoButtonClick(Sender: TObject);
begin
   ROForm.GoFocus(Sender, FocusWantedVal.Value);
end;

procedure TFocusDialog.StopButtonClick(Sender: TObject);
begin
   ROForm.StopFocus(Sender);
   GotoButton.Enabled := TRUE;
   AutoFocusButton.Enabled := TRUE;
   FocusWaitFocusTimer1.Enabled := FALSE;
   FocusWaitCCDTimer1.Enabled := FALSE;
end;

procedure TFocusDialog.FormCreate(Sender: TObject);
begin
  FocusDialog.Left := ROForm.Width - FocusDialog.Width;
  FocusDialog.Top  := ROForm.Height;
end;

procedure TFocusDialog.AutoFocusButtonClick(Sender: TObject);
begin
   // Take a temporal exposure of 5 sec
   if not (PMISConnected or LaiwoScienceConnected) then begin
      ShowMessage('Connect to camera first!');
      exit;
   end;

   // Get the current focus - start with cur focus - 20 till +20
   // Set a focus = cur focus - 20
   Focus_ := StrToInt(FocusLabel.Caption);
   LastFocus_ := StrToInt(FocusLabel.Caption) + 20;
   FocusWantedVal.Value := StrToInt(FocusLabel.Caption) - 20;
   FocusWaitFocusTimer1.Enabled := TRUE;
   Iter_ := 0;
   GotoButtonClick(Sender);
end;

procedure TFocusDialog.FocusWaitFocusTimer1Timer(Sender: TObject);
var
 cmd :string;
// curFocus : string;
begin
   // Check if the focus has setteled
   if (LastIter_) then begin
      LastIter_ := FALSE;
      Focus_ := StrToInt(FocusLabel.Caption);
      FocusWaitFocusTimer1.Interval := 5000;
      FocusWaitFocusTimer1.Enabled := FALSE;
      // Take an image and choose a bright star to get its FWHM
      cmd := Format('%s %s %0.2f', [PMISExecLine, 'Star', 5.0]);
      ROForm.PMISSocket.Socket.SendText(cmd);
      FocusWaitCCDTimer1.Enabled := TRUE;
   end else begin
      if IsInt(IterLabel.Caption) then begin
         if (StrToInt(IterLabel.Caption) >= 3) then begin
            FocusWaitFocusTimer1.Interval := 10000;
            LastIter_ := TRUE;
         end;
      end;
   end;
end;

procedure TFocusDialog.FocusWaitCCDTimer1Timer(Sender: TObject);
begin
   // Was a star found?
   if (StarIsSelected_) then begin
      FocusWaitCCDTimer1.Enabled := FALSE;
      StarIsSelected_ := FALSE;
      // Take its fwhm
      if (StarFWHM_ = 0) then begin
         // Could not find a star
         FocusWaitFocusTimer1.Enabled := FALSE;
         FocusWaitCCDTimer1.Enabled := FALSE;
         ShowMessage('Could not find a star - focus manually');
         exit;
      end;
      // Save focus & fwhm in a matrix
      FocusVal_[Iter_] := StrToInt(FocusLabel.Caption);
      FWHMsVal_[Iter_] := StarFWHM_;

      // DEBUG
     AlertForm.AlertTxt.Caption := 'Focus: '+FocusLabel.Caption+', FWHM: '+FloatToStr(StarFWHM_);
     AlertForm.Show;

      Focus_ := Focus_ + 5;
      if (Focus_ <= LastFocus_) then begin
         Iter_ := Iter_ + 1;
         FocusWantedVal.Value := Focus_;
         GotoButtonClick(Sender);
         FocusWaitFocusTimer1.Enabled := TRUE;
      end else begin
         // Find minima for the focus
         AnalizeFocus(Sender);
         // Send the focus to best focus
      end;
   end;
   // Not found? - manually
end;

procedure TFocusDialog.AnalizeFocus(Sender: TObject);
var
//  x,y : Array[0..1000] of float;
  B : Array[0..2] of float;
  V : Array[0..2] of PVector;
  Va : Array[0..2,0..2] of float;
  i : Integer;
//  j : Integer;
begin
  // Initialize the V matrix
  for i:=0 to 2 do
    V[i] := @Va[i];

  // Fill the measurement points to x,y
{*  for i:=0 to Memo1.Lines.Count-1 do
  begin
    x[i] := StrToFloat(LeftStr(Memo1.Lines[i], Pos(',',Memo1.Lines[i])-1));
    y[i] := StrToFloat(MidStr(Memo1.Lines[i], Pos(',',Memo1.Lines[i])+1, 50));
  end;
*}
  // Calculate the regression
//  PolFit(@x, @y, 0, Memo1.Lines.Count-1, 2, @B, @V);
    // x,y - the inputs (measured points)
    // 0                   - the index of the first point in the x and y arrays
    // Memo1.Lines.Count-1 - the index of the last point in the x and y arrays
    // 2   - the degree of the polynomial
    // B   - the values of the best fitting polynomial (y = B[0] + B[1]*x + B[2]*x^2)
    // V   - Matrix to work on.

  // Find the best focus
  PolFit(@FocusVal_, @FWHMsVal_, 0, 8, 2, @B, @V);

  // Calculate the minimum point
  if B[2]<=0 then
    ShowMessage('No minimum')
  else
    ShowMessage('Minimum point: '+FloatToStr(-B[1]/(2*B[2])));
  Focus_ := round(B[2]);

   // Goto best focus
   FocusWantedVal.Value := Focus_;
   GotoButtonClick(Sender);

   FocusWaitFocusTimer1.Enabled := FALSE;
   FocusWaitCCDTimer1.Enabled := FALSE;
end;

procedure TFocusDialog.FormShow(Sender: TObject);
begin
   FocusDialog.FocusWantedVal.Value := StrToInt(FocusLabel.Caption);
end;

end.
