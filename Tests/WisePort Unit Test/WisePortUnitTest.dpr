program WisePortUnitTest;

uses
  Forms,
  PortUnitTest in 'PortUnitTest.pas' {Form1},
  WisePort in '..\..\Common\WisePort.pas',
  WiseHardware in '..\..\Common\WiseHardware.pas',
  WiseDaq in '..\..\Common\WiseDaq.pas',
  WiseStatusLine in '..\..\Common\WiseStatusLine.pas',
  Cbw in '..\..\Common\CBW.PAS',
  StopWatch in '..\..\Common\StopWatch.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'WisePort Unit Test';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
