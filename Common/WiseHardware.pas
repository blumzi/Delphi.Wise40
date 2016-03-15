unit WiseHardware;

interface

uses
  Windows, Messages, SysUtils, Classes, cbw, Winsock;

Const
  MaxTries           = 5;
  MaxTimeout         = 100;                 // microseconds between port reads
  FullPortMask       = $ff;
  MaxBoards          = 3;                   // Max number of boards supported
  MaxPortsPerBoard   = 8;                   // FIRST to EIGHTH
  BytesPerPort       = 3;                   // FIRSTPORTA(8), FIRSTPORTB(8), FIRSTPORTCL(4), FIRSTPORTCH(4)

type TWiseDirection = (DirNone = 0, DirCW = 1, DirCCW = 2);

type TWiseObject   = class
public
    Name: string;
    constructor Create(Name: string);
end;


type TPortId = FIRSTPORTA .. EIGHTHPORTCH;

    EWiseError          = class(Exception);
    EWiseConfigError    = class(EWiseError);
    EWiseEncoderError   = class(EWiseError);
    EWisePinError       = class(EWiseError);
    EWisePortError      = class(EWiseError);

var
  DirNames:     array[DIGITALOUT .. DIGITALIN] of string = ('DIGITALOUT', 'DIGITALIN');
  production:   boolean;

implementation

var
  hostname:     array[0..256] of Char;
  WSAData:          TWSAData;

{ TWiseControl implementation }

constructor TWiseObject.Create(Name: string);
begin
     Self.Name := Name;
end;

initialization

  production := false;
  if (WSAStartup($0101,WSAData) = 0) and
        ((gethostname(hostname, sizeof(hostname)) = 0) and
        (hostname = 'dome-ctlr')) then
    production := true;

end.










