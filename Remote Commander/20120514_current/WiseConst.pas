unit WiseConst;
//******************************************************************************
// UNIT NAME         WiseConst
// USED BY PROJECTS  Remote
// AUTHOR            Yiftah Lipkin
// DESCRIPTION       Various String manipulation Routines
// LAST MODIFIED     2003 Jun 10
//******************************************************************************

interface
uses
  Windows, IniFiles, SysUtils, Dialogs, TelePars;
const
//------------------------------------------------------------------------------
//Local
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//File Locations and Default Extentions
//------------------------------------------------------------------------------
  IniFile0         = 'c:\RemoteObs\remote.ini';

  MaxLists         = 12;             //Max number of opened ObjLists in Lis window.
  LisPath0         = 'c:\misc\';     //Default path of ObjLists
  LisExtn0         = 'lst';          //Default extension of ObjLists

  FchartPath0      = 'c:\FCharts\';  //Default path of Finding Charts
  FchartExtn0      = 'jpg';          //Default extension of Finding Charts
  FcSize0          = 12.0;           //Default size of FCs [arcmin]
  BrowserOption0   = 0;              //WWW Browser to use: 0-WinDefault 1-MS IE  2-Specified
  NetMeetOption0   = 0;              //Dome Sound Agent to use: 0-WinDefault  2-Specified
  ImgViewerOption0 = 0;              //Image Viewer to use: 0-WinDefault 2-Specified

  Instrumnet0      = 'Camera';
  Detector0        = 'TEK';
  MaxTEKX0         = 1024;
  MaxTEKY0         = 1024;
//------------------------------------------------------------------------------
//Default *.LST Filenames
//------------------------------------------------------------------------------
  CalList0         = 'calibration';
  StdList0         = 'landolt';

{Commands and States Used Internally in the GUI:}
//Communication with control computers exist?
  CommStatusOK      = 0;
  CommStatusError   = 1;

  ConnectionSuccessful = 0;
  ConnectFailled    = 1;

  IO_Cmd_Failed     = -1;
  IO_Device_Idle    = 0;
  IO_CCDBusy        = 1;

//------------------------------------------------------------------------------
// FILTER WHEEL
//------------------------------------------------------------------------------
//  FilterPcIP0       = '132.66.65.4';    // old camctlr-pc
  FilterPcIP0       = '132.66.65.19';  // PI-2006
//  FilterPcIP0       = '132.66.134.32';   // tests at TAU
  FilterPcPort0     = 7070;

  FWGetStatus       = '-1';
  FWGetFilterList   = '-2';
  FWGetFilterFile   = '-3';
  FWFilterFile      = '-4'; //Not implemented yet

  FWIdle            = 0;
  FWMovingCW        = 1;
  FWMovingCCW       = 2;
  FWOff             = 3;
  FWStuck           = 4;
  FWEditMode        = 5;

  FWStateStr :  array[FWIdle..FWEditMode] of string =('Filters Idle', 'Move CW',
         'Move CCW', 'Filters controler not connected','FW Stuck', 'FW EditMode');

  msgOK             = '.';
  msgErr            = '+';
  IntStrError       = -999; //default value for StrTOIntDef.

//------------------------------------------------------------------------------
// Dome
//------------------------------------------------------------------------------
//DomePcIP0         = '132.66.65.9';
  DomePcIP0         = '127.0.0.1';
  DomePcPort0       = 7080;
  DomeMinMv0        = 1.0;   //[deg] Minimal dome movement
  DomeParkPos0      =  90.0; //[deg] Dome azimuth at Zenith Park
  DomeFlatPos0      = 270.0; //[deg] Dome azimuth for Dome Flats
  DomeVentsPos0     = 162.0; //[deg] Dome azimuth to bring the VentBox above stairs

//------------------------------------------------------------------------------
// Dome Microphone
//------------------------------------------------------------------------------
  MicIP0               = '132.66.65.12';  //guider-pc. Ezra-pc: '132.66.135.21'

//------------------------------------------------------------------------------
// Telescope
//------------------------------------------------------------------------------
  ScopePcIP0          = '132.66.65.9';
  ScopePcPort0        = 7050;

  ScopeGetState       = '0';
  ScopeGetCoord       = '1';  //MUST BE 1-CHAR COMMANDS!
  ScopeSetRA          = '2';
  ScopeSetHA          = '3';
  ScopeSetRATrackOn   = '4';
  ScopeSetRATrackOff  = '5';
  ScopeSetStop        = '6';

  ScopeIdle           = '0';
  ScopeMovingRA       = '1';
  ScopeMovingDec      = '2';
  ScopeFSError        = '3';
  ScopeMoving         = '4';
  ScopeRATrackChnaged = '5';

