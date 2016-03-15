program WiseDomeUnitTest;

uses
  Forms,
  DomeAgent       in 'DomeAgent.pas' {DomeForm},
  WiseDome        in '..\..\Common\WiseDome.pas',
  WiseStatusLine  in '..\..\Common\WiseStatusLine.pas',
  DomeProtocol    in '..\..\Common\DomeProtocol.pas',
  WiseLogger      in '..\..\Common\WiseLogger.pas',
  ShutDownMesg    in 'ShutDownMesg.pas' {ShutDownMsg};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Dome Agent';
  Application.CreateForm(TDomeForm, DomeAgentForm);
  Application.CreateForm(TShutDownMsg, ShutDownMsg);
  Application.Run;
end.
