program DomeAgent;

uses
  madExcept,
  madLinkDisAsm,
  madListModules,
  Forms,
  DomeAgentUnit  in 'DomeAgentUnit.pas' {DomeForm},
  ShutDownMesg   in 'ShutDownMesg.pas' {ShutDownMsg},
  WiseDome       in '..\Common\WiseDome.pas',
  WiseStatusLine in '..\Common\WiseStatusLine.pas',
  DomeProtocol   in '..\Common\DomeProtocol.pas',
  WiseLogger     in '..\Common\WiseLogger.pas',
  WiseHardware   in '..\Common\WiseHardware.pas',
  Cbw            in '..\Common\CBW.PAS',
  WiseAppLock    in '..\Common\WiseAppLock.pas';

{$R *.res}

var
  appLock: TWiseAppLock;

begin
  appLock := TWiseAppLock.Create('dome-agent');
  if not appLock.tryLock then
    exit;

  Application.Initialize;
  Application.Title := 'Dome Agent';
  Application.CreateForm(TDomeForm, DomeAgentForm);
  Application.CreateForm(TShutDownMsg, ShutDownMsg);
  Application.Run;
end.