//------------------------------------------------------------------------------
// Focus
//------------------------------------------------------------------------------
  FocusPcIP0          = '132.66.65.4';
  FocusPcPort0        = 8010;

  FocusSendState      = 'k';
{
}
//------------------------------------------------------------------------------
// CCD Temperature
//------------------------------------------------------------------------------
  CCDTempIP0          = '132.66.65.4';
  CCDTempPort0        = 7060;

  CCDTempGetState     = '-1';
  CCDTempReset        = '-2';

  CCDTempOK           = 0;
  CCDTempHOT          = 1;
  CCDTempResetMode    = 2;
  CCDTempDontCare     = 3;

//------------------------------------------------------------------------------
// C18 - the clouds sensor on wo-neo
//------------------------------------------------------------------------------
  C18IP0          = '132.66.65.16';
  C18Port0        = 7040;

  C18GetState     = '-1';
  C18Reset        = '-2';

  C18Unknown      = 0;
  C18Clear        = 1;
  C18Cloudy       = 2;
  C18VeryCloudy   = 3;
  C18Rain         = 4;

//------------------------------------------------------------------------------
// Weather - the meteorology station on weather-pc
//------------------------------------------------------------------------------
  WeatherIP0      = '132.66.65.20';
  WeatherPort0    = 7278;

  WeatherGetState     = '1';
//  C18Reset        = '-2';

//  C18Unknown      = 0;
//  C18Clear        = 1;
//  C18Cloudy       = 2;
//  C18VeryCloudy   = 3;
//  C18Rain         = 4;


//------------------------------------------------------------------------------
// PMIS Relay
//------------------------------------------------------------------------------
//  PMISIP0             = '132.66.65.4';   // Tek IP
  PMISIP0             = '132.66.65.19';   // PI IP
  PMISPort0           = 7090;

  PMISSendState       = '0';
  PMISExecLine        = '1';
  PMISGetMeanCount    = '2';               // DP 22June2007

  PMISIdle            = 0;
  PMISExposing        = 1;


//------------------------------------------------------------------------------
// Remote Controler Server
//------------------------------------------------------------------------------

  rcServerPort         = 7070;

//------------------------------------------------------------------------------
// LAIWO for dome operation
//------------------------------------------------------------------------------

  LaiwoPort0        = 7091;


//------------------------------------------------------------------------------
// LAIWO Science
//------------------------------------------------------------------------------

  LaiwoSciencePort0        = 9300;
  LaiwoScienceIP0          = '132.66.65.24';   // LAIWO Science IP


//------------------------------------------------------------------------------
// LAIWO Guider
//------------------------------------------------------------------------------

  LaiwoGuiderPort0        = 9200;
  LaiwoGuiderIP0          = '132.66.65.24';   // LAIWO Guider IP



//------------------------------------------------------------------------------
//  Input Rules
//------------------------------------------------------------------------------
  LimitEpoch          = TRUE;        //Given Epoch Confined to Given Limit
  MinEpoch            = 1900.0;                  //[year] Lower limit for given epoch
  MaxEpoch            = 2100.0;                  //[year] Upper limit for given epoch
  MinExpTime          = 0.1;                   //[sec]  Shortest allowed Exposure time

