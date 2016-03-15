program WiseEncoderUnitTest;

uses
  Forms,
  EncoderUnitTest in 'EncoderUnitTest.pas' {Form1},
  WisePort in '..\..\Common\WisePort.pas',
  WiseDaq in '..\..\Common\WiseDaq.pas',
  WiseHardware in '..\..\Common\WiseHardware.pas',
  Cbw in '..\..\Common\CBW.PAS',
  WisePin in '..\..\Common\WisePin.pas',
  WiseDome in '..\..\Common\WiseDome.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'WiseEncoder Unit Test';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
