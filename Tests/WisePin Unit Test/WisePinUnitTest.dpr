program WisePinUnitTest;

uses
  Forms,
  PinsUnitTest  in 'PinsUnitTest.pas' {Form1},
  WisePort      in '..\..\Common\WisePort.pas',
  WisePin       in '..\..\Common\WisePin.pas',
  WiseDaq       in '..\..\Common\WiseDaq.pas',
  WiseHardware  in '..\..\Common\WiseHardware.pas',
  Cbw           in '..\..\Common\CBW.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'WisePin Unit Test';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