var
{--------------------------------------
 File Locations and Default Extentions
---------------------------------------}
  IniFile        :string = IniFile0;
  LisPath        :string = LisPath0;
  LisExtn        :string = LisExtn0;
  FchartPath     :string = FchartPath0;
  FchartExtn     :string = FchartExtn0;
  FcSize         :real   = FcSize0;                   //Default size of FCs [arcmin]
  BrowserOption  :integer = BrowserOption0;           //0:SysDefault; 1:IE; 2:Specified
  BrowserPath    :string = '';
  NetMeetOption  :integer = NetMeetOption0;           //0:SysDefault; 1:Specified
  NetMeetPath    :string = '';
  ImgViewerOption :integer = ImgViewerOption0;        //0:SysDefault; 1:Specified
  ImgViewerPath  :string = '';
{-------------------------------
 Default *.LST Filenames
--------------------------------}
  CalList        :string = CalList0;
  StdList        :string = StdList0;
{-------------------------------
 Instrumnet ID Details
--------------------------------}
  Instrumnet     :string = Instrumnet0;
  Detector       :string = Detector0;
  MaxTEKX        :integer = MaxTEKX0;
  MaxTEKY        :integer = MaxTEKY0;
{-------------------------------
 Filter Wheel Variables
--------------------------------}
  FilterPcIP     : string = FilterPcIP0;
  FilterPcPort   : integer = FilterPcPort0;
  FWState        : integer = FWidle; //[ FWIdle | FWBusy | FWStuck ]
  FilterPcConnected :Boolean = FALSE;
{-------------------------------
 Dome Variables
--------------------------------}
  DomePcIP       : string = DomePcIP0;
  DomePcPort     : integer = DomePcPort0;
  DomePcConnected : boolean = FALSE;
  DomeMinMv      : real = DomeMinMv0;
  DomeParkPos    : real = DomeParkPos0;
  DomeFlatPos    : real = DomeFlatPos0;
  DomeVentsPos   : real = DomeVentsPos0;
  DomeTrackOn    : boolean=FALSE;
  DomeSlitStatus : char;
  DomeStatus     : char;
  DomeAzimuth    : real; //[deg]
  DomeTelescopeAz : real; //[deg]
  DomeShutterPos : real; //[0.0=closed .. 1.0=open]

{-------------------------------
  Dome Microphone
--------------------------------}
  MicIP          : string = MicIP0;
{-------------------------------
 Telescope Variables
--------------------------------}
  ScopePcIP      : string = ScopePcIP0;
  ScopePcPort    : integer = ScopePcPort0;
  ScopePcConnected : boolean=False;
//TAKE THE FOLLOWING OUT, PUT IN Protocol!
  GotoStatus     : char;  //[ScopeIdle |ScopeMoving |ScopeError]
  RATrackOn      : boolean;  //[RATrackOn |RATrackOff]
  ScopeRA        : extended = IntStrError;   //RA i n Radians
  ScopeDec       : extended = IntStrError;   //Dec in Radians
  ScopeHA        : extended = IntStrError;   //HA  in Radians

{-------------------------------
 Focus Variables
--------------------------------}
  FocusIP        : string = FocusPcIP0;
  FocusPort        : integer = FocusPcPort0;
  FocusConnected   : boolean=False;

{-------------------------------
 CCD Temperature Variables
--------------------------------}
  CCDTempIP      : string = CCDTempIP0;
  CCDTempPort    : integer = CCDTempPort0;
  CCDTempConnected : boolean=False;
  CCDTempStatus  : integer;

{-------------------------------
 C18 Variables
--------------------------------}
  C18IP      : string = C18IP0;
  C18Port    : integer = C18Port0;
  C18Connected : boolean=False;
  ClarityStatus  : integer;

{-------------------------------
 Weather Variables
--------------------------------}
  WeatherIP         : string = WeatherIP0;
  WeatherPort       : integer = WeatherPort0;
  WeatherConnected  : boolean=False;

{-------------------------------
 PMIS Relay Variables
--------------------------------}
  PMISIP         : string = PMISIP0;
  PMISPort       : integer = PMISPort0;
  PMISConnected  : boolean=False;
  PMISStatus     : integer;
  PMISCCDArea    : integer = 0;

  MaxXFrame, MaxYFrame : integer;

{-------------------------------
 LAIWO Variables
--------------------------------}

LaiwoPort    : integer = LaiwoPort0;


{-------------------------------
 LAIWO Science Variables
--------------------------------}

  LaiwoScienceIP         : string = LaiwoScienceIP0;
  LaiwoSciencePort       : integer = LaiwoSciencePort0;
  LaiwoScienceConnected  : boolean=False;
  LaiwoScienceStatus     : integer;


{-------------------------------
 LAIWO Guider Variables
--------------------------------}

  LaiwoGuiderIP         : string = LaiwoGuiderIP0;
  LaiwoGuiderPort       : integer = LaiwoGuiderPort0;
  LaiwoGuiderConnected  : boolean=False;
  LaiwoGuiderStatus     : integer;






//******************************************************************************
// updates valuse from INI file (if exists)
  procedure InitConsts;

implementation

