unit FlatScriptDlg;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, Spin, Mask, Math;

type
  TFlatScriptDialog = class(TForm)
    RadioSkyFF: TRadioButton;
    RadioDomeFF: TRadioButton;
    FlatLabel1: TLabel;
    Filter1: TCheckBox;
    FlatLabel3: TLabel;
    FlatLabel2: TLabel;
    Filter2: TCheckBox;
    Filter3: TCheckBox;
    Filter4: TCheckBox;
    Filter5: TCheckBox;
    Filter6: TCheckBox;
    Filter7: TCheckBox;
    Filter8: TCheckBox;
    FlatLabel4: TLabel;
    FlatSpin: TEdit;
    UpDown1: TUpDown;
    RunBtn: TButton;
    CancelBtn: TButton;
    FlatWaitScopeTimer: TTimer;
    FlatWaitCCDTimer: TTimer;
    FlatWaitSunTimer: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FlatSpinChange(Sender: TObject);
    procedure FlatSpinExit(Sender: TObject);
    procedure RunBtnClick(Sender: TObject);
    procedure StopFlatScript(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure DoSkyFF(Sender: TObject);
    procedure DoDomeFF(Sender: TObject);
    procedure GetCCDParameters(Sender: TObject);
    procedure decideFiltersOrder(Sender: TObject);
    procedure decideDawnOrDusk(Sender: TObject);
    procedure checkSunAlt(Sender: TObject);
    procedure prepareExpFilter(Sender: TObject);
    procedure AnalyzeImage(Sender: TObject);
    function  calcExpTime(GoodMeanCount_: extended; lastImMeanCount_: extended;
                          ExpTime_: extended; lastSunAlt_: extended;
                          CurrSunAlt_: extended; currFilter_: string; filter: string) : extended;
    procedure FlatWaitScopeTimerTimer(Sender: TObject);
    procedure FlatWaitCCDTimerTimer(Sender: TObject);
    procedure FlatWaitSunTimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FlatScriptDialog: TFlatScriptDialog;

implementation
{$R *.dfm}

uses main, Alert, DomeSlit, WiseConst, WiseMM, TelePars, FlatScriptDlgHELPTEMP;

var
   FFscriptRun_        : Boolean = FALSE;
   DoSkyFFFlag_        : Boolean = FALSE;
   DoDomeFFFlag_       : Boolean = FALSE;
   doFilters           : Tstrings;
   Saturation_         : extended;
   GoodMeanCount_      : extended;
   MeanCountTolarence_ : extended;
   CurrSunAlt_         : extended;
   LastSunAlt_         : extended;
   DawnFlat_           : Boolean = FALSE;
   DuskFlat_           : Boolean = FALSE;
   FirstExpTime_       : extended = 4.0;
   minExpTime_         : extended = 4.0;
   maxExpTime_         : extended = 90.0;
   ExpTime_            : extended;
   CurrFilter_         : string;
   lastImMeanCount_    : extended;
   lastImageGood_      : Boolean = FALSE;
   Saturated_          : Boolean = FALSE;
   imagesInx_          : integer = 0;
   filterInx_          : integer = 0;


procedure TFlatScriptDialog.FormShow(Sender: TObject);
begin
//   if (not FFscriptRun_) then begin
      doFilters :=TstringList.Create;

      Filter1.Caption := ROForm.FilterWheel.Items[0];
      Filter2.Caption := ROForm.FilterWheel.Items[1];
      Filter3.Caption := ROForm.FilterWheel.Items[2];
      Filter4.Caption := ROForm.FilterWheel.Items[3];
      Filter5.Caption := ROForm.FilterWheel.Items[4];
      Filter6.Caption := ROForm.FilterWheel.Items[5];
      Filter7.Caption := ROForm.FilterWheel.Items[6];
      Filter8.Caption := ROForm.FilterWheel.Items[7];

      if (StrToIntDef(FlatSpin.Text,-MaxInt) < 0 ) then begin
         FlatSpin.Text := '4';
      end;
   //   FlatSpin.SetFocus;
      FlatSpin.SelectAll;
//      ROForm.BImFlatField.Caption := 'FF runs!';
//      ROForm.BImFlatField.Font.Color := clRed;
//   end else if (FFscriptRun_)then begin
//      FlatWaitScopeTimer.Enabled := FALSE;
//      FlatWaitCCDTimer.Enabled := FALSE;
//      FlatWaitSunTimer.Enabled := FALSE;
//      doFilters.Free;
//      ROForm.BImFlatField.Caption := 'FlatField';
//      ROForm.BImFlatField.Font.Color := clWindowText;
//   end;
end;

procedure TFlatScriptDialog.FlatSpinChange(Sender: TObject);
var
 n :integer;
begin
  RunBtn.Enabled := TRUE;
  n := StrToIntDef(FlatSpin.Text,-MaxInt);

  if (FlatSpin.Text ='')then
     RunBtn.Enabled := FALSE
  else if (n<0) then begin
     FlatSpin.Clear;
     RunBtn.Enabled := FALSE;
  end else if  (n>20) then
     FlatSpin.Text :='20';

  if  (n<1) then
     RunBtn.Enabled := FALSE

end;

procedure TFlatScriptDialog.FlatSpinExit(Sender: TObject);
begin
  if (StrToIntDef(FlatSpin.Text,-1) < 0 )then
     FlatSpin.Text := '0';
end;


procedure TFlatScriptDialog.RunBtnClick(Sender: TObject);
begin
   if (not FFscriptRun_) then begin
      if (RadioSkyFF.Checked) then begin
         DoSkyFFFlag_ := TRUE;
         RunBtn.Caption := 'Stop';
         RunBtn.Font.Color := clRed;
         FFscriptRun_ := TRUE;
         DoSkyFF(self);
      end else if (RadioDomeFF.Checked) then begin
         DoDomeFFFlag_ := TRUE;
         RunBtn.Caption := 'Stop';
         RunBtn.Font.Color := clRed;
         FFscriptRun_ := TRUE;
         DoDomeFF(self);
      end else begin
         AlertForm.AlertTxt.Caption := 'Choose SkyFF or DomeFF!!!';
         AlertForm.Show;
         StopFlatScript(self);
      end;
   end else if (FFscriptRun_) then begin
      StopFlatScript(self);
      // And also if an image is taken - abort the image - TEMP
      ROForm.BtnStopObserveClick(self);
      ROForm.SendAbortImageToCCD(self);
   end;
end;

procedure TFlatScriptDialog.StopFlatScript(Sender: TObject);
begin
   doFilters.Clear;
   FlatWaitScopeTimer.Enabled := FALSE;
   FlatWaitCCDTimer.Enabled := FALSE;
   FlatWaitSunTimer.Enabled := FALSE;
   FFscriptRun_ := FALSE;
   RunBtn.Caption := 'Run';
   RunBtn.Font.Color := clWindowText;
end;

procedure TFlatScriptDialog.ExitBtnClick(Sender: TObject);
begin
   StopFlatScript(self);
   doFilters.Free;
//   ROForm.BImFlatField.Caption := 'FlatField';
//   ROForm.BImFlatField.Font.Color := clWindowText;
   Self.Hide;
end;

procedure TFlatScriptDialog.DoSkyFF(Sender: TObject);
begin
(*   UNCOMMENT THESE LINES WHEN OPPERATIONAL *)
   if (DomeSlit.DomeSlitDlg.StatusMsg.Caption <> 'Opened') then begin
      AlertForm.AlertTxt.Caption := 'Dome is not opened';
      AlertForm.Show;
      DoSkyFFFlag_ := FALSE;
   end;
(**)
   if (not RATrackON) then begin
      AlertForm.AlertTxt.Caption := 'Telescope is not tracking';
      AlertForm.Show;
      DoSkyFFFlag_ := FALSE;
   end;
   if (not DomeTrackOn) then begin
      AlertForm.AlertTxt.Caption := 'Dome is not tracking';
      AlertForm.Show;
      DoSkyFFFlag_ := FALSE;
   end;
   if (1=0) then begin // TEMP - CCD is not cold enough
      AlertForm.AlertTxt.Caption := 'CCD is not cold enough';
      AlertForm.Show;
      DoSkyFFFlag_ := FALSE;
   end;
   if (DoSkyFFFlag_) then begin
      GetCCDParameters(self);
      decideFiltersOrder(self);
      decideDawnOrDusk(self);
      // Check Sun Alt. and decide to observe, wait or too late
      checkSunAlt(self);
      if (DoSkyFFFlag_) then begin
         // Send telescope to the zenith
         ROForm.BParkClick(ROForm.BSkyFF);
(*   UNCOMMENT THESE LINES WHEN OPPERATIONAL*)
         ROForm.GotoClick(Sender);
(**)
         // Exposure time = 4 seconds. Move to right filter
         ExpTime_ := FirstExpTime_;
         if (DuskFlat_) then begin
            CurrFilter_ := doFilters[filterInx_];
         end else if (DawnFlat_) then begin
            CurrFilter_ := doFilters[doFilters.Count-1-filterInx_];
         end;
         prepareExpFilter(self);
         // Wait for telescope stop
         FlatWaitScopeTimer.Enabled := TRUE;
         sleep (1000);

         // Observe is within the FlatWaitScopeTimer object.
         // Next moves are within the FlatWaitCCDTimer object:
         // Check image average count,
         // Decide to move, observe, wait or too late.
      end else
         StopFlatScript(self);
   end else
      StopFlatScript(self);
end;

procedure TFlatScriptDialog.DoDomeFF(Sender: TObject);
begin
   if (DomeSlit.DomeSlitDlg.StatusMsg.Caption <> 'Closed') then begin
      AlertForm.AlertTxt.Caption := 'Dome is not closed';
      AlertForm.Show;
      DoDomeFFFlag_ := FALSE;
   end;
   if (RATrackON) then begin
      AlertForm.AlertTxt.Caption := 'Telescope is tracking - untrack telescope';
      AlertForm.Show;
      DoDomeFFFlag_ := FALSE;
   end;
   if (DomeTrackOn) then begin
      AlertForm.AlertTxt.Caption := 'Dome is tracking - untrack dome';
      AlertForm.Show;
      DoDomeFFFlag_ := FALSE;
   end;
   if (1=0) then begin // TEMP - CCD is not cold enough
      AlertForm.AlertTxt.Caption := 'CCD is not cold enough';
      AlertForm.Show;
      DoDomeFFFlag_ := FALSE;
   end;
   if (DoDomeFFFlag_) then begin
      GetCCDParameters(self);
      decideFiltersOrder(self);
   end;
   // Temporary till DomeFlat will be implemented - DP 2007July
   AlertForm.AlertTxt.Caption := 'DomeFlat is not implemented yet...';
   AlertForm.Show;
   DoDomeFFFlag_ := FALSE;
   StopFlatScript(self);
   ////////////////////////////////////////////////////////////
end;

procedure TFlatScriptDialog.GetCCDParameters(Sender: TObject);
begin
   // TEMP - These data should be recieved from the CCD agent
   Saturation_         := 60000;
   GoodMeanCount_      := 45000;
   MeanCountTolarence_ := 15000;
end;

procedure TFlatScriptDialog.decideFiltersOrder(Sender: TObject);
var
i, j : integer;
filtersList : TStrings;
filtersInx : TStrings;
temp, tempStr : string;
moved : bool;
begin
//   i := 0;                                 // DEBUG
   if (Filter1.Checked) then begin
      doFilters.Append(Filter1.Caption);
//      ShowMessage(doFilters.Strings[i]);   // DEBUG
//      i := i+1;                            // DEBUG
   end;
   if (Filter2.Checked) then begin
      doFilters.Append(Filter2.Caption);
//      ShowMessage(doFilters.Strings[i]);   // DEBUG
//      i := i+1;                            // DEBUG
   end;
   if (Filter3.Checked) then begin
      doFilters.Append(Filter3.Caption);
//      ShowMessage(doFilters.Strings[i]);   // DEBUG
//      i := i+1;                            // DEBUG
   end;
   if (Filter4.Checked) then begin
      doFilters.Append(Filter4.Caption);
//      ShowMessage(doFilters.Strings[i]);   // DEBUG
//      i := i+1;                            // DEBUG
   end;
   if (Filter5.Checked) then begin
      doFilters.Append(Filter5.Caption);
//      ShowMessage(doFilters.Strings[i]);   // DEBUG
//      i := i+1;                            // DEBUG
   end;
   if (Filter6.Checked) then begin
      doFilters.Append(Filter6.Caption);
//      ShowMessage(doFilters.Strings[i]);   // DEBUG
//      i := i+1;                            // DEBUG
   end;
   if (Filter7.Checked) then begin
      doFilters.Append(Filter7.Caption);
//      ShowMessage(doFilters.Strings[i]);   // DEBUG
//      i := i+1;                            // DEBUG
   end;
   if (Filter8.Checked) then begin
      doFilters.Append(Filter8.Caption);
//      ShowMessage(doFilters.Strings[i]);   // DEBUG
//      i := i+1;                            // DEBUG
   end;

   filtersInx := TStringList.Create;
   filtersList := TStringList.Create;
   try
     if (FileExists('c:\RemoteObs\FiltersFlatOrder.txt')) then begin
        filtersList.LoadFromFile('c:\RemoteObs\FiltersFlatOrder.txt');
//        for i:=0 to filtersList.Count-1 do begin   // DEBUG
//           ShowMessage(filtersList.Strings[i]);    // DEBUG
//        end;                                       // DEBUG
        for i:=0 to doFilters.Count-1 do begin
           j := 0;
           while(filtersList.Strings[j] <> doFilters.Strings[i]) do begin
              j := j+1;
           end;
           filtersInx.Append(intToStr(j));
        end;

        moved := TRUE;
        While (moved) do begin
           moved := FALSE;
           for i:=0 to filtersInx.Count-2 do begin
              if (strToInt(filtersInx[i]) > strToInt(filtersInx[i+1])) then begin
                 temp := filtersInx[i];
                 filtersInx[i] := filtersInx[i+1];
                 filtersInx[i+1] := temp;
                 tempStr := doFilters[i];
                 doFilters[i] := doFilters[i+1];
                 doFilters[i+1] := tempStr;
                 moved := TRUE;
              end;
           end;
        end;

//        for i:=0 to doFilters.Count-1 do begin               // DEBUG
//           ShowMessage(doFilters.Strings[i]);                // DEBUG
//        end;                                                 // DEBUG
     end;
   finally
     filtersList.Free;
     filtersInx.Free;
   end;
end;

procedure TFlatScriptDialog.decideDawnOrDusk(Sender: TObject);
begin
   GetLocalTime(LTNow);
   if (LTNow.wHour < 12) then begin
      DawnFlat_ := TRUE;
      DuskFlat_:= FALSE;
   end else if (LTNow.wHour > 12) then begin
      DuskFlat_:= TRUE;
      DawnFlat_ := FALSE;
   end;
end;

procedure TFlatScriptDialog.checkSunAlt(Sender: TObject);
begin
   CurrSunAlt_ := RadToDeg(SunAlt);
//   ShowMessage(FloatToStr(CurrSunAlt_)); // DEBUG

(* UNCOMMENT THESE LINES WHEN OPPERATIONAL *)
   if (CurrSunAlt_ > 0) then begin
      if (DuskFlat_) then begin
         // To early - Message
         DoSkyFFFlag_ := FALSE;
         ShowMessage('To early to take Flats. Please wait');
         // Wait
      end else if (DawnFlat_) then begin
         // To late - Error
         DoSkyFFFlag_ := FALSE;
         AlertForm.AlertTxt.Caption := 'Too late to take Flats...';
         AlertForm.Show;
      end;
   end else if (CurrSunAlt_ < -9) then begin
      if (DuskFlat_) then begin
         // To late - Error
         DoSkyFFFlag_ := FALSE;
         AlertForm.AlertTxt.Caption := 'Too late to take Flats...';
         AlertForm.Show;
      end else if (DawnFlat_) then begin
         // To early - Message
         DoSkyFFFlag_ := FALSE;
         ShowMessage('To early to take Flats. Please wait')
         // Wait
      end;
   end else if (CurrSunAlt_ < 0) and (CurrSunAlt_ > -9) then begin
(**)
      DoSkyFFFlag_ := TRUE;
(* UNCOMMENT THESE LINES WHEN OPPERATIONAL *)
   end;
(**)
   LastSunAlt_ := CurrSunAlt_;
end;

procedure TFlatScriptDialog.prepareExpFilter(Sender: TObject);
var
i : integer;
begin
   // If this is the first image for a filter - take a test image only 
   if (imagesInx_ = 0) then begin
      ROForm.RATarget.Text   := 'test';
   end else
      ROForm.RATarget.Text   := 'FF';

   ROForm.ObsCycleStatus.Caption :='';
   ROForm.CamExp.InsertRow(' ', ' ', true);
   for i:= (ROForm.CamExp.RowCount-1) downto 1 do
           ROForm.CamExp.DeleteRow(i);

   ROForm.CamExp.InsertRow(CurrFilter_,FloatToStr(ExpTime_), true);
end;

procedure TFlatScriptDialog.AnalyzeImage(Sender: TObject);
var
filter : string;  // temp variable
dontCalcExpTime : Boolean;
begin
   dontCalcExpTime := FALSE;
   ROForm.askCCDMeanCount(self);
//   lastImMeanCount_ := ROForm.GetCCDMeanCount(self); // TEMP - real line
   FlatScriptDlgHELPTEMP.Form1.ShowModal;
   lastImMeanCount_ := strToFloat(FlatScriptDlgHELPTEMP.Form1.Edit1.Text);
   FlatScriptDlgHELPTEMP.Form1.Edit1.Text := '';

   if (DuskFlat_) then begin
//      ShowMessage('Dusk Flat');   // DEBUG
      if (lastImMeanCount_ > GoodMeanCount_+MeanCountTolarence_) then begin
         lastImageGood_ := FALSE;
//         ShowMessage('Saturation');   // DEBUG
         ROForm.ObsCycleStatus.Caption := 'Image is saturated';
         ROForm.ObsCycleStatus.Font.Color := ClRed;
         Saturated_ := TRUE;
         dontCalcExpTime := TRUE; // Is this line superflous?
      end else if (lastImMeanCount_ < GoodMeanCount_-MeanCountTolarence_) then begin
//         ShowMessage('too faint');   // DEBUG
         ROForm.ObsCycleStatus.Caption := 'Image is too faint';
         ROForm.ObsCycleStatus.Font.Color := ClRed;
         lastImageGood_ := FALSE;
      end else begin
//         ShowMessage('Exactly');   // DEBUG
         ROForm.ObsCycleStatus.Caption := 'FF image was written';
         ROForm.ObsCycleStatus.Font.Color := clBackground;
         lastImageGood_ := TRUE;
      end;

   end else if (DawnFlat_) then begin
//      ShowMessage('Dawn Flat');   // DEBUG
      if (lastImMeanCount_ > GoodMeanCount_+MeanCountTolarence_) then begin
         lastImageGood_ := FALSE;
         // Reduce exposure time
         ExpTime_ := ExpTime_ / 2;
         dontCalcExpTime := TRUE;
         // To late - Error
         if (ExpTime_ < minExpTime_) then begin
            DoSkyFFFlag_ := FALSE;
            AlertForm.AlertTxt.Caption := 'Too late to take Flats...';
            AlertForm.Show;
            ROForm.ObsCycleStatus.Caption := 'Image is saturated';
            ROForm.ObsCycleStatus.Font.Color := ClRed;
//            ShowMessage('Saturation');     // DEBUG
            ExitBtnClick(self);
         end;
      end else if (lastImMeanCount_ < GoodMeanCount_-MeanCountTolarence_) then begin
//         ShowMessage('too faint');           // DEBUG
         ROForm.ObsCycleStatus.Caption := 'Image is too faint';
         ROForm.ObsCycleStatus.Font.Color := ClRed;
         lastImageGood_ := FALSE;
      end else begin
//         ShowMessage('Exactly');           // DEBUG
         ROForm.ObsCycleStatus.Caption := 'FF image was written';
         ROForm.ObsCycleStatus.Font.Color := clBackground;
         lastImageGood_ := TRUE;
      end;
   end;

   if (not dontCalcExpTime) then begin
      ExpTime_ := calcExpTime(GoodMeanCount_, lastImMeanCount_, ExpTime_, lastSunAlt_, CurrSunAlt_, currFilter_, filter);
   end;
end;

function TFlatScriptDialog.calcExpTime(GoodMeanCount_: extended; lastImMeanCount_: extended;
                                       ExpTime_: extended; lastSunAlt_: extended;
                                       CurrSunAlt_: extended; currFilter_: string; filter: string) : extended;
var
lightPercent : extended;
CalcExpTime  : extended;
scale        : extended;
begin
   // Calculate exposure time according last image
   lightPercent := lastImMeanCount_ / GoodMeanCount_;
   CalcExpTime :=  ExpTime_ / lightPercent;

   // Calculate exposure time according Sun move since last image
   scale := 0.9;
   if (DuskFlat_) then begin
      scale := 0.9;
   end else if (DawnFlat_) then begin
      scale := 0.9;   // Change this value. DP
   end;
   CalcExpTime := (1 - scale*(CurrSunAlt_ - lastSunAlt_))*CalcExpTime;
   if (CalcExpTime < minExpTime_) then begin
      CalcExpTime := minExpTime_;
   end;
   if (CalcExpTime > maxExpTime_) then begin
      CalcExpTime := maxExpTime_;
   end;
   Result := round(CalcExpTime);
end;

procedure TFlatScriptDialog.FlatWaitScopeTimerTimer(Sender: TObject);
begin
   // Wait for telescope to stop moving
   if (not ROForm.isTelescopeMoving(self)) then begin
      // Telescope has finished moving
      FlatWaitScopeTimer.Enabled := FALSE;
      // Observe
      ROForm.BtnObserveClick(Sender);
      sleep (1000);
      FlatWaitCCDTimer.Enabled := TRUE;
   end;
end;

procedure TFlatScriptDialog.FlatWaitCCDTimerTimer(Sender: TObject);
begin
   // Wait for the exposure to finish
   if (not ROForm.isFiltSeqOn(self)) then begin
      FlatWaitCCDTimer.Enabled := FALSE;
      // Check image average count
      AnalyzeImage(Self);
      // If good image
      if (lastImageGood_) then begin
         imagesInx_ := imagesInx_ + 1;
         if (imagesInx_ < strToInt(FlatSpin.Text)+1) then begin
            // Move telescope to the zenith
            ROForm.BParkClick(ROForm.BSkyFF);
            ROForm.GotoClick(Sender);
            prepareExpFilter(self);
            // Wait for telescope stop
            FlatWaitScopeTimer.Enabled := TRUE;
            sleep (1000);
         end else if (imagesInx_ = strToInt(FlatSpin.Text)+1) and (filterInx_ < doFilters.Count-1) then begin
            // Move to next filter
            imagesInx_ := 0;
            filterInx_ := filterInx_ + 1;
            if (DuskFlat_) then begin
               CurrFilter_ := doFilters[filterInx_];
            end else if (DawnFlat_) then begin
               CurrFilter_ := doFilters[doFilters.Count-1-filterInx_];
            end;
            prepareExpFilter(self);
            // Assume the telescope just moved to take an image
            FlatWaitScopeTimer.Enabled := TRUE;
         end else if (imagesInx_ = strToInt(FlatSpin.Text)+1) and (filterInx_ = doFilters.Count-1) then begin
            // Finish run!
            SoundAlert(SndEndObsCycle);
            SoundAlert(SndEndObsCycle);
            SoundAlert(SndEndObsCycle);
            ShowMessage('Finish - thanks for running the FF script');
            ExitBtnClick(self);
         end;
      end else if (not lastImageGood_) then begin
         if (Saturated_) then begin
            Saturated_ := FALSE;
            // Wait a minute for darker sky
            // Operate timer of 60000
            FlatWaitSunTimer.Enabled := TRUE;
            ROForm.ObsCycleStatus.Caption := 'Image is saturated - wait 1 min for the Sun';
            ROForm.ObsCycleStatus.Font.Color := ClRed;
         end else if (not Saturated_) then begin
            prepareExpFilter(self);
            // Assume the telescope just moved to take an image
            FlatWaitScopeTimer.Enabled := TRUE;
         end;
      end;
   end;
end;

procedure TFlatScriptDialog.FlatWaitSunTimerTimer(Sender: TObject);
begin
   // Observe
   ROForm.BtnObserveClick(Sender);
   sleep (1000);
   FlatWaitCCDTimer.Enabled := TRUE;
   FlatWaitSunTimer.Enabled := FALSE;
end;


end.


