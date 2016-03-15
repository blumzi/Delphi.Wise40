unit WiseErr;

interface

uses
 Dialogs,
 WiseConst, main;
function ErrorDeamon(ErrorNumber:integer; ErrorString: string):integer;
procedure StatusMesage(msg: string);

implementation

Type
  ErrorEvent = record
        N :integer;
        Msg: string;
        Deg: integer;
        Ret: integer;
end;

Const
  ErrType: array[0..2] of string =( 'Warning','Error', 'Fatal' );
var
  ErrorVec: array[1..10] of ErrorEvent =(
  (N: 000; Msg: 'Unknown Error in: ';   Deg: 2; Ret: IO_Cmd_Failed)
 ,(N: 001; Msg: 'Setting command directory not found: ';   Deg: 2; Ret: CommStatusError)
 ,(N: 002; Msg: 'Setting status file not found: ';         Deg: 2; Ret: CommStatusError)
 ,(N: 003; Msg: 'Filter command directory not found: ';         Deg: 2; Ret: ConnectFailled)
 ,(N: 004; Msg: 'Filter status file not found: ';         Deg: 2; Ret: ConnectFailled)
 ,(N: 005; Msg: 'CCD command directory not found: ';         Deg: 2; Ret: 0)
 ,(N: 010; Msg: 'Value out of range for ';         Deg: 2; Ret: IO_Cmd_Failed)
 ,(N: 100; Msg: 'Device is Busy: ';         Deg: 1; Ret: IO_Cmd_Failed)
 ,(N: 200; Msg: 'Wrong time format: ';         Deg: 1; Ret: -1)         //return value?
 ,(N: 200; Msg: 'Wrong coordinate format: ';         Deg: 1; Ret: -1)         //return value?
);


function ErrorDeamon(ErrorNumber:integer; ErrorString: string):integer;
var
   i : integer;
   j : integer;
begin
//find error
   j:=0;
   for i:=2 to High(ErrorVec) do
     if  ErrorVec[i].N = ErrorNumber then
        j:=i;
   if j=0 then
     j:=1;

   ShowMessage(ErrType[ErrorVec[j].Deg]+': '+ErrorVec[j].Msg+ErrorString);
   Result := ErrorVec[j].Ret;
end;

procedure StatusMesage(msg: string);
begin
  ROForm.StatusBar1.Panels[0].Text:=msg;
end;
end.