procedure InitConsts;
var
  Ini_File: TIniFile;
begin
  DefaultAMLimit     := DefaultAMLimit0;
  AMLimit            := AMLimit0;

  if fileexists(IniFile) then
  with Ini_File do begin
       Ini_File      := TIniFile.Create(IniFile);
       LisPath       := ReadString ('Local', 'LisPath',    LisPath);
       LisExtn       := ReadString ('Local', 'LisExtn',    LisExtn);
       FchartPath    := ReadString ('Local', 'FchartPath', FchartPath);
       FchartExtn    := ReadString ('Local', 'FchartExtn', FchartExtn);
       BrowserOption := ReadInteger('Local', 'Browser',    BrowserOption);
       BrowserPath   := ReadString ('Local', 'BrowserPath', BrowserPath);
       NetMeetOption := ReadInteger('Local', 'NetMeet',    NetMeetOption);
       NetMeetPath   := ReadString ('Local', 'NetMeetPath', NetMeetPath);
       ImgViewerOption := ReadInteger('Local', 'ImgViewer', ImgViewerOption);
       ImgViewerPath := ReadString ('Local', 'ImgViewerPath', ImgViewerPath);
       CalList       := ReadString ('Local', 'CalList',    CalList);
       StdList       := ReadString ('Local', 'StdList',    StdList);
       Detector      := ReadString ('Detector', 'Detector', Detector);
       Instrumnet    := ReadString ('Detector', 'Instrumnet', Instrumnet);
       MaxTEKX       := ReadInteger('Detector', 'MaxTEKX', MaxTEKX);
       MaxTEKY       := ReadInteger('Detector', 'MaxTEKY', MaxTEKY);
//     TimeZone       := ReadInteger('Site', 'TimeZone', TimeZone);
//     DayLightSaving := ReadInteger('Site', 'DayLightSaving', DayLightSaving);
//FilterPc
       FilterPcIP    := ReadString ('FilterWheel', 'FilterPCIP', FilterPcIP);
       FilterPcPort  := ReadInteger('FilterWheel', 'FilterPCIP', FilterPcPort);
//DomePc
       MicIP         := ReadString ('Dome', 'MicIP',        MicIP);
       DomePCIP      := ReadString ('Dome', 'DomePCIP',     DomePCIP);
       DomePCPort    := ReadInteger('Dome', 'DomePCPort',   DomePCPort);
       DomeMinMv     := ReadFloat  ('Dome', 'DomeMinMv',    DomeMinMv);
       DomeParkPos   := ReadFloat  ('Dome', 'DomeParkPos',  DomeParkPos);
       DomeFlatPos   := ReadFloat  ('Dome', 'DomeFlatPos',  DomeFlatPos);
       DomeVentsPos  := ReadFloat  ('Dome', 'DomeVentsPos', DomeVentsPos);
//TelescopePc
       ScopePCIP     := ReadString ('Setting', 'ScopePCIP',   ScopePCIP);
       ScopePCPort   := ReadInteger('Setting', 'ScopePCPort', ScopePCPort);
//Focus
       FocusIP     := ReadString ('Focus', 'FocusIP',   FocusIP);
       FocusPort   := ReadInteger('Focus', 'FocusPort', FocusPort);
//PMIS Relay
       PMISIP        := ReadString ('PMIS', 'PMISIP', PMISIP);
       PMISPort      := ReadInteger('PMIS', 'PMISPort', PMISPort);
//CCD Temperature
       CCDTempIP     := ReadString ('CCDTemp', 'CCDTempIP',   CCDTempIP);
       CCDTempPort   := ReadInteger('CCDTemp', 'CCDTempPort', CCDTempPort);
//C18
       C18IP     := ReadString ('C18', 'C18IP',   C18IP);
       C18Port   := ReadInteger('C18', 'C18Port', C18Port);
//Weather
       WeatherIP     := ReadString ('Weather', 'WeatherIP',   WeatherIP);
       WeatherPort   := ReadInteger('Weather', 'WeatherPort', WeatherPort);

//Laiwo
       LaiwoPort   := ReadInteger('Laiwo', 'LaiwoPort', LaiwoPort);

       Free;
     end;
     if detector = 'TEK' then begin
         MaxXFrame := MaxTEKX;
         MaxYFrame := MaxTEKY;
     end else
      showmessage('Interface for detector: '+Detector+' is not implemented');
end;

end.
