program remote;

uses
  madExcept,
  madLinkDisAsm,
  madListModules,
  Forms,
  main in 'main.pas' {ROForm},
  OKCANCL1 in 'OKCANCL1.PAS' {OKBottomDlg},
  FlatLamp in 'FlatLamp.pas' {DomeFlatDlg},
  WiseConst in 'WiseConst.pas',
  Time_Coord in 'Time_Coord.pas',
  WiseStr in 'WiseStr.pas',
  SlitAz in 'SlitAz.pas' {SlitAzDlg},
  OKCANCL2 in 'OKCANCL2.PAS' {OKRightDlg},
  DomeSlit in 'DomeSlit.pas' {DomeSlitDlg},
  WiseErr in 'WiseErr.pas',
  BSC in 'bsc.pas',
  Prefs in 'Prefs.pas' {PrefsForm},
  WiseMM in 'WiseMM.pas',
  SiteInformation in 'SiteInformation.pas' {SiteInfo},
  BiasDlg in 'BiasDlg.pas' {BiasDialog},
  TestExpDlg in 'TestExpDlg.pas' {TestExpDialog},
  CCDAreaDlg in 'CCDAreaDlg.pas' {CCDAreaDialog},
  AcquireDlg in 'AcquireDlg.pas' {AcquireDialog},
  WiseMeteorology in 'WiseMeteorology.pas' {Wise_Meteorology},
  Alert in 'Alert.pas' {AlertForm},
  DomeProtocol in 'DomeProtocol.pas',
  TelePars in 'TelePars.pas',
  FlatScriptDlg in 'flatscriptdlg.pas' {FlatScriptDialog},
  FlatScriptDlgHELPTEMP in 'FlatScriptDlgHELPTEMP.pas' {Form1},
  FocusDlg in 'FocusDlg.pas' {FocusDialog},
  LaiwoFilters in 'LaiwoFilters.pas' {LaiwoFiltersSetup},
  WiseAppLock in '..\..\Common\WiseAppLock.pas';

{$R *.res}

var
  appLock: TWiseAppLock;

begin
  appLock := TWiseAppLock.Create('remote-commander');
  if not appLock.tryLock then
    exit;
    
  Application.Initialize;
  Application.Title := 'Remote Wise';
  Application.CreateForm(TROForm, ROForm);
  Application.CreateForm(TDomeFlatDlg, DomeFlatDlg);
  Application.CreateForm(TSlitAzDlg, SlitAzDlg);
  Application.CreateForm(TDomeSlitDlg, DomeSlitDlg);
  Application.CreateForm(TPrefsForm, PrefsForm);
  Application.CreateForm(TSiteInfo, SiteInfo);
  Application.CreateForm(TBiasDialog, BiasDialog);
  Application.CreateForm(TTestExpDialog, TestExpDialog);
  Application.CreateForm(TCCDAreaDialog, CCDAreaDialog);
  Application.CreateForm(TAcquireDialog, AcquireDialog);
  Application.CreateForm(TWise_Meteorology, Wise_Meteorology);
  Application.CreateForm(TAlertForm, AlertForm);
  Application.CreateForm(TFlatScriptDialog, FlatScriptDialog);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFocusDialog, FocusDialog);
  Application.CreateForm(TLaiwoFiltersSetup, LaiwoFiltersSetup);
  Application.Run;
end.
