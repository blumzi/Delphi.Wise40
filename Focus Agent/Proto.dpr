program Proto;

uses
  madExcept,
  madLinkDisAsm,
  madListModules,
  Forms,
  FocusProto in 'FocusProto.pas' {ProtoFrame},
  WiseFocus in '..\Common\WiseFocus.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Focus Proto';
  Application.CreateForm(TProtoFrame, ProtoFrame);
  Application.Run;
end.
