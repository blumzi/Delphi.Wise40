unit main;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Menus, Grids, ComCtrls, StdCtrls, Dialogs, TabNotBk, ExtCtrls, StrUtils,
  ScktComp, Buttons, ValEdit, ToolWin, ShellApi, Math, MMSystem, Spin,
  ImgList, Mask, ClipBrd, Winsock, WiseAppLock;

  
{$R sounds.res}

type
  TROForm = class(TForm)

// Telescope Entries
    TelescopeBox: TGroupBox;
    BtnGoTo: TBitBtn;
    BtnGotoStop: TBitBtn;
    BZenPark: TButton;
    BDFPark: TButton;
    BSkyFF: TButton;
    BMCPark: TButton;
    BCalStar: TButton;
    Tabs: TPageControl;
    TabRA: TTabSheet;
    RATarget: TLabeledEdit;
    RARA: TLabeledEdit;
    RADec: TLabeledEdit;
    RAEpoch: TLabeledEdit;
    AddToGridB: TButton;
    TabOffset: TTabSheet;
    TabHA: TTabSheet;
    HATarget: TLabeledEdit;
    HAHA: TLabeledEdit;
    HADec: TLabeledEdit;
// Detector Entries
    DetectorBox: TGroupBox;
    BtnObserve: TBitBtn;
    BtnStopObserve: TBitBtn;
    BImIaquire: TButton;
    BImBias: TButton;
    BImArea: TButton;
    BTmpImg: TButton;
    CamExp: TValueListEditor;
// Clock & Pos Entries
    PosBox: TGroupBox;
    UTEdit: TLabeledEdit;
    STEdit: TLabeledEdit;
    LTEdit: TLabeledEdit;
    JDEdit: TLabeledEdit;
    EpochEdit: TLabeledEdit;
    RAEdit: TLabeledEdit;
    DecEdit: TLabeledEdit;
    HAEdit: TLabeledEdit;
    AMEdit: TLabeledEdit;
    MoonBox: TGroupBox;
    MoonAltEdit: TLabeledEdit;
    MoonDistEdit: TLabeledEdit;
    SunBox: TGroupBox;
    SunAltEdit: TLabeledEdit;
// Dome Entries
    DomBox: TGroupBox;
    TeleBox: TGroupBox;
    MainMenu: TMainMenu;
    Dome1: TMenuItem;
    SetSlitMenu: TMenuItem;
    SetAzimuthMenu: TMenuItem;
    SetDomeTrackOn: TMenuItem;
    FocusLabel: TLabel;
    SetDomeLightsOn1: TMenuItem;
    GuideBox: TGroupBox;
    GuiderStatusLabel: TLabel;
    SlitAzLabel: TLabel;
    SlitStatusLabel: TLabel;
    CloseAircondition1: TMenuItem;
    Telescope1: TMenuItem;
    SetRATrackMenu: TMenuItem;
    VentsLabel: TLabel;
    FlatLAmpLabel: TLabel;
    List1: TMenuItem;
    PrintSetup1: TMenuItem;
    Print1: TMenuItem;
    N2: TMenuItem;
    SaveAs_List: TMenuItem;
    Save_list: TMenuItem;
    Open1: TMenuItem;
    SetVentsMenu: TMenuItem;
    FlatLamp1: TMenuItem;
    OpenListDlg: TOpenDialog;
    SaveListDlg: TSaveDialog;
    File1: TMenuItem;
    Preferences1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    ClockUpdateTimer: TTimer;
    ShutterBtn: TButton;
    SlitAzimuthBtn: TButton;
    VentsBtn: TButton;
    FlatLampBtn: TButton;
    FocusBtn: TButton;
    GuiderBtn: TButton;
    ListPg: TPageControl;
    N1Landolt1: TMenuItem;
    N2BrightStarCatalog1: TMenuItem;
    N3MasterList1: TMenuItem;
    AltEdit: TLabeledEdit;
    AZEdit: TLabeledEdit;
    MoonRAEdit: TLabeledEdit;
    MoonDecEdit: TLabeledEdit;
    MoonIllumEdit: TLabeledEdit;
    FilterWheel: TRadioGroup;
    FilterSocket: TClientSocket;
    DomeSocket: TClientSocket;
    Help1: TMenuItem;
    StatusBar1: TStatusBar;
    SiteInfo1: TMenuItem;
    About1: TMenuItem;
    Contents1: TMenuItem;
    FWConnect: TMenuItem;
    FWReload: TMenuItem;
    FWDisconnect: TMenuItem;
    ObsCycle: TLabeledEdit;
    AutoCycle: TLabeledEdit;
    TerminalMemo: TMemo;
    DomeConnect: TMenuItem;
    DomeDisconnect: TMenuItem;
    ScopeConnect: TMenuItem;
    ScopeDisconnect: TMenuItem;
    ScopeSocket: TClientSocket;
    CCDTempSocket: TClientSocket;
    Sockets: TMenuItem;
    CCDTempReadTemperature: TMenuItem;
    emperature1: TMenuItem;
    FilterWheel2: TMenuItem;
    PMISConnect: TMenuItem;
    PMISDisconnect: TMenuItem;
    PMISSocket: TClientSocket;
    RAPrBar: TProgressBar;
    RABarLabel: TLabel;
    DecPrBar: TProgressBar;
    DecBarLabel: TLabel;
    GoToTimer: TTimer;
    ListPopUp1: TPopupMenu;
    ListSaveAs: TMenuItem;
    ListSave: TMenuItem;
    ListClose: TMenuItem;
    ListPopUp2: TPopupMenu;
    InsGridLine: TMenuItem;
    DelGridLine: TMenuItem;
    ListReload: TMenuItem;
    ObsCycleStatus: TLabel;
    DecBarLbl1: TLabel;
    RABarLbl1: TLabel;
    CamFrameSquare: TCheckBox;
    CoordOKLabel: TLabel;
    CoordErrLabel: TLabel;
    ToolbarImages: TImageList;
    FiterMnu: TPopupMenu;
    B1: TMenuItem;
    V1: TMenuItem;
    R1: TMenuItem;
    U1: TMenuItem;
    Connectall: TMenuItem;
    Disconnectall: TMenuItem;
    Connect1: TMenuItem;
    Disconnect1: TMenuItem;
    AutoMode: TCheckBox;
    BtnFChart: TBitBtn;
    RatRACKl: TLabel;
    RATrackBtnOn: TSpeedButton;
    RATrackBtnOff: TSpeedButton;
    Label7: TLabel;
    DmTrackOnBtn: TSpeedButton;
    DmTrackOffBtn: TSpeedButton;
    PosCombo: TComboBox;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    SlitThAzLbl: TLabel;
    CCDBinYEdt: TSpinEdit;
    CCDBinXEdt: TSpinEdit;
    CamTopCorner: TSpinEdit;
    CamLeftCorner: TSpinEdit;
    CamFrmSizeX: TSpinEdit;
    CamFrmSizeY: TSpinEdit;
    Label5: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    CamRepete: TSpinEdit;
    Label13: TLabel;
    CamAMLim: TLabeledEdit;
    CheckBox1: TCheckBox;
    Label14: TLabel;
    Label15: TLabel;
    CamUTLim: TLabeledEdit;
    GraphicMove: TButton;
    RotatorE: TEdit;
    Rotator: TLabel;
    RotatorSpinB: TSpinButton;
    AMLimSpinB: TSpinButton;
    AutoDomeTrack: TMenuItem;
    Window1: TMenuItem;
    Clock1: TMenuItem;
    erminal1: TMenuItem;
    N6: TMenuItem;
    Undo1: TMenuItem;
    Clear1: TMenuItem;
    OffsetRAE: TLabeledEdit;
    CBRAOffsetUnits: TComboBox;
    OffsetDecE: TLabeledEdit;
    ComboBox2: TComboBox;
    CopyPop: TMenuItem;
    PastePop: TMenuItem;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    FiltersTable1: TMenuItem;
    ShowPad1: TMenuItem;
    INSTchoose: TComboBox;
    BImFlatField: TButton;
    Debugoptions1: TMenuItem;
    LaiwoSocket: TServerSocket;
    C18Socket: TClientSocket;
    SkyClarityBox: TGroupBox;
    SkyStatLabel: TLabel;
    C18Connect: TMenuItem;
    C18Disconnect: TMenuItem;
    FocusSocket: TClientSocket;
    FocusConnect: TMenuItem;
    FocusDisconnect: TMenuItem;
    WeatherSocket: TClientSocket;
    WeatherConnect: TMenuItem;
    WeatherDisconnect: TMenuItem;
    Meteorology1: TMenuItem;
    WeatherBtn: TButton;
    MeteorologyMnu: TMenuItem;
    CCDTempLbl: TLabel;
    CCDTempLabel: TLabel;
    CCDStatusLabel: TLabel;
    CCDSttusLbl: TLabel;
    ExposurePrgrsBar: TProgressBar;
    CCDExpLabel: TLabel;
    ObsTimer: TTimer;
    LaiwoScienceConnect: TMenuItem;
    LaiwoScienceSocket: TClientSocket;
    LaiwoScienceDisconnect: TMenuItem;
    LaiwoGuiderSocket: TClientSocket;
    LaiwoGuiderConnect: TMenuItem;
    LaiwoGuiderDisconnect: TMenuItem;
    UseGuider: TCheckBox;
    rcServerSocket: TServerSocket;
//------------------------------------------------------------------------------
//
    procedure Formcreate(Sender: TObject);
//------------------------------------------------------------------------------
// updates valuse from INI file (if exists)
    procedure InitFilters(Sender: TObject);
//------------------------------------------------------------------------------
//
    procedure BParkClick(Sender: TObject);
    procedure TabsChange(Sender: TObject);
    procedure FlatLamp1Click(Sender: TObject);
    procedure ObjListClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ObjListHint(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    Procedure ObjListUpdateEntries(Sender: TObject);
    procedure LoadLisFile(Sender: TObject);
    procedure ObjListLock(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure OpenFChart(Sender: TObject);
    procedure FlatLampMenu(Sender: TObject);
    procedure BtnStopObserveClick(Sender: TObject);
    procedure UpdateClocks(Sender: TObject);
    procedure btnClick(Sender: TObject);
//    procedure Update_DomeSlitControls(Sender: TObject);
    function GotoExec(Sender: TObject):Boolean;
    procedure GotoClick(Sender: TObject);
//    procedure Update_RATrackControls(Sender: TObject);
    procedure FilterWheelGo(Sender: TObject);
    procedure ExpCycle(Sender: TObject);
    procedure SelectFilterWheelPos(s:string);
    procedure TakeExposure(Sender: TObject);
    procedure AutoModeClick(Sender: TObject);
    procedure FWDisconnectClick(Sender: TObject);
    procedure FilterSocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FilterSocketConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FilterSocketError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure FilterSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure BtnObserveClick(Sender: TObject);
    procedure AutoCycleChange(Sender: TObject);
    procedure BtnGotoStopClick(Sender: TObject);
    procedure FWReloadClick(Sender: TObject);
    procedure InitDome(Sender: TObject);
    procedure DomeDisconnectClick(Sender: TObject);
    procedure DomeSocketError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure DomeSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure DomeSocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure DomeSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ScopeSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ScopeSocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ScopeSocketError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ScopeDisconnectClick(Sender: TObject);
    procedure ScopeConnectClick(Sender: TObject);
    procedure ScopeSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure Exit1Click(Sender: TObject);
    procedure CCDTempConnectClick(Sender: TObject);
    procedure CCDTempDisconnectClick(Sender: TObject);
    procedure CCDTempSocketConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure CCDTempSocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure CCDTempSocketError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure CCDTempSocketRead(Sender: TObject; Socket: TCustomWinSocket);

    procedure LaiwoScienceConnectClick(Sender: TObject);
    procedure LaiwoScienceDisconnectClick(Sender: TObject);
    procedure LaiwoScienceSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure LaiwoScienceSocketDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure LaiwoScienceSocketError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure LaiwoScienceSocketRead(Sender: TObject;
      Socket: TCustomWinSocket);

    procedure LaiwoGuiderConnectClick(Sender: TObject);
    procedure LaiwoGuiderDisconnectClick(Sender: TObject);
    procedure LaiwoGuiderSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure LaiwoGuiderSocketDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure LaiwoGuiderSocketError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure LaiwoGuiderSocketRead(Sender: TObject;
      Socket: TCustomWinSocket);


    procedure PMISConnectClick(Sender: TObject);
    procedure PMISDisconnectClick(Sender: TObject);
    procedure PMISSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure PMISSocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure PMISSocketError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure PMISSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ListMask(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure GoToTimerTimer(Sender: TObject);
    procedure ListCloseClick(Sender: TObject);
    procedure LogEvent(event: string);
    procedure CamFrameSquareClick(Sender: TObject);
    procedure DomeMic(Sender: TObject);
    procedure ValidateRADataInput(Sender: TObject);
    procedure CamAMLimChange(Sender: TObject);
    procedure ValidateHADataInput(Sender: TObject);
    procedure ConnectallClick(Sender: TObject);
    procedure DisconnectallClick(Sender: TObject);
    procedure Preferences1Click(Sender: TObject);
    procedure ListCalcAM(Sender: TObject);
    procedure BtnStopObserveMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SiteInfo1Click(Sender: TObject);
    procedure GraphicMoveClick(Sender: TObject);
    procedure SpinBDownClick(Sender: TObject);
    procedure SpinBUpClick(Sender: TObject);
    procedure RotatorEExit(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure BImBiasClick(Sender: TObject);
    procedure AutoDomeTrackClick(Sender: TObject);
    procedure CamExpEnter(Sender: TObject);
    procedure CameraControlsColor(Color: TColor);
    procedure CamRepeteChange(Sender: TObject);
    procedure erminal1Click(Sender: TObject);
    procedure Clock1Click(Sender: TObject);
    procedure CamUTLimExit(Sender: TObject);
    procedure ListPgMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DelGridLineClick(Sender: TObject);
    procedure InsGridLineClick(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure ListSaveClick(Sender: TObject);
    procedure ListSaveAsClick(Sender: TObject);
    procedure MeteorologyMnuClick(Sender: TObject);
    procedure AddToGridBClick(Sender: TObject);
    procedure ListReloadClick(Sender: TObject);

    // Added by DP, Spring 2007 
    procedure INSTchooseChange(Sender: TObject);
    procedure BImFlatFieldClick(Sender: TObject);
    function  isTelescopeMoving(Sender: TObject) : Boolean;
    function  isFiltSeqOn(Sender: TObject) : Boolean;
    procedure askCCDMeanCount(Sender: TObject);
    function  GetCCDMeanCount(Sender: TObject) : Extended;
    procedure Debugoptions1Click(Sender: TObject);
    procedure SendAbortImageToCCD(Sender: TObject);
    procedure GuiderBtnClick(Sender: TObject);
    procedure LaiwoSocketClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure C18SocketConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure C18SocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure C18SocketError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure C18ConnectClick(Sender: TObject);
    procedure C18DisconnectClick(Sender: TObject);
    procedure C18SocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure BFocusClick(Sender: TObject);
    procedure FocusSocketConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FocusSocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FocusSocketError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure FocusSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure FocusConnectClick(Sender: TObject);
    procedure FocusDisconnectClick(Sender: TObject);
    procedure GoFocus(Sender: TObject; FocusVal: Integer);
    procedure StopFocus(Sender: TObject);
    procedure WeatherSocketConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure WeatherSocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure WeatherSocketError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure WeatherSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure WeatherConnectClick(Sender: TObject);
    procedure WeatherDisconnectClick(Sender: TObject);
    procedure AnalizeWeather(Sender: TObject);
    procedure Meteorology1Click(Sender: TObject);
    procedure WeatherBtnClick(Sender: TObject);
    procedure PosComboChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure rcServerSocketClientRead(Sender: TObject; Socket: TCustomWinSocket);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ROForm: TROForm;
  StarFWHM_ : extended;
  StarIsSelected_ : Boolean = FALSE;
  hostname:       array[0..63] of Char;

implementation
{$R *.dfm}

uses SlitAz, DomeSlit, SiteInformation, TelePars,
     FlatLamp, WiseConst, WiseMM, Time_Coord, WiseStr, Prefs,
     DomeProtocol, BiasDlg, TestExpDlg, CCDAreaDlg, AcquireDlg,
     WiseMeteorology, Alert, FlatScriptDlg, FocusDlg, LaiwoFilters;


var
  UseGuiderOn   : Boolean =False;
  AutoRunOn     : Boolean =FALSE;
  AutoRunList   : TStringGrid;
  AutoRunObject : integer;

  ExposureOn    : Boolean = FALSE;
  FiltSeqOn     : Boolean = FALSE;
  FiltSeqLine   : integer;
  FiltSeqCycle  : integer;
  FiltSeqObjName: string;
  Texp          :real;

  TelescopeMoving : Boolean = FALSE;
  DomeMoving    :  Boolean = FALSE;

  ScopeSock     : TCustomWinSocket;
  DomeSock      : TCustomWinSocket;
  FocusSock     : TCustomWinSocket;
  LaiwoSciencesock : TCustomWinSocket;
  LaiwoGuidersock  : TCustomWinSocket;
  PMISSock      : TCustomWinSocket;
  FilterSock    : TCustomWinSocket;
  CCDTempSock   : TCustomWinSocket;
  C18Sock       : TCustomWinSocket;
  WeatherSock   : TCustomWinSocket;
  OpenedListFiles : Tstrings;

  ImageMeanCount : extended;
  debugOptions_  : Boolean = FALSE;

  Instrument : string; // The CCD or instrument to be used
  InstrumentFile : TextFile;
  LaiwoGuiderSent : Integer = -1 ;
  LaiwoGuiderSocketTag  : integer = 0;
  LaiwoScienceSocketTag : integer = 0;
  LaiwoLastString : string = 'NONE';

//------------------------------------------------------------------------------
procedure TROForm.Formcreate(Sender: TObject);
//------------------------------------------------------------------------------

begin
  gethostname(hostname, sizeof(hostname));
  ROForm.Left :=Screen.WorkAreaLeft;
  ROForm.Top :=Screen.WorkAreaTop;

//     InitIO;
     InitConsts;
     RATrackON:=  FALSE;
//     GotoStatus :=    {GetDomeSlitState(msg) MOK:}IO_Device_Idle; //Mok
     ClockUpdateTimer.Enabled :=True;
     OpenedListFiles :=TstringList.Create;
     FWState := FWOff;

  
//Laiwo Socket Initialization
  LaiwoSocket.Port     := LaiwoPort;
  LaiwoSocket.Active   := TRUE;
  LaiwoSocket.ServerType := stNonBlocking;

  rcServerSocket.Port       := rcServerPort;
  rcServerSocket.ServerType := stNonBlocking;
  rcServerSocket.Active     := True;
  rcServerSocket.Open;

// Instrument Initialization

  AssignFile(InstrumentFile, 'c:\RemoteObs\InstrumentFile.txt') ;

   if FileExists('c:\RemoteObs\InstrumentFile.txt') then
                begin
                Reset(InstrumentFile);
                ReadLn(InstrumentFile,Instrument);
                CloseFile(InstrumentFile);
                end;
    if (Instrument = 'PI') then
      begin
        INSTchoose.Text := 'PI';
        INSTchoose.ItemIndex := 0 ;
        LAIWOScienceConnect.Enabled := False ;
        LAIWOGuiderConnect.Enabled  := False  ;
      end;
    if (Instrument = 'LAIWO') then
      begin
        INSTchoose.Text := 'LAIWO';
        INSTchoose.ItemIndex := 1 ;
        PMISConnect.Enabled := False ;
        FWConnect.Enabled := False ;
      end;

 //        LaiwoGuiderConnectClick(Sender) ;
end;

//------------------------------------------------------------------------------
procedure TROForm.InitFilters(Sender: TObject);
//------------------------------------------------------------------------------
begin
  if not FilterPcConnected then
  with  FilterSocket do begin
     Address :=FilterPcIP;
     Port :=FilterPcPort;
     Active :=TRUE;
     LogEvent('Opening filter socket '+Address+':'+IntToStr(Port)+'...');
  end;
end;
//------------------------------------------------------------------------------
procedure TROForm.BParkClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
    CameraControlsColor(clWindow);
    if (Sender = BZenPark) then begin
       Tabs.ActivePage :=TabHa;
       HATarget.Text := 'Zenith Park';
       HAHA.Text :='00:00:00.0';
       HADec.Text :=CoordR2Str(SiteNorthLat);
   end else if (Sender = BDFPark) then begin
       Tabs.ActivePage :=TabHa;
       HATarget.Text := 'domeFF';
       HAHA.Text :='-01:35:59.0';
       HADec.Text :='+41:59:20.0';
       CamRepete.Text :='1';
   end else if (Sender = BMCPark) then begin
       Tabs.ActivePage :=TabHa;
       HATarget.Text := 'Mirror Cover Park';
       HAHA.Text :='00 00 00';
       HADec.Text :='+75 00 00';
   end else if (Sender = BSkyFF) then begin
       Tabs.ActivePage :=TabRA;
       RATarget.Text   := 'FF';
       RARA.Text       := STEdit.Text;
       RADec.Text      := CoordR2Str(SiteNorthLat);
       RAEpoch.Text    := EpochEdit.Text;
       CamRepete.Text  :='1';
       CamAMLim.Text   :='1.5';
       CamUTLim.Text    := SiteInfo.NautM.Caption;
       ValidateRADataInput(Sender);
   end;
   TabsChange(Sender);
end;

//------------------------------------------------------------------------------
procedure TROForm.TabsChange(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if (Tabs.ActivePage=TabRa) then begin
        RAEdit.Color :=clMoneyGreen;
        DecEdit.Color :=clMoneyGreen;
        HAEdit.Color :=clWindow;
     end else if (Tabs.ActivePage=TabHa) then begin
        RAEdit.Color :=clWindow;
        DecEdit.Color :=$0099CCFF;
        HAEdit.Color :=$0099CCFF;
      end else if (Tabs.ActivePage=Taboffset) then begin
        if RATrackOn then
          OffsetRAE.EditLabel.Caption := 'R.A.'
        else
          OffsetRAE.EditLabel.Caption := 'H.A.';
        RAEdit.Color :=clSkyBlue;
        DecEdit.Color :=clSkyBlue;
        HAEdit.Color :=clWindow;
      end;
end;

//------------------------------------------------------------------------------
procedure TROForm.FlatLamp1Click(Sender: TObject);
//------------------------------------------------------------------------------
begin
  ShowMessage('PopUpMenu created.');
     if  MessageDlg('Welcome to my Object Pascal application.  Exit now?',
      mtCustom, [mbYes, mbNo], 0) = mrYes  then begin
        MessageDlg('Exiting the Object Pascal application.', mtInformation,
                    [mbOk], 0);
     end ;
     DomeFlatDlg.Create(Self);
end;

//------------------------------------------------------------------------------
Procedure TROForm.ObjListClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//------------------------------------------------------------------------------
var
//  msg :string;
  c, sum   :integer;
//  TROw   :integer;
  SignedSort : Boolean;
//  TRA, TDec,  TAlt, TAz, TAM, TEpoch : extended;
begin
  with (Sender as TStringGrid) do

//Sort if TOp column clicked
  if y<=rowheights[0] then begin
     ListPg.PopupMenu.AutoPopup := False;
     PopUpMenu.AutoPopup := FALSE;
     c:=0;
     sum :=0;
     while (sum <= X ) And (C<ColCount) do begin
          sum := sum +COlwidths[c];
          c:=c+1;
     end;
     c:= c-1;

     if c in [3, 9] then     // the DEC and AM fields
       SignedSort := TRUE
     else
       SignedSort := FALSE;

     if (Button = mbLeft) then
        sortgrid((Sender as TStringGrid),c, TRUE, SignedSort)
     else if (Button = mbRight) then
        sortgrid((Sender as TStringGrid),c, FALSE, SignedSort);
     exit;
//Edit Mode if Alt+ left mouse
(*  end else   if x<=colwidths[0] then begin
     TRow :=  y div DefaultRowHeight;
     if ValidateRA(Cells[2,TRow], TRA) AND ValidateDec(Cells[3,TRow], TDec)
         AND ValidateEpoch(Cells[4,TRow], TEpoch) then begin
        CalcAltAz(TRA, TDec, STNow, SiteNorthLat,  TAlt, TAz);
        TAM := CalcAM(TAlt);
       showmessage(Format('%s:  AM=%0.1f  Alt=%0.1f°  Moon dist=%0.1f°',
          [Cells[1,TRow], TAM, TAlt/pi*180, SphereDist(TRA, TDec, MoonRA, MoonDec)/pi*180]) );
     end; *)
  end else if (ssAlt in Shift) then  begin
     Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goEditing];
     exit;
//Popup if right mouse
  end else if (Button = mbRight) then
     PopUpMenu.AutoPopup := TRUE
  else begin
     Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRowSelect];
     if not AutoRunOn then
        ObjListUpdateEntries(Sender);
  end;
//// OBSOLETE: MOVED TO 'BtnGOTOClick
//  if AutoRunOn then begin
//     AutoRunList       := (Sender as TStringGrid);
//     AutoRunObject     := (Sender as TStringGrid).Row;
//     msg :=Format('Press START to run %s, starting from object %d',[ListPg.ActivePage.Caption,AutoRunObject]);
//     showMessage(msg);
//  end else
end;
//------------------------------------------------------------------------------
Procedure TROForm.ObjListHint(Sender: TObject; Shift: TShiftState; X, Y: Integer);
//------------------------------------------------------------------------------
 var
  TROw   :integer;
  TRA, TDec,  TAlt, TAz, TAM, TEpoch : extended;
begin
  with (Sender as TStringGrid) do begin
     TRow :=  y div DefaultRowHeight;
   if ValidateRA(Cells[2,TRow], TRA) AND ValidateDec(Cells[3,TRow], TDec)
      AND ValidateEpoch(Cells[4,TRow], LimitEpoch, MinEpoch, MaxEpoch, TEpoch) then begin
      CalcAltAz(TRA, TDec, STNow, SiteNorthLat,  TAlt, TAz);
      TAM := CalcAM(TAlt);
      Hint := (Format('%s:  AM=%0.1f  Alt=%0.1f°  Moon dist=%0.1f°',
          [Cells[1,TRow], TAM, TAlt/pi*180, SphereDist(TRA, TDec, MoonRA, MoonDec)/pi*180]) );
     end;
   end;
end;
//------------------------------------------------------------------------------
Procedure TROForm.ObjListUpdateEntries(Sender: TObject);
//------------------------------------------------------------------------------
var
    i,j:integer;
//    StrVal : Extended;
    Tokens: TStrings;
begin
    with (Sender as TStringGrid) do begin
      RATarget.Text := Cells[1,Row];
      RARA.Text := Cells[2,Row];
      RADec.Text := Cells[3,Row];
      RAEpoch.Text := Cells[4,Row];


      ValidateRADataInput(Sender);

      if not (FiltSeqOn) then begin
         CamFrmSizeX.Text := Cells[6,Row];
         CamFrmSizeY.Text := Cells[6,Row];
         CamRepete.Text :=Cells[7,Row];
         if ( Cells[8,Row] <>'' ) then
           CamAMLim.Text := Cells[8,Row]
         else
           CamAMLim.Text := FloatToStr(DefaultAMLimit);

         CamUTLim.Text    := SiteInfo.NautM.Caption;

         ObsCycleStatus.Caption :='';
         CamExp.InsertRow(' ', ' ', true);
         for i:= (CamExp.RowCount-1) downto 1 do
           CamExp.DeleteRow(i);

         Tokens:=TStringList.Create;
         try
           Tokens.Clear;
           ParseStr(Cells[5,Row], Tokens,' ');
           j:=0;
           while j<Tokens.Count-1 do begin
              CamExp.InsertRow(Tokens[j],Tokens[j+1], true);
              j:=j+2;
           end;
         finally
           Tokens.Free;
         end;
      end;
    end;

    if CamFrmSizeX.Text ='' then
       CamFrmSizeX.Text := IntToStr(MaxXFrame);

    if CamRepete.Text ='' then
       CamRepete.Text := '1';

    Tabs.ActivePage :=TabRa;
    TabsChange(Sender);
end;

//------------------------------------------------------------------------------
procedure TROForm.LoadLisFile(Sender: TObject);
//------------------------------------------------------------------------------
const
   TableHeaders :array[0..9] of string =('#','Name', 'R.A.', 'Dec.','Epoch',
      'Exposures','Frame','nItr','<AM','AM'  ) ;
   TableWidths :array[0..9] of integer = (25, 75, 65, 65, 50, 200, 65, 30, 30,30);

Var
   LisfileName,ListName,S: string;
   InList, Tokens: TStrings;
   i, j: integer;
   LisTab: TTabSheet;
   LisGrid:TStringGrid;
begin
   if (ListPg.PageCount>=MaxLists) then begin
      ShowMessage('Can''t open any more lists.');
      exit;
   end;

   if not OpenListDlg.Execute then
      exit;   //No File was selected
   {Create A new List Table}
   LisfileName:=OpenListDlg.FileName;
   ListName := ChangeFileExt(ExtractFileName(LisfileName),'');

   if (OpenedListFiles.IndexOf(LisfileName) > -1) then begin
     ShowMessage('List '+LisfileName+' allready opened');
     exit;
   end;
   OpenedListFiles.Append(LisfileName);
   for j := 0 to ListPg.PageCount-1 do
      if ListName = ListPg.Pages[j].Caption  then
        ListName :=ListName+'*';

      LisTab:=TTabSheet.Create(ListPg);
      LisTab.PageControl:=ListPg;
      LisTab.Caption:=ListName;
      LisTab.Tag := OpenedListFiles.IndexOf(LisfileName); //Save a pointer to "real" file name
      ListPg.ActivePageIndex := ListPg.PageCount-1;
   //    LisTab.PopupMenu :=0;
     {Create A new List Table}

      LisGrid:= TStringGrid.Create(LisTab);
      with LisGrid do begin
        Parent:= LisTab;
        RowCount:=1;
        Width := ListPg.Width-10;
        Height := ListPg.Height-10;
        ColCount :=10;
        DefaultColWidth :=65;
        DefaultRowHeight:=18;
        Height := ListPg.Height-25;
        Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goEditing,goRowSelect];
        OnMouseDown := ObjListClick;
        OnMouseMove := ObjListHint;
        OnGetEditMask := ListMask;
        PopUpMenu := ListPopUp2;
        PopupMenu.AutoPopup := FALSE;
        PopUpMenu.Alignment := paRight;
        for i:=0 to 9 do begin
           Cells[i,0]:= TableHeaders[i];
           ColWidths[i]:=TableWidths[i];
        end;
        Tokens:=TStringList.Create;
        InList:= TStringList.Create;
        (*use Dynamic arrays here: SetLength(Array, n) *)
        try
          InList.LoadFromFile(LisfileName);
          for i:=1 to InList.Count do begin
            S:=InList.Strings[i-1];
            Tokens.Clear;
            ParseStr(S, Tokens,' ');
            if Tokens.Count <5 then
              showMessage('line #'+Format('%d',[i])+': ''' +StringReplace(S, '  ', ' ',[rfReplaceAll])+ ''' illegel')
            else begin
              RowCount:=RowCount+1;
              Cells[0,RowCount-1]:=Tokens[0];Cells[1,RowCount-1]:=Tokens[4];
              Cells[2,RowCount-1]:=Tokens[1];Cells[3,RowCount-1]:=Tokens[2];
              Cells[4,RowCount-1]:=Tokens[3];
              if (Tokens.Count>5) then
                 cells[5,RowCount-1]:=AppendStr(Tokens,5);
            end;
          end;
        finally
          Tokens.Free;
          InList.Free;
        end;
        if RowCount>1 then
           FixedRows:=1
        else begin
            //Empty List!
        end;
     end;
   Save_list.Enabled   := TRUE;
   SaveAs_List.Enabled := TRUE;
   ListReload.Enabled  := TRUE;
//To enable 'add to list' button. Replace by a more efficiend solution
   ValidateRADataInput(Sender);
   if (ScopePcConnected and ScopePcConnected) then
      AutoMode.Enabled        := TRUE;
end;


//------------------------------------------------------------------------------
procedure TROForm.ObjListLock(Sender: TObject; ACol, ARow: Integer;
//------------------------------------------------------------------------------
  const Value: String);
begin
    //TestInputValidity(ObjList.Cell);
    //Lock Grig for editing;
end;

//------------------------------------------------------------------------------
procedure TROForm.OpenFChart(Sender: TObject);
//------------------------------------------------------------------------------
//const
var
ObjFchart,RAS,DecS: string;
Epoch, RA, Dec           : extended;

begin
        ObjFchart :=  FchartPath + RATarget.Text +'.'+ FchartExtn;
        if FileExists(ObjFchart) then begin
           case ImgViewerOption of
             0: ShellExecute(Handle, 'open', PChar(ObjFchart),nil,nil, SW_SHOWNORMAL);
             1: ShellExecute(Handle, 'open',PChar(ImgViewerPath), PChar(ObjFchart),nil, SW_SHOWNORMAL);
           end;
        end else
        if (MessageDlg('File: '+ ObjFchart +' was not found.  Download from STSCI DSS site?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin

           if not ( ValidateEpoch(RAEpoch.Text, LimitEpoch, MinEpoch, MaxEpoch, Epoch) AND ValidateRA(RARA.Text, RA) AND
                   ValidateDec(RADec.Text, Dec) ) then begin
              ShowMessage('Invalid coordinates!');
              exit;
           end;
           if (Epoch<>2000.0) then
           CalcPrecession(Epoch, 2000.0, RA, Dec, RA, Dec);
           RAS  := StringReplace(TimeF2Str(RA/2/pi),  ':', '+',[rfReplaceAll]);
           DecS := StringReplace(CoordR2Str(Dec), ':', '+',[rfReplaceAll]);
           ObjFchart :=
             'http://archive.stsci.edu/cgi-bin/dss_search?v=3&r='+RAS+'&d='+DecS+
             '&e=J2000&h=13.0&w=13.0&f=gif&c=no&fov=NONE&v3=';
           case BrowserOption of
              0: ShellExecute(Handle, 'open',PChar(ObjFchart),nil, nil, SW_SHOWNORMAL);
              1: ShellExecute(Handle, 'open',PChar('IEXPLORE.EXE'), PChar(ObjFchart),nil, SW_SHOWNORMAL);
              2: ShellExecute(Handle, 'open',PChar(BrowserPath), PChar(ObjFchart),nil, SW_SHOWNORMAL);
           end;
        end;
end;

//------------------------------------------------------------------------------
procedure TROForm.FlatLampMenu(Sender: TObject);
//------------------------------------------------------------------------------
begin
    DomeFlatDlg.Show;
end;

//------------------------------------------------------------------------------
procedure TROForm.BtnStopObserveClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
    if FiltSeqOn and (ObsCycle.Text <> '4')then //This only stops the Cycle. To abort exposure hold the shift button down
    BtnStopObserve.Tag :=1;
    LogEvent('Filter sequence aborted');

{
    if  (INSTchoose.ItemIndex = 1) then begin
// Act as if you got an end of exposure from LAIWO
// Once there will be an abort option to be sent to LAIWO or some output
// that one can relay on when aborting

//         FilterWheel.Tag := FilterWheel.ItemIndex+1;
          PMISStatus := PMISIdle;
          ObsTimer.Enabled := FALSE;
          ObsTimer.Tag := 4;
          TakeExposure(Sender);
//          BtnObserve.Enabled  := TRUE;
          BtnObserve.Enabled  := not FiltSeqOn AND not AutoRunOn;
          BImIaquire.Enabled  := BtnObserve.Enabled;
          BImBias.Enabled     := BtnObserve.Enabled;
          BImFlatField.Enabled := BtnObserve.Enabled;
          BTmpImg.Enabled     := BtnObserve.Enabled;
          BImArea.Enabled     := BtnObserve.Enabled;
          FilterWheel.Enabled := BtnObserve.Enabled;
          GraphicMove.Enabled := BtnObserve.Enabled;
     end;
}

end;

//------------------------------------------------------------------------------
procedure TROForm.UpdateClocks(Sender: TObject);
//------------------------------------------------------------------------------
Var
 MoonColor, SunColor : TColor;

begin
 {Get / Calculate times}
  GetSystemTime(UTnow);

  if ScopePcConnected then
     ScopeSock.SendText(ScopeGetCoord);
  GetLocalTime(LTNow);

  JDnow := CalcJD(UTNow);
  STNow := CalcST(JDNow,SiteEastLong,1);
  Epochnow:= CalcEpoch(JDNow);
  CalcAltAz(ScopeRA, ScopeDec, STNow, SiteNorthLat, AltNow, AzNow);
  AMnow:=CalcAM(AltNow);

  CalcMoonPos(JDNow, STNow, SiteNorthLat, MoonRA, MoonDec, MoonAlt);
  MoonIllum:=CalcMoonIllumFrac(JDNow);
  MoonDist := SphereDist(ScopeRA, ScopeDec, MoonRA, MoonDec);
  SunAlt := CalcSunAltAz(JDNow, STNow, SiteNorthLat).B;

  if (ScopeRA = IntStrError) or (ScopeDec = IntStrError) then begin
     RAEdit.Text    := '';
     DecEdit.Text   := '';
     HAEdit.Text    := '';
     AltEdit.Text   := '';
     AzEdit.Text    := '';
     MoonDistEdit.Text := '';
     AMEdit.Text     := '';
  end else begin
     RAEdit.Text    := TimeF2Str(ScopeRA/2/pi);
     DecEdit.Text   := CoordR2Str(ScopeDec);
     HAEdit.Text    := TimeF2Str(ScopeHA/2/pi);
     AltEdit.Text   := Format('%3.2f°',[RadToDeg(AltNow)]);
     AzEdit.Text    := Format('%3.2f°',[RadToDeg(AzNow)]);
     MoonDistEdit.Text := format('%0.2f°',[RadToDeg(MoonDist)]);
     if AMNow>9 then begin
        AMEdit.Text :='  Inf';
        AMEdit.Font.Color :=clRed;
     end else begin
        AMEdit.Font.Color :=clMenuText;
        AMEdit.Text    := Format('%0.3f',[AMNow]);
  end;
  if not (TelescopeMoving) then
     SlitThAzLbl.Caption := Format('%0.1f°',[DomeTelescopeAz]);

 end;

  UTEdit.Text    := Format('%10s           %02d %02d %4d',[Time2Str(UTnow),
         UTnow.wDay, UTnow.wMonth, UTnow.wYear]);
  LTEdit.Text    := Time2Str(LTnow);
  JDedit.Text    := Format('%10.2f',[JDNow]);
  STEdit.Text    := TimeF2Str(STnow);
  EpochEdit.Text := Format('%0.2f',[Epochnow]);

  MoonRAEdit.Text   := TimeF2Str(MoonRA/2/pi);
  MoonDecEdit.Text  := CoordR2Str(MoonDec);
  MoonAltEdit.Text  := format('%0.2f°',[RadToDeg(MoonAlt)]);
  MoonIllumEdit.Text:= Format('%0.2f',[MoonIllum]);
  SunAltEdit.Text   := Format('%0.2f°',[RadToDeg(SunAlt)]);

  if (CoordOK) then begin
     if (Tabs.ActivePage=TabRa) then begin
        CalcAltAz(TargetRA, TargetDec, STNow, SiteNorthLat,  TargetAlt, TargetAz);
        TargetAM := CalcAM(TargetAlt);
        CoordOKLabel.Caption := Format('Target:  AM=%0.1f  Alt=%0.1f°  Moon dist=%0.1f°',
                 [TargetAM, TargetAlt/pi*180, SphereDist(TargetRA, TargetDec, MoonRA, MoonDec)/pi*180]);
     end else if (Tabs.ActivePage=TabRa) then begin
        CalcAltAz_HA(TargetHA, TargetDec, SiteNorthLat,  TargetAlt, TargetAz);
        CoordOKLabel.Caption := Format('Target:  AM=%0.1f  Alt=%0.1f°  ',
        [CalcAM(TargetAlt), TargetAlt/pi*180]);
    end;
  end;

//save in MoonAltEdit.Tag/MoonAltEdit.Tag the  Previous State of Alt

 if (MoonAlt*MoonAltEdit.Tag<=0) then begin
    if (MoonAlt<=0) then
       MoonColor := $00BAB1A0
    else
     //MoonColor := $00CBDADE;
       MoonColor := $00CBF8F7;
    MoonAltEdit.Tag    := Sign(MoonAlt);
    MoonRAEdit.Color   := MoonColor;
    MoonDecEdit.Color  := MoonColor;
    MoonAltEdit.Color  := MoonColor;
    MoonDistEdit.Color := MoonColor;
    MoonIllumEdit.Color:= MoonColor;
 end;


 if (SunAlt*SunAltEdit.Tag<=0) then begin
   if (SunAlt<=0) then
     SunColor := $00BAB1A0
   else
     //SunColor := $00CBDADE;
     SunColor := $00CBF8F7;

   SunAltEdit.Tag     := Sign(SunAlt);
   SunAltEdit.Color   := SunColor;
   SiteInfo.UpdateTwilights(Sender);
  end;

  if (not TelescopeMoving) then
     DomeTelescopeAz := CalcDomePos(ScopeHA, AzNow, AltNow)*57.2958;

  if (DomeTrackOn) then
     if ( (Abs(DomeTelescopeAz-DomeAzimuth)>DomeMinMv) and
           (not(DomeStatus in [DmMovingL, DmMovingR])) ) and
           (not TelescopeMoving) then
     ROForm.DomeSocket.Socket.SendText(format('%s%d',[DmMove, Round(DomeTelescopeAz*10) mod 3600]));

//Calculate AM for List Entries
  ListCalcAM(Sender);

// Check if  LaiwoGuiderSocket was disconnected by timeout and Connect
   if (INSTchoose.ItemIndex = 1) AND (not LaiwoGuiderConnected) AND (LaiwoGuiderSocketTag = 1) then begin
       logevent ('Re-Connecting Laiwo Guider');
       LaiwoGuiderConnectClick(Sender);
       end;

// Check if  LaiwoScienceSocket was disconnected by timeout and Connect
   if (INSTchoose.ItemIndex = 1) AND (not LaiwoScienceConnected) AND (LaiwoScienceSocketTag = 1) then begin
       logevent ('Re-Connecting Laiwo Science');
       LaiwoScienceConnectClick(Sender);
       end;
end;

//------------------------------------------------------------------------------
//procedure TROForm.Update_RATrackControls(Sender: TObject);
//------------------------------------------------------------------------------
//begin
(* RATrackBtn.Tag := RATrackStatus;
 with RATrackStatusLabel do
   case RATrackStatus of
    IO_RATrack_On: begin
        caption    := 'On';
        Font.Color := clWindowText;
    end;
    IO_RATrack_Off: begin
        caption    := 'Off';
        Font.Color := clRed;
    end;
    IO_RATrack_SettingOn: begin
        caption    := 'Setting ON';
        Font.Color := clNavy;
    end;
    IO_RATrack_SettingOff: begin
        caption    := 'Setting Off';
        Font.Color := clNavy;
    end;
    IO_RATrack_Undetermined: begin
        caption    := 'Unknown';
        Font.Color := $008000FF;
    end;
  end;
*)//end;

//------------------------------------------------------------------------------
procedure TROForm.btnClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
   if (Sender = DmTrackOnBtn) then begin
      if (DomeStatus <> DmStuck) then
          DomeTrackOn := TRUE
      else
          DmTrackOffBtn.Down := True;
      if RATrackON then
         SlitThAzLbl.Font.Color := clWindowText
      else
         SlitThAzLbl.Font.Color := clRed;
   end else if (Sender = DmTrackOffBtn) then begin
      DomeTrackOn := FALSE;
      if RATrackON then
         SlitThAzLbl.Font.Color := clRed
      else
         SlitThAzLbl.Font.Color := clWindowText;
   end else if (Sender = FlatLampBtn) then
      DomeFlatDlg.Show
   else if (Sender = SlitAzimuthBtn) OR (Sender = SetAzimuthMenu) then
      SlitAzDlg.Show
   else if (Sender = ShutterBtn) OR (Sender = SetSlitMenu) then begin
      if DomeSlitDlg.Visible=False then
         DomeSlitDlg.Show;
   end else if ( ((Sender = RATrackBtnOn) OR (Sender = SetRATrackMenu))
               AND (not RATrackON) ) then begin
      ScopeSock.SendText(ScopeSetRATrackOn);
      RATrackON := TRUE;
      LogEvent('->Telescope: Toggle RATrack (ON)');
      if AutoDomeTrack.Checked then begin
         DmTrackOnBtn.Down := True;
         DmTrackOnBtn.Click;
      end;
      if (DomeShutterPos >=100) then
         SlitStatusLabel.Font.Color := clWindowText
      else
         SlitStatusLabel.Font.Color := clRed;
      if DomeTrackOn then
         SlitThAzLbl.Font.Color := clWindowText
      else
         SlitThAzLbl.Font.Color := clRed;
   end else if ( (Sender = RATrackBtnOff) OR (Sender = SetRATrackMenu))
               AND (RATrackON) then begin
      ScopeSock.SendText(ScopeSetRATrackOff);
      RATrackON := FALSE;
      LogEvent('->Telescope: Toggle RATrack (OFF)');
      if AutoDomeTrack.Checked then begin
         DmTrackOffBtn.Down := True;
         DmTrackOffBtn.Click;
      end;
      if (DomeShutterPos <=0) then
         SlitStatusLabel.Font.Color := clWindowText
      else
         SlitStatusLabel.Font.Color := clRed;
      if DomeTrackOn then
         SlitThAzLbl.Font.Color := clRed
      else
         SlitThAzLbl.Font.Color := clWindowText;
   end;
end;

//------------------------------------------------------------------------------
function TROForm.GotoExec(Sender: TObject): Boolean;
//------------------------------------------------------------------------------
var
 TeleCmd      : string;
////////////////////////////////////////
 RA, Dec, dRA, dDec :extended;
 T, P, RH, TargetHA, Epoch, ref, C : extended;
 SRA, SDec : string;
////////////////////////////////////////
begin
  Result := FALSE;
  if (CoordOK) then
  if (TargetAM<=StrToFloatDef(CamAMLim.Text,DefaultAMLimit)) then
    begin
////////////////////////////////////////
  ValidateRA(RARA.Text, RA);
  ValidateDec(RADec.Text, Dec);
  ValidateEpoch(RAEpoch.Text, LimitEpoch, MinEpoch, MaxEpoch, Epoch);

//  Moved the follwoing two lines to here after a talke with Eran (SK 20090301)
  CalcPrecession(Epoch, EpochNow, RA, Dec,RA, Dec);
  CalcNutation(Epoch, RA, Dec, RA, Dec);
  CalcAbberation(JDNow,RA, Dec ,dRA, dDec);
  RA  := RA  + dRA;
  Dec := Dec + dDec;
  Epoch := Epochnow ;
// in Yiftach original program those lines were here:  (SK 20090301)
//     CalcPrecession(Epoch, EpochNow, RA, Dec,RA, Dec);
//     CalcNutation(Epoch, RA, Dec, RA, Dec);

  TargetHA := STNow*2*pi-RA;
  if TargetHA < -pi then
        TargetHA := TargetHA+2*pi;
  if TargetHA > pi then
        TargetHA := TargetHA-2*pi;
  if (Wise_Meteorology.TransCoord.Checked) then begin
     T  := StrToFloatDef(Wise_Meteorology.TemperatureE.Text, -MaxExtended);
     p  := StrToFloatDef(Wise_Meteorology.PressureE.Text, -MaxExtended);
     RH := StrToFloatDef(Wise_Meteorology.HumidityE.Text, -MaxExtended);
     if (T = -MaxExtended) then
        T := 293.15;
     if (P = -MaxExtended) then
        P := 920;
     if (RH = -MaxExtended) then
        RH := 50;
     T  := T+273.15;
     RH := RH/100;

     CalcRefraction(T,P,RH, pi/2-AltNow, STNow*2*pi-RA, Dec, SiteNorthLat, dRA, dDec, Ref, C);
     RA  := RA  - dRA;
     Dec := Dec - dDec;
  end;

     if RA < 0 then
        RA := RA+2*pi;
     if RA > 2*pi then
        RA := RA-2*pi;
     SRA  := TimeF2Str(RA/2/pi);
     SDec := CoordR2Str(Dec);
//Fight dirty wars with dirty weapons:
     SRA  := AnsiReplaceText(SRA, '59.9', '59.4');
     SDec := AnsiReplaceText(SDec, '59.9', '59.4');
     SRA  := AnsiReplaceText(SRA, '59.8', '59.4');
     SDec := AnsiReplaceText(SDec, '59.8', '59.4');
     SRA  := AnsiReplaceText(SRA, '59.7', '59.4');
     SDec := AnsiReplaceText(SDec, '59.7', '59.4');
     SRA  := AnsiReplaceText(SRA, '59.6', '59.4');
     SDec := AnsiReplaceText(SDec, '59.6', '59.4');
     SRA  := AnsiReplaceText(SRA, '59.5', '59.4');
     SDec := AnsiReplaceText(SDec, '59.5', '59.4');
   TeleCmd := Format('%s %s %s %s %s',[ScopeSetRA, SRA, SDec, Format('%0.2f',[Epoch]), RATarget.Text]);
//////////////////////////////////////////
//     TeleCmd := Format('%s %s %s %s %s',[ScopeSetRA, RARA.Text,
//                RADec.Text, RAEpoch.Text, RATarget.Text]);

     TargetDomeAz := CalcDomePos(TargetHA, TargetAz, TargetAlt)*57.2958;
     ScopeSock.SendText(TeleCmd);
     LogEvent('->Telescope: ' +TeleCmd);
     CoordOKLabel.Visible  := FALSE;
     if (DomeTrackOn) then
         DomeSock.SendText(Format('%s%d',[DmMove,10*Round(TargetDomeAz) mod 3600]));
     SlitThAzLbl.Caption := Format('%0.1f°',[TargetDomeAz]);
     Result := TRUE;
     end else begin
        LogEvent('Requested AM above limit. Telescope Move aborted.');
        SoundAlert(SndFailure);
     end;
end;
//------------------------------------------------------------------------------
procedure TROForm.GotoClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
 CameraControlsColor(clWindow);
//KEEP PART UNTIL WIN VER READY:
 if not RATrackBtnOn.Down then begin
    showmessage('Set RA Track first!');
    exit;
 end;
 if (AutoRunOn) then begin
// 20110331 added by SK
   AutoRunObject    := (ListPg.Pages[ListPg.ActivePageIndex].Controls[0] as TstringGrid).Row;
//
   if MessageDlg(Format('Run down list "%s", starting from object %d?',[ListPg.ActivePage.Caption,AutoRunObject]),
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then  begin
      LogEvent('Starting an auto Sequence');
      BtnGOTO.Enabled := FALSE;
      AutoRunList      := (ListPg.Pages[ListPg.ActivePageIndex].Controls[0] as TstringGrid);
      AutoRunObject    := (ListPg.Pages[ListPg.ActivePageIndex].Controls[0] as TstringGrid).Row;
      AutoRunList.Font.Color := ClRed;
      AutoCycle.Text :='1';        //Start an object
   end;
 end else
   GotoExec(Sender);
end;
//------------------------------------------------------------------------------
procedure TROForm.FilterWheelGo(Sender: TObject);
//------------------------------------------------------------------------------
var
  FWLocation : integer;
  cmd:     string;
begin
   CameraControlsColor(clWindow);
   with FilterWheel do
   begin
      if (ItemIndex = abs(Tag)-1) OR (Tag = 0) then
          exit;
      if (tag < 0) then //remote update
        LogEvent(Format('Filter Wheel moved (%s -> %s)',
           [Items[abs(Tag)-1], Items[ItemIndex]]))
      else begin
       LogEvent(Format('Change filter (%s -> %s)',
          [Items[Tag-1], Items[ItemIndex]]));
       FWLocation :=Tag-1;
       Tag :=0;

   Case INSTchoose.ItemIndex of
   0: begin  //PI Camera
          FilterSock.SendText(IntToStr(ItemIndex+1));
          ItemIndex := FWLocation;
      end;
   1: begin  //LAIWO Camera
          cmd := Format('%s %s'#10, ['filter', IntToStr(ItemIndex+1)]);
          LaiwoScienceSock.SendText(cmd);
      end;
   end;
   
//       ItemIndex := FWLocation;
       Tag := ItemIndex+1;
       Enabled := FALSE;
      end;
      Tag :=ItemIndex+1;
   end;
end;
//------------------------------------------------------------------------------
procedure TROForm.SelectFilterWheelPos(s:string);
//------------------------------------------------------------------------------
var i,j:integer;
begin
j:=-1;
for i:=0 to 7 do
if s= FilterWheel.Items[i] then
  j:=i;
if j>-1 then
  FilterWheel.ItemIndex:= j;
end;

//------------------------------------------------------------------------------
procedure TROForm.ExpCycle(Sender: TObject);
//------------------------------------------------------------------------------
//Exposure cycle automatum. States:
//Val   Source                  action
// 0    BtnObserve              init cycle
// 1    ObsCycl                 move to next filter
// 2    FW, ObsCycl          start exposure
// 3                            end exposure, inc image number
// 4                            end obs cycle
var
  FiltPos: Integer;
begin

//Check for 'Abort by user'
  if (BtnStopObserve.Tag = 1) then begin//Abort Recieved
    BtnStopObserve.Tag :=0;
    ObsCycle.Text := '4';
    exit;
  end;

 if (ObsCycle.Text<>'4') then begin
//Check for CamDisconnected, FWDisconnected
  Case INSTchoose.ItemIndex of
  0: begin  //PI Camera
   if (not PMISConnected) OR (not FilterPcConnected) then begin
      LogEvent('CCD/Filters PC not connected, aborting sequence.');
      ObsCycleStatus.Caption := 'CCD/Filters PC not connected, aborting squence';
      ObsCycleStatus.Font.Color := ClRed;
      ObsCycle.Text := '4';
      if AutoRunOn then
        AutoCycle.Text := '4';
      exit;
//Check for FW Stuck
   end else if (FWState = FWStuck) then begin
       if MessageDlg('Filter Wheel is stuck. Abort squence?', mtConfirmation,
          [mbYes, mbNo], 0) = mrYes then begin
             LogEvent('Filter wheel stuck, aborting squence');
             ObsCycleStatus.Caption := 'Filter wheel stuck, aborting squence';
             ObsCycleStatus.Font.Color := ClRed;
             ObsCycle.Text := '4';
             if AutoRunOn then
                AutoCycle.Text := '4';
             exit;
       end;
   end;
  end;
  1: begin  //LAIWO Camera
   if (not LaiwoScienceConnected) then begin
      LogEvent('Laiwo PC not connected, aborting sequence.');
      ObsCycleStatus.Caption := 'Laiwo PC not connected, aborting squence';
      ObsCycleStatus.Font.Color := ClRed;
      ObsCycle.Text := '4';
      if AutoRunOn then
        AutoCycle.Text := '4';
      exit;
      end;
   end;
   end;
 end;

 case StrToIntDef(ObsCycle.Text, IntStrError) of
  0: begin
//-----------------   Initialize an ObsSeq  -----------------------------------
    if FiltSeqOn then
       exit;

    LogEvent('Starting a filter Sequence');
    FiltSeqOn           := TRUE;
    FiltSeqLine         := 1;
    FiltSeqCycle        := 1;
    BtnObserve.Enabled  := FALSE;
    BImIaquire.Enabled  := FALSE;
    GraphicMove.Enabled := FALSE;
    BImBias.Enabled     := FALSE;
    BImArea.Enabled     := FALSE;
    BTmpImg.Enabled     := FALSE;
    BImFlatField.Enabled:= FALSE;
    FilterWheel.Enabled := FALSE;
    //TestFiltSeqEntries (?);
    ObsCycle.Text       :='1';        //Start an exposure
  end;
  1: begin
//-----------------   Execute filter for current object  ----------------------------------
    if (FiltSeqOn = FALSE) then
       exit;
//If AM too high terminate
  if (AMNow > StrToFloatDef(CamAMLim.Text,DefaultAMLimit)) then begin
    LogEvent('AM Limit reached. Obesrvation cycle terminated.');
    ObsCycleStatus.Caption := 'AM Limit reached, Stopping exposures';
    ObsCycleStatus.Font.Color := ClRed;
    ObsCycle.Text := '4';     //4=end obscycle
    exit;
  end;

//if finished then terminate obs cycle
    if (FiltSeqLine >=CamExp.RowCount) then begin
       FiltSeqLine :=1;
       inc(FiltSeqCycle);
    end;
    if (FiltSeqCycle >StrToIntDef(CamRepete.Text,IntStrError)) then begin
       ObsCycle.Text := '4';     //4=end obscycle
       ObsCycleStatus.Caption := 'Exposure sequence concluded';
       ObsCycleStatus.Font.Color := ClRed;
       exit;
    end;
    CamExp.Row := FiltSeqLine;
    CamExp.Col := 0;
    LogEvent('Cyc: '+inttostr(FiltSeqCycle)+' Obj: '+inttostr(FiltSeqLine) );
    FiltPos := FilterWheel.Items.IndexOf(CamExp.Cells[0,FiltSeqLine]);
    if FiltPos<0 then begin
       LogEvent('Reqiested filter not Found: '+CamExp.Cells[0,FiltSeqLine]);
       ObsCycle.Text := '3';
       exit;
    end;
    if FilterWheel.ItemIndex <> FiltPos then begin

       if (FWState = FWStuck) then begin
          LogEvent('Filter wheel stuck, aborting squence');
          ObsCycleStatus.Caption := 'Filter wheel stuck, aborting squence';
          ObsCycleStatus.Font.Color := ClRed;
          exit;
          ObsCycle.Text := '4';
          if AutoRunOn then
             AutoCycle.Text := '4';
       end;

       LogEvent(Format('Changing filter to %s',[FilterWheel.Items[FiltPos]]));
       ObsCycleStatus.Caption := Format('Change filter: "%s %s %s" (Exp. %s/%s, Cycle %s/%s)',
             [FiltSeqObjName, CamExp.Cells[0,FiltSeqLine],CamExp.Cells[1,FiltSeqLine],
             IntToStr(FiltSeqLine), IntTOStr(CamExp.RowCount-1),
             IntTOStr(FiltSeqCycle),CamRepete.Text]);
       ObsCycleStatus.Font.Color := clBackground;
       FilterWheel.ItemIndex := FiltPos;
    end else
       ObsCycle.Text := '2';
  end;
  2: begin
//-----------------   Start an exposure       ----------------------------------
    if (FiltSeqOn = FALSE) then
       exit;
    if FilterWheel.ItemIndex <> FilterWheel.Items.IndexOf(CamExp.Cells[0,FiltSeqLine]) then begin
       ObsCycle.Text := '1';
       exit;
    end;
    Texp:=StrToFloatDef(CamExp.Cells[1,FiltSeqLine],0);
    if Texp<=0 then begin
       LogEvent('Error: Illegal exposure time'+CamExp.Cells[1,FiltSeqLine]);
       ObsCycle.Text := '3';
    end else begin
       LogEvent(Format('Taking exposure %0.1f s',[Texp]));
       ObsCycleStatus.Caption := Format('Exposing: "%s %s %s" (Exp. %s/%s, Cycle %s/%s)',
              [FiltSeqObjName, CamExp.Cells[0,FiltSeqLine],CamExp.Cells[1,FiltSeqLine],
              IntToStr(FiltSeqLine), IntTOStr(CamExp.RowCount-1),
              IntTOStr(FiltSeqCycle),CamRepete.Text]);
       ObsCycleStatus.Font.Color := clBackground;
       ObsTimer.Tag := 0;
       TakeExposure(Sender);
   end;
  end;
  3: begin
//-----------------   Go to next Exposure     ----------------------------------
    if (FiltSeqOn = FALSE) then
       exit;
    inc(FiltSeqLine);
    ObsCycle.Text := '1';
  end;
  4: begin
//-----------------   Terminate cycle      ------------------------------------
    if (FiltSeqOn = FALSE) then
       exit;
    FiltSeqOn := FALSE;
    LogEvent('Filter Sequence terminated');
    BtnObserve.Enabled := ((PMISConnected  AND FilterPcConnected) or LaiwoScienceConnected) AND not AutoRunOn;
    BTmpImg.Enabled    := BtnObserve.Enabled;
    BImArea.Enabled    := (PMISConnected or LaiwoScienceConnected) AND not AutoRunOn;
    BImIaquire.Enabled := BImArea.Enabled;
    BImBias.Enabled    := BImArea.Enabled;
    BImFlatField.Enabled:= BImArea.Enabled;
    GraphicMove.Enabled := ScopePcConnected AND BImArea.Enabled;
    FilterWheel.Enabled := (FWState = FWIdle) AND not AutoRunOn;
//    ObsCycleStatus.Caption := '';
    SoundAlert(SndEndObsCycle);
    CameraControlsColor(clBtnFace);
{    if GuiderBtn.Tag = 1 then begin
        GuiderBtn.Click ;
        GuiderBtn.Tag := 1;
    end;
 }
    if (AutoRunOn) then
        AutoCycle.Text :='3';
  end;
 end;
end;

//------------------------------------------------------------------------------
procedure TROForm.TakeExposure(Sender: TObject);
//------------------------------------------------------------------------------
//Automatum states encoded in ObsTimer.Tag
// Owner        val     operation
//================================
//ObserveBtn    0       init, start obs
//PMISExposing  1       timer enable, Disable elements
//OnObsTImer    2       inc exposure counter,
//OnObsTImer    3       download state
//PmisIdle      4       exposure ended,
var
 cmd:     string;
begin
  case ObsTimer.Tag of
    0: begin

       Case INSTchoose.ItemIndex of
         0: begin  //PI Camera
              cmd := Format('%s %s %s %0.1f %s %d 1', [PMISExecLine, 'Rimtake',
                     FiltSeqObjName, Texp,
                     FilterWheel.Items[FilterWheel.ItemIndex],
                     FilterWheel.ItemIndex]);
              PMISSock.SendText(cmd);
            end;
         1: begin  //LAIWO Camera
              cmd := Format('%s %s %s'#10, ['camera', 'object', FiltSeqObjName]);
              LaiwoScienceSock.SendText(cmd);
              cmd := Format('%s %s %0.1f'#10, ['camera', 'expotime', Texp]);
              LaiwoScienceSock.SendText(cmd);
              cmd := Format('%s %s'#10, ['camera', 'expose']);
              LaiwoScienceSock.SendText(cmd);
              BtnObserve.Enabled  := FALSE;
              BImIaquire.Enabled  := FALSE;
              BImBias.Enabled     := FALSE;
              BImFlatField.Enabled := FALSE;
              BTmpImg.Enabled     := FALSE;
              BImArea.Enabled     := FALSE;
              FilterWheel.Enabled := FALSE;
              GraphicMove.Enabled := FALSE;
//             ObsTimer.Enabled := TRUE;
//              ObsTimer.Tag := 1;
              end;
       end;
       LogEvent('->CCD: ' +cmd);
       CCDExpLabel.Caption := '0';
       ExposurePrgrsBar.Position :=0;
       ExposurePrgrsBar.Max :=Ceil(Texp);
    end;
    1: begin
       CCDExpLabel.Caption := '0';
       ExposurePrgrsBar.Position :=0;
       ExposurePrgrsBar.Max :=Ceil(Texp);
       CCDStatusLabel.Caption := 'Exposing';
       CCDExpLabel.Visible := TRUE;
       ExposurePrgrsBar.Visible := TRUE;
       ObsTimer.Tag :=2;
       ObsTimer.Enabled := TRUE;
    end;
    2: begin
       if (ExposurePrgrsBar.Position >= ExposurePrgrsBar.Max) then
          ObsTimer.Tag :=3
       else begin
          ExposurePrgrsBar.Position := ExposurePrgrsBar.Position + 1;
          CCDExpLabel.Caption := IntToStr(ExposurePrgrsBar.Position);
       end;
    end;
    3: begin
       ObsTimer.Enabled := FALSE;
       CCDStatusLabel.Caption := 'Downloading...';
    end;
    4: begin
//       if not ObsTimer.Enabled then  //'CCD Idle' received unrelated to exposure.
//          exit;
       SoundAlert(SndEndExpose);
       ObsTimer.Enabled :=False;
       CCDExpLabel.Visible := False;
       ExposurePrgrsBar.Visible := False;
       CCDStatusLabel.Caption := 'Idle';
       ObsCycle.Text := '3';
       CCDExpLabel.Visible := False;
       ExposurePrgrsBar.Visible := False;
       ExposurePrgrsBar.Position :=0;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TROForm.AutoModeClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
//-----------------------------------ENTER AutoMode-----------------------------
 if (AutoRunOn = FALSE) AND (AutoMode.Checked) then begin
    if (OpenedListFiles.Count <1) then begin
      AutoMode.Checked := FALSE;
      exit;
   end;
    TelescopeBox.Caption := 'Telescope AUTO MODE';
    BtnGoTo.Caption      := 'START';
    BtnObserve.Enabled   :=FALSE;
    BImIaquire.Enabled   := FALSE;
    BImBias.Enabled      := FALSE;
    BTmpImg.Enabled      := FALSE;
    BImArea.Enabled      := FALSE;
    FilterWheel.Enabled  :=FALSE;
    BtnStopObserve.Enabled :=FALSE;
    BSkyFF.Enabled       := FALSE;
    GraphicMove.Enabled  := FALSE;
    AutoRunOn            := TRUE;
    UseGuider.Visible    := TRUE;
    UseGuider.Enabled    := TRUE;
//-----------------------------------EXIT AutoMode-----------------------------
 end else begin
    BtnGotoStop.Click ;
    TelescopeBox.Caption := 'Telescope';
    BtnGoTo.Caption        := 'GO TO';
    BtnGoTo.Enabled        := ScopePcConnected AND not  TelescopeMoving;
    BtnStopObserve.Enabled := (PMISConnected or LaiwoScienceConnected);
    BtnObserve.Enabled     := ((PMISConnected AND FilterPcConnected) or LaiwoScienceConnected) AND not FiltSeqOn ;
    BTmpImg.Enabled        := BtnObserve.Enabled;
    BImIaquire.Enabled     := (PMISConnected or LaiwoScienceConnected) AND not FiltSeqOn;
    BImBias.Enabled        := BImIaquire.Enabled;
    BImArea.Enabled        := BImIaquire.Enabled;
    BImFlatField.Enabled   := BImIaquire.Enabled;
    GraphicMove.Enabled    := ScopePcConnected AND BImIaquire.Enabled;
    FilterWheel.Enabled    := (FWState = FWIdle) AND FilterPcConnected AND not FiltSeqOn;
    BSkyFF.Enabled         := ScopePcConnected;
    AutoRunOn              := FALSE;
    UseGuider.Visible      := FALSE;
    UseGuider.Enabled      := FALSE;
 end;
end;

//------------------------------------------------------------------------------
procedure TROForm.FWDisconnectClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
   if FilterPcConnected then begin
      LogEvent('Closing Filter socket...');
      FilterSocket.Active :=FALSE;
   end;
end;

//------------------------------------------------------------------------------
procedure TROForm.FilterSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
begin
   LogEvent('Filter socket closed.');
   SoundAlert(SndSockDisconnect);
   FilterPcConnected    :=FALSE;
   FilterWheel.Enabled  := FALSE;
   FWReload.Enabled     := FALSE;
   FWConnect.Enabled    := TRUE;
   FWDisconnect.Enabled := FALSE;
   FWState              := FWOff;
   BtnObserve.Enabled   := FALSE;
   BImFlatField.Enabled := FALSE;
   BTmpImg.Enabled      := FALSE;
end;

//------------------------------------------------------------------------------
procedure TROForm.FilterSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
begin
   LogEvent('Filter socket activated');
   SoundAlert(SndSockConnect);
   FilterPcConnected    := TRUE;
   FilterSock           := FilterSocket.Socket;
   FWReload.Enabled     := TRUE;
   FWConnect.Enabled    := FALSE;
   FWDisconnect.Enabled := TRUE;
   FilterSock.SendText(FWGetFilterList);
   BtnObserve.Enabled     := PMISConnected AND not FiltSeqOn AND not AutoRunOn;
   BImFlatField.Enabled   := PMISConnected AND FilterPcConnected AND not AutoRunOn;
   BTmpImg.Enabled        := BtnObserve.Enabled
end;

//------------------------------------------------------------------------------
procedure TROForm.FilterSocketError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
//------------------------------------------------------------------------------
begin
   LogEvent('FW Socket Error: '+IntToStr(ErrorCode)+'. Closing socket...');
   ErrorCode :=0;
   AlertForm.AlertTxt.Caption := 'Filter Wheel Communication Error';
   AlertForm.Show;
   FWDisconnectClick(Sender);
end;

//------------------------------------------------------------------------------
procedure TROForm.FilterSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
//Possible Inputs:
//[S i j]  status: i-state, j-position
//i: 0-idle; 1-moving; 2-stuck
//
//[F i j k F1 F2 ...Fi]   Filters: i-# of filters, j-current position, k-FilterStatus Fk-name of filter(k)
//
var
  msg :string;
  msgStrings: TStrings;
  i :integer;
begin
  msg:=FilterSock.ReceiveText;
//  LogEvent('<-FW: '+msg);
  Socket.SendText(msgOK);
  msgStrings:= TStringList.Create;
  try
    ParseStr(msg,msgStrings,' ');
    case msg[1] of
      'F': begin
         FilterWheel.Items.Clear;
         For i:=0 to StrTOIntDef(msgStrings.Strings[1],0)-1 do
             FilterWheel.Items.Add(msgStrings.Strings[i+4]);
         FilterWheel.Tag := -abs(StrToIntDef(msgStrings.Strings[2],0));
         FilterWheel.ItemIndex := StrToIntDef(msgStrings.Strings[2],0)-1;
         FilterWheel.Tag := FilterWheel.ItemIndex+1;
         FWState := StrToIntDef(msgStrings.Strings[3],-1);
         FilterWheel.Caption := FWStateStr[FWState];
         if FWState in [ FWOff, FWStuck, FWEditMode] then
           begin
            FilterWheel.Font.Color := clRed;
            SoundAlert(SndFailure);
            AlertForm.AlertTxt.Caption := 'Filter Wheel: ' + FWStateStr[FWState];
            AlertForm.Show;
           end
         else
            FilterWheel.Font.Color := clWindowText;
         FilterWheel.Enabled := (FWState = FWIdle) AND not(AutoRunOn OR FiltSeqOn);
         case FWState of
           FWIdle: ObsCycle.Text :='2';
           FWMovingCW: ; //do something
           FWMovingCCW: ; //do something
           FWOff :;    //do something
           FWStuck: ; //do something
           FWEditMode: ; //do something
         end;
      end;
      'S': begin
         FilterWheel.Tag := -abs(FilterWheel.Tag);
         FilterWheel.ItemIndex := StrToIntDef(msgStrings.Strings[2],0)-1;
         FilterWheel.Tag := FilterWheel.ItemIndex+1;
         FWState := StrToIntDef(msgStrings.Strings[1],-1);
         FilterWheel.Enabled := (FWState = FWIdle) AND not(AutoRunOn OR FiltSeqOn);
        FilterWheel.Caption := FWStateStr[FWState];
         if FWState in [ FWOff, FWStuck, FWEditMode] then
          begin
            FilterWheel.Font.Color := clRed;
            SoundAlert(SndFailure);
            AlertForm.AlertTxt.Caption := 'Filter Wheel: ' + FWStateStr[FWState];
            AlertForm.Show;
          end
         else
            FilterWheel.Font.Color := clWindowText;
         case FWState of
           FWIdle: ObsCycle.Text :='2';
           FWMovingCW: ; //do something
           FWMovingCCW: ; //do something
           FWStuck: ; //do something
           FWEditMode: ; //do something
         end;
      end;
    end;
  finally
     msgStrings.Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.BtnObserveClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
   CameraControlsColor(clWindow);
   if not ValidateObjName(RaTarget.Text) then begin
      ObsCycleStatus.Caption := 'Object name bad or missing.';
      SoundAlert(SndFailure);
      ObsCycleStatus.Font.Color := ClRed;
      CameraControlsColor(clBtnFace);
      exit;
   end;

   FiltSeqObjName      := Trim(RaTarget.Text);
   ObsCycle.Text := '0';
end;

//------------------------------------------------------------------------------
procedure TROForm.AutoCycleChange(Sender: TObject);
//------------------------------------------------------------------------------
//Object cycle automatum. States:
//Val   Source                  action
// 0    BtnStart                init cycle
// 1    AutoCycl                Goto object, MV Dome
// 2    Goto                    start obscycle
// 3    obscycle                end obscycle, inc object number
// 4                            end auto cycle
const
 MaxDist = Pi/60/180;

begin
 if (AutoRunOn = FALSE) then
   exit;
{
 if (BtnGotoStop.Tag = 1) then begin
   BtnGotoStop.Tag := 0;
   Autocycle.Text := '4';
   exit;
 end;
}
 case StrToIntDef(Autocycle.Text, IntStrError) of
//  0: begin
//-----------------   Initialize an ObsSeq  ------------------------------------
//  end;


  1: begin
//-----------------   GoTo current object  -------------------------------------
//if finished then terminate obs cycle
    if (AutoRunObject >=AutoRunList.RowCount) then begin
//       AutoCycle.Text := '4';
//       exit;
         AutoRunObject := 1;
    end;
    AutoRunList.Row := AutoRunObject;
    ObjListUpdateEntries(AutoRunList);
    ValidateRADataInput(Sender);
    LogEvent(Format('Moving to: %s',[AutoRunList.Cells[1,AutoRunList.Row]]));
       if (GotoExec(Sender)=FALSE) then  begin
         AutoCycle.Text := '4';
         exit;
       end;
  end;

  5: begin
//----------------   Start guiding  --------------------------------------------
   if (UseGuider.Checked) then begin
     if (DomeStatus = DmIdle) AND (GotoStatus = ScopeIdle) then begin
         LogEvent ('Starting the Guider') ;
         GuiderBtnClick(Sender);
     end;
    end;
   AutoCycle.Text := '2';
  end;

  2: begin
//-----------------   Start an exposure       ----------------------------------
     if (DomeStatus = DmIdle) AND (GotoStatus = ScopeIdle) then
          BtnObserveClick(Sender);
  end;

  3: begin
//-------------------  Stop Guiding    -----------------------------------------
   if (UseGuider.Checked) then begin
     LogEvent ('Stoping the Guider') ;
     GuiderBtnClick(Sender);
   end;
   AutoCycle.Text := '6';
  end;

  6: begin
//-----------------   Go to next object     ------------------------------------
    inc(AutoRunObject);
    LogEvent('Going to Object #'+IntToStr(AutoRunObject));
    AutoCycle.Text := '1';
  end;
  4: begin
//-----------------   Terminate cycle      ------------------------------------
//    BtnGotoStop.Tag        :=0;
    LogEvent('Auto Sequence terminated');
    AutoMode.Checked :=FALSE;
    AutoRunList.Font.Color := clWindowText;
  end;
 end;
end;

//------------------------------------------------------------------------------
procedure TROForm.BtnGotoStopClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
// Stop telescope by sending ScopeSetStop = '6'
    ScopeSock.SendText(ScopeSetStop);

// Stop an AutoRun sequence if exist    
    if AutoRunOn and (AutoCycle.Text <> '4') then
    begin
      BtnStopObserveClick(Sender);
      AutoCycle.Text := '4' ;
//      BtnGotoStop.Tag :=1;
      LogEvent('Auto Cycle aborted');
      if FiltSeqOn then begin
         BtnStopObserve.Tag :=1;
//         GuiderBtn.Tag :=1;
         BtnStopObserve.Enabled := True ;
      end;
      if not FiltSeqOn then begin
         BtnStopObserve.Enabled := True ;
         BtnObserve.Enabled := True ;
      end;
    end;
end;

//------------------------------------------------------------------------------
procedure TROForm.FWReloadClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
        FilterSock.SendText(FWGetFilterList);
end;

//------------------------------------------------------------------------------
procedure TROForm.InitDome(Sender: TObject);
//------------------------------------------------------------------------------
begin
  if not DomePcConnected then
  with  DomeSocket do begin
     Address :=DomePcIP;
     Port :=DomePcPort;
     Active :=TRUE;
     LogEvent('Opening Dome socket '+Address+':'+IntToStr(Port)+'...');
  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.DomeDisconnectClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
  if  DomePcConnected then
  begin
   LogEvent('Closing Dome socket...');
   DomeSocket.Active :=FALSE;
  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.DomeSocketError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
//------------------------------------------------------------------------------
begin
   LogEvent('Dome Socket Error: '+IntToStr(ErrorCode)+'. Closing socket...');
   ErrorCode :=0;
   AlertForm.AlertTxt.Caption := 'Dome Communication Error';
   AlertForm.Show;
   DomeDisconnectClick(Sender);
end;

//------------------------------------------------------------------------------
procedure TROForm.DomeSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
begin
      LogEvent('Dome socket activated');
      SoundAlert(SndSockConnect);
      DomePcConnected := TRUE;
      DomeSock := DomeSocket.Socket;
      ShutterBtn.Enabled     := TRUE;
      SlitAzimuthBtn.Enabled := TRUE;
      DmTrackOnBtn.Enabled   := TRUE;
      DmTrackOffBtn.Enabled  := TRUE;
      SetSlitMenu.Enabled    := TRUE;
      SetAzimuthMenu.Enabled := TRUE;
      SetDOmeTrackOn.Enabled := TRUE;
      SlitStatusLabel.Enabled := TRUE;
      SlitAzLabel.Enabled    := TRUE;
      SlitThAzLbl.Enabled    := TRUE;
      DomeConnect.Enabled    := FALSE;
      DomeDisconnect.Enabled := TRUE;
//      DomeMicMnu.Enabled     := TRUE;
      DomeSock.SendText(DmSendState);
end;

//------------------------------------------------------------------------------
procedure TROForm.DomeSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
begin
      LogEvent('Filter socket closed.');
      SoundAlert(SndSockDisconnect);
      DomePcConnected        :=FALSE;
      ShutterBtn.Enabled     := FALSE;
      SlitAzimuthBtn.Enabled := FALSE;
      DmTrackOnBtn.Enabled   := FALSE;
      DmTrackOffBtn.Enabled  := FALSE;
      SetSlitMenu.Enabled    := FALSE;
      SetAzimuthMenu.Enabled := FALSE;
      SlitStatusLabel.Enabled := FALSE;
      SlitAzLabel.Enabled    := FALSE;
      SlitThAzLbl.Enabled    := FALSE;
      SetDOmeTrackOn.Enabled := FALSE;
      DomeConnect.Enabled    := TRUE;
//      DomeMicMnu.Enabled     := FALSE;
      DomeDisconnect.Enabled := FALSE;
end;

//------------------------------------------------------------------------------
procedure TROForm.DomeSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
//Possible Inputs:
//[xyn1 n2]  status: i-dome state j-shutter state,
//                     k-shutter position [0..100]  l-dome position [0..359]
var
  msg :string;
  msgStrings: TStrings;
begin
  msg:=DomeSock.ReceiveText;
//  LogEvent('<-Dome: '+msg);
  Socket.SendText(msgOK);
  msgStrings:= TStringList.Create;
  try
    ParseStr(msg,msgStrings,' ');
    case msg[1] of
      'S': begin
         DomeSlitStatus := msg[2];
         DomeStatus     := msg[3];
         DomeShutterPos := 0.1 * StrToIntDef(RightStr(msgStrings.Strings[0],Length(msgStrings.Strings[0])-3),IntStrError);
         DomeAzimuth    := 0.1 * StrToIntDef(msgStrings.Strings[1],IntStrError);
      end;
    end;
  finally
     msgStrings.Free;
  end;

//BEGIN Handle DMStck
  if (DomeStatus in [DmProblem, DmStuck]) then begin
     DomeStatus := DmStuck;
     if (SlitAzLabel.Caption[1] <> '!') then begin //new stuck
        SoundAlert(SndFailure);
        SlitAzDlg.GoAzBtn.Enabled := FALSE;
        if DomeTrackOn then begin
           DmTrackOffBtn.Down := True;
           DmTrackOffBtn.Click;
        end;
     end;
  end else if (SlitAzLabel.Caption[1] = '!') then begin //was stuck, now not
     SlitAzDlg.GoAzBtn.Enabled := TRUE;
     if (AutoDomeTrack.Checked AND RATrackOn ) then begin
        DmTrackOnBtn.Down := True;
        DmTrackOnBtn.Click;
     end;
  end;
//END Handle DMStck

   with SlitAzLabel do begin
      case DomeStatus of
        DmIdle   : begin
          caption := Format('%0.1f°',[DomeAzimuth]);
          Font.Color := clWindowText;
          if (AutoCycle.Text = '1') AND (GotoStatus = ScopeIdle) then
             AutoCycle.Text := '5';
        end;
        DmStuck   : begin
          caption := Format('!!%0.1f°',[DomeAzimuth]);
          Font.Color := clRed;
        end;
        DmMovingL : begin
          caption := Format('-%0.1f°',[DomeAzimuth]);
          Font.Color := clNavy;
        end;
        DmMovingR : begin
          caption := Format('+%0.1f°',[DomeAzimuth]);
          Font.Color := clNavy;
        end;
        else begin
          caption := Format('??%0.1f°',[DomeAzimuth]);
          Font.Color := clRed;
        end;
      end;
      SlitAz.SlitAzDlg.CurDomeAzLbl.Caption := caption;
      SlitAz.SlitAzDlg.CurDomeAzLbl.Font.Color := Font.Color;
  end;

  with SlitStatusLabel do begin
      case DomeSlitStatus of
        DmShIdle: begin
          caption :='';
          if ( ((DomeShutterPos >=100) AND RATrackOn) OR
               ((DomeShutterPos <=0) AND (not RATrackOn)) ) then
             Font.Color := clWindowText
          else
             Font.Color := clRed;
        end;
        DmShOpening:  begin
          caption :='+';
          Font.Color := clNavy;
          DomeSlit.DomeSlitDlg.StatusMsg.Caption :='Opening';
        end;
        DmShClosing:  begin
          caption :='-';
          Font.Color := clNavy;
          DomeSlit.DomeSlitDlg.StatusMsg.Caption :='Closing';
        end;
        else begin
          caption :='??';
          Font.Color := $008000FF;
          DomeSlit.DomeSlitDlg.StatusMsg.Caption :='Idle';
        end;
      end;

     if DomeShutterPos >= 100.0 then begin
        caption :=caption + 'Opened';
     end else if DomeShutterPos <= 0.0 then begin
        caption :=caption + 'Closed';
     end else
     caption :=caption + IntToStr(Round(DomeShutterPos))+ '%';

     DomeSlit.DomeSlitDlg.StatusMsg.Caption :=caption;
  end;

    DomeSlit.DomeSlitDlg.ShutterProgressBar.Position := Round(DomeShutterPos);
end;

//------------------------------------------------------------------------------
procedure TROForm.ScopeSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
begin
      LogEvent('Setting socket activated');
      SoundAlert(SndSockConnect);
      ScopePcConnected        := TRUE;
      ScopeSock               := ScopeSocket.Socket;
      BSkyFF.Enabled          := TRUE;
      GraphicMove.Enabled     := BImIaquire.Enabled;
      BtnGoto.Enabled         := TRUE;
      BtnGotoStop.Enabled     := TRUE;
      ScopeConnect.Enabled    := FALSE;
      ScopeDisconnect.Enabled := TRUE;
      SetRATrackMenu.Enabled  := TRUE;
      RATrackBtnOn.Enabled    := TRUE;
      RATrackBtnOff.Enabled   := TRUE;
      ScopeSock.SendText(ScopeGetCoord);
      if (OpenedListFiles.Count >=1) then
      AutoMode.Enabled        := TRUE;
end;

//------------------------------------------------------------------------------
procedure TROForm.ScopeSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
begin
      LogEvent('Setting socket closed.');
      SoundAlert(SndSockDisconnect);
      ScopePcConnected        := FALSE;
      BtnGoto.Enabled         := FALSE;
      BSkyFF.Enabled          := FALSE;
      GraphicMove.Enabled     := FALSE;
      BtnGotoStop.Enabled     := FALSE;
      AutoMode.Enabled        := FALSE;
      ScopeConnect.Enabled    := TRUE;
      ScopeDisconnect.Enabled := FALSE;
      SetRATrackMenu.Enabled  := FALSE;
      RATrackBtnOn.Enabled    := FALSE;
      RATrackBtnOff.Enabled   := FALSE;
      ScopeRA                 := IntStrError;
      ScopeDec                := IntStrError;
      if (DomeTrackOn) then begin
         DmTrackOffBtn.Down := True;
         DmTrackOffBtn.Click;
      end;

end;

//------------------------------------------------------------------------------
procedure TROForm.ScopeSocketError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
//------------------------------------------------------------------------------
begin
   LogEvent('Setting Socket Error: '+IntToStr(ErrorCode)+'. Closing socket...');
   ErrorCode :=0;
   AlertForm.AlertTxt.Caption := 'Setting Communication Error';
   AlertForm.Show;
   ScopeDisconnectClick(Sender);
end;

//------------------------------------------------------------------------------
procedure TROForm.ScopeDisconnectClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
  if ScopePcConnected then
  begin
   LogEvent('Closing Setting socket...');
   ScopeSocket.Active :=FALSE;
  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.ScopeConnectClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
  if not ScopePcConnected then
  with  ScopeSocket do begin
     Address :=ScopePcIP;
     Port :=ScopePcPort;
     Active :=TRUE;
     LogEvent('Opening Scope socket '+Address+':'+IntToStr(Port)+'...');
  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.ScopeSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
//Possible Inputs:
//[C ra dec ha]  ra, dec, ha in radians
//[S [ScopeIdle|ScopeMoving|ScopeFSError]]
var
  msg :string;
  msgStrings: TStrings;
begin
  msg:=ScopeSock.ReceiveText;
  Socket.SendText(msgOK);
//  if msg[1] <> 'C' then
//    LogEvent('<-Telescope: '+msg);
  msgStrings:= TStringList.Create;
  try
    ParseStr(msg,msgStrings,' ');
    case msg[1] of
      'S': begin
             ScopeRA := StrToFloat(msgStrings.Strings[2]);
             ScopeDec := StrToFloat(msgStrings.Strings[3]);
             ScopeHA := StrToFloat(msgStrings.Strings[4]);
             case msgStrings.Strings[1][1] of
               ScopeIdle: begin
                 GoToStatus :=  ScopeIdle ;
                 TelescopeMoving := FALSE;
                 BtnGoTo.Enabled := (NOT AutoRunOn) OR (AutoRunOn AND (AutoCycle.Text='4'));
                 if (AutoCycle.Text = '1') AND (DomeStatus = DmIdle) then
                   begin
                   AutoCycle.Text := '5';
                   end;
                 if (GoTOTimer.Tag > -1) then
                    GoTOTimer.Tag :=3;
               end;
               ScopeFSError:   begin
                GoToStatus :=  ScopeFSError ;
                 ShowMessage('Setting: Error in Communication with Telescope Agent');
                 if AutoCycle.Text = '1' then
                   AutoCycle.Text := '4';
               end;
               ScopeMoving:  begin
                 GoToStatus :=  ScopeMoving ;
                 TelescopeMoving := TRUE;
                 BtnGOTO.Enabled :=False;
                 if (GoTOTimer.Tag = -1) then
                 begin
                    GoTOTimer.Tag :=1;
                    GoTOTimerTimer(Sender);
                 end;
               end;
             end;
           end;
      else
       LogEvent('<-Telescope: '+msg);
    end;
  finally
     msgStrings.Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.Exit1Click(Sender: TObject);
//------------------------------------------------------------------------------
begin
   Application.Terminate;
end;

//------------------------------------------------------------------------------
procedure TROForm.CCDTempConnectClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
// Through the CCD Socket (PI) - DP 20081220
//  if not CCDTempConnected then
//  with  CCDTempSocket do begin
//     Address :=CCDTempIP;
//     Port :=CCDTempPort;
//     Active :=TRUE;
//     LogEvent('Opening Scope socket '+Address+':'+IntToStr(Port)+'...');
//  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.CCDTempDisconnectClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
// Through the CCD Socket (PI) - DP 20081220
//  if CCDTempConnected then
//  begin
//   LogEvent('Closing Setting socket...');
//   CCDTempSocket.Active :=FALSE;
//  end;

end;

//------------------------------------------------------------------------------
procedure TROForm.CCDTempSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
begin
// Through the CCD Socket (PI) - DP 20081220
      LogEvent('CCD Temerature socket activated');
      SoundAlert(SndSockConnect);
      CCDTempConnected := TRUE;
      CCDTempSock := CCDTempSocket.Socket;
      CCDTempLabel.Enabled := TRUE;
      CCDTempLabel.Caption :='';
      CCDTempLbl.Enabled   := TRUE;
//      CCDTempConnect.Enabled    := FALSE;
//      CCDTempDisconnect.Enabled := TRUE;
      CCDTempReadTemperature.Enabled := TRUE;
      CCDTempSock.SendText(CCDTempGetState);
end;

//------------------------------------------------------------------------------
procedure TROForm.CCDTempSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
begin
// Through the CCD Socket (PI) - DP 20081220
      LogEvent('CCD Temerature socket closed.');
      SoundAlert(SndSockDisconnect);
      CCDTempConnected := FALSE;
      CCDTempLabel.Enabled := FALSE;
      CCDTempLabel.Caption :='';
      CCDTempLbl.Enabled   := FALSE;
//      CCDTempConnect.Enabled    := TRUE;
//      CCDTempDisconnect.Enabled := FALSE;
      CCDTempReadTemperature.Enabled := FALSE;
end;

//------------------------------------------------------------------------------
procedure TROForm.CCDTempSocketError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
//------------------------------------------------------------------------------
begin
// Through the CCD Socket (PI) - DP 20081220
   LogEvent('CCD Temerature Socket Error: '+IntToStr(ErrorCode)+'. Closing socket...');
   ErrorCode :=0;
   AlertForm.AlertTxt.Caption := 'CCD Temperature Communication Error';
   AlertForm.Show;
   CCDTempDisconnectClick(Sender);
end;

//------------------------------------------------------------------------------
procedure TROForm.CCDTempSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
//Possible Inputs:
//#     [CCDTempOK| | CCDTempHOT | CCDTempResetMode |CCDTempDontCare]
var
  msgText :string;
begin
// Through the CCD Socket (PI) - DP 20081220

  msgText:=CCDTempSock.ReceiveText;
  Socket.SendText(msgOK);
  case StrTOIntDef(msgText, IntStrError) of
    CCDTempOK: begin
         CCDTempLabel.Caption    := 'OK';
         CCDTempLabel.Font.Color := clWindowText;
         CCDTempLabel.Font.Style := [];
    end;
    CCDTempHOT,CCDTempResetMode,CCDTempDontCare : begin
         CCDTempLabel.Caption    := 'FILL!!';
         CCDTempLabel.Font.Color := clRed;
         CCDTempLabel.Font.Style := [fsBold];
         SoundAlert(SndFailure);
         AlertForm.AlertTxt.Caption := 'CCD Temperature Too High!';
         AlertForm.Show;
    end;
  else
        LogEvent('<-CCDTemp unknown: '+msgText);
  end;
end;


//------------------------------------------------------------------------------
procedure TROForm.LaiwoScienceConnectClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
  if not LaiwoScienceConnected then
  with  LaiwoScienceSocket do begin
     Address :=LaiwoScienceIP;
     Port :=LaiwoSciencePort;
     Active :=TRUE;
     LogEvent('Opening Laiwo Science socket '+Address+':'+IntToStr(Port)+'...');
  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.LaiwoScienceDisconnectClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
  if  LaiwoScienceConnected then
  begin
   LogEvent('Closing Laiwo Science socket...');
   LaiwoScienceSocketTag := 0;
   LaiwoScienceSocket.Active :=FALSE;
  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.LaiwoScienceSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
// var
// cmd:     string;
begin
      LogEvent('Laiwo Science socket activated');
      SoundAlert(SndSockConnect);
      LaiwoScienceConnected          := TRUE;
      LaiwoScienceSock               := LaiwoScienceSocket.Socket;
      LaiwoScienceConnect.Enabled    := FALSE;
      LaiwoScienceDisconnect.Enabled := TRUE;
      BtnObserve.Enabled     := not FiltSeqOn AND not AutoRunOn;
      BImFlatField.Enabled   := BtnObserve.Enabled;
      BTmpImg.Enabled        := BtnObserve.Enabled;
      BImIaquire.Enabled     := not FiltSeqOn AND not AutoRunOn;
      BImBias.Enabled        := BImIaquire.Enabled;
      BImArea.Enabled        := BImIaquire.Enabled;
      GraphicMove.Enabled    := ScopePcConnected AND BImIaquire.Enabled;
      BtnSTOPObserve.Enabled :=  not AutoRunOn;
      CCDSttusLbl.Enabled    := TRUE;
      CCDStatusLabel.Enabled := TRUE;
      if (LaiwoScienceSocketTag <> 1) then
      LaiwoFiltersSetup.show;
      if (LaiwoScienceSocketTag = 1) then
      FilterWheel.Enabled := True;
      LaiwoScienceSocketTag := 1;
end;

//------------------------------------------------------------------------------
procedure TROForm.LaiwoScienceSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
begin
      LogEvent('Laiwo Science socket closed.');
      SoundAlert(SndSockDisconnect);
      LaiwoScienceConnected := FALSE;
      LaiwoScienceConnect.Enabled    := TRUE;
      LaiwoScienceDisconnect.Enabled := FALSE;
      BtnObserve.Enabled     := FALSE;
      BImFlatField.Enabled   := FALSE;
      BImIaquire.Enabled     := FALSE;
      BImBias.Enabled        := FALSE;
      BTmpImg.Enabled        := FALSE;
      BImArea.Enabled        := FALSE;
      BtnSTOPObserve.Enabled := FALSE;
      CCDSttusLbl.Enabled    := FALSE;
      CCDStatusLabel.Enabled := FALSE;
      FilterWheel.Enabled  := FALSE;
end;

//------------------------------------------------------------------------------
procedure TROForm.LaiwoScienceSocketError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
//------------------------------------------------------------------------------
begin
   LogEvent('Laiwo Science Socket Error: '+IntToStr(ErrorCode)+'. Closing socket...');
   ErrorCode :=0;
   AlertForm.AlertTxt.Caption := 'Laiwo Science Communication Error';
   AlertForm.Show;
   LaiwoScienceDisconnectClick(Sender);
end;

//------------------------------------------------------------------------------
procedure TROForm.LaiwoScienceSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------

var
  msg :string;
  msgStrings: TStrings;
begin
  msg:=LaiwoScienceSock.ReceiveText;
  msgStrings:= TStringList.Create;
  ParseStr(msg,msgStrings,' ');
//  LogEvent(msg);

  if (msgStrings.Strings[0] <> 'done') then begin

    if (msgStrings.Strings[0] = 'filter') and (msgStrings.Strings[1] = 'IDLE') then
    begin
          FilterWheel.Tag := FilterWheel.ItemIndex+1;
          FilterWheel.Enabled := TRUE;
          ObsCycle.Text :='2';
    end;


    if (msgStrings.Strings[0] = 'camera') and (msgStrings.Strings[1] = 'EXPOSE') and (not ObsTimer.Enabled) then
    begin
       ObsTimer.Tag := 1;
       TakeExposure(Sender);
   end;

//  if (msgStrings.Strings[0] = 'camera') and ((msgStrings.Strings[1] = 'IDLE') or (msgStrings.Strings[1] = 'DONE')) then


    if ((msgStrings.Strings[0] = 'camera') and (msgStrings.Strings[1] = 'DONE')) or ((msgStrings.Strings[0] = 'camera') and (msgStrings.Strings[1] = 'IDLE') and (LaiwoLastString <> 'DONE')) then
    begin
//         FilterWheel.Tag := FilterWheel.ItemIndex+1;
          PMISStatus := PMISIdle;
          ObsTimer.Enabled := FALSE;
          ObsTimer.Tag := 4;
          TakeExposure(Sender);
//          BtnObserve.Enabled  := TRUE;
          BtnObserve.Enabled  := not FiltSeqOn AND not AutoRunOn;
          BImIaquire.Enabled  := BtnObserve.Enabled;
          BImBias.Enabled     := BtnObserve.Enabled;
          BImFlatField.Enabled := BtnObserve.Enabled;
          BTmpImg.Enabled     := BtnObserve.Enabled;
          BImArea.Enabled     := BtnObserve.Enabled;
          FilterWheel.Enabled := BtnObserve.Enabled;
          GraphicMove.Enabled := BtnObserve.Enabled;
    end;
  LaiwoLastString := msgStrings.Strings[1] ;
  end;
  msgStrings.Free;
end;

//------------------------------------------------------------------------------
procedure TROForm.LaiwoGuiderConnectClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
  if not LaiwoGuiderConnected then
  with  LaiwoGuiderSocket do begin
     Address :=LaiwoGuiderIP;
     Port :=LaiwoGuiderPort;
     Active :=TRUE;
     LogEvent('Opening Laiwo Guider socket '+Address+':'+IntToStr(Port)+'...');
  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.LaiwoGuiderDisconnectClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
  if  LaiwoGuiderConnected then
  begin
   LogEvent('Closing Laiwo Guider socket...');
   LaiwoGuiderSocketTag := 0;
   LaiwoGuiderSocket.Active :=FALSE;
  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.LaiwoGuiderSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
begin
      LogEvent('Laiwo Guider socket activated');
      SoundAlert(SndSockConnect);
      LaiwoGuiderConnected          := TRUE;
      LaiwoGuiderSocketTag := 1;
      LaiwoGuiderSock               := LaiwoGuiderSocket.Socket;
      LaiwoGuiderConnect.Enabled    := FALSE;
      LaiwoGuiderDisconnect.Enabled := TRUE;
      GuiderBtn.Enabled      := TRUE;
      GuiderStatusLabel.Enabled := TRUE;

end;

//------------------------------------------------------------------------------
procedure TROForm.LaiwoGuiderSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
begin
      LogEvent('Laiwo Guider socket closed.');
      SoundAlert(SndSockDisconnect);
      LaiwoGuiderConnected := FALSE;
      LaiwoGuiderConnect.Enabled    := TRUE;
      LaiwoGuiderDisconnect.Enabled := FALSE;
      GuiderBtn.Enabled      := FALSE;
      GuiderStatusLabel.Enabled := FALSE;
end;

//------------------------------------------------------------------------------
procedure TROForm.LaiwoGuiderSocketError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
//------------------------------------------------------------------------------
begin
   LogEvent('Laiwo Guider Socket Error: '+IntToStr(ErrorCode)+'. Closing socket...');
   ErrorCode :=0;
   AlertForm.AlertTxt.Caption := 'Laiwo Guider Communication Error';
   AlertForm.Show;
   LaiwoGuiderDisconnectClick(Sender);
end;

//------------------------------------------------------------------------------
procedure TROForm.LaiwoGuiderSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
// When gets that the guider is working then continue with observation if in AutoRunOn
// When gets 'done' act according to whom that sent the command
// which is in the parameter LaiwoGuiderSent:
// -1   no command
//  1   StartGuiding
//  2   StopGuiding

var
  msg :string;
  msgStrings: TStrings;
begin

  msg:=LaiwoGuiderSock.ReceiveText;
  msgStrings:= TStringList.Create;
  ParseStr(msg,msgStrings,' ');
//  logevent(msg);

  {  if (msgStrings.Strings[0] <> 'done') then begin
      if (AutoCycle.Text = '5') AND (AutoRunOn) AND (LaiwoGuiderSent = 1) AND (msgStrings.Strings[1] = 'DONE') then  begin
        LaiwoGuiderSent := -1 ;
        AutoCycle.Text :='2';
      end;
  end;
  if (msgStrings.Strings[0] = 'done') then begin
      if (AutoCycle.Text = '3') AND (AutoRunOn) AND (LaiwoGuiderSent = 2) then  begin
        LaiwoGuiderSent := -1 ;
        AutoCycle.Text := '6';
      end;
  end;
}
  msgStrings.Free;
end;





//------------------------------------------------------------------------------
procedure TROForm.PMISConnectClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
  if not PMISConnected then
  with  PMISSocket do begin
     Address :=PMISIP;
     Port :=PMISPort;
     Active :=TRUE;
     LogEvent('Opening PMIS socket '+Address+':'+IntToStr(Port)+'...');
  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.PMISDisconnectClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
  if  PMISConnected then
  begin
   LogEvent('Closing PMIS socket...');
   PMISSocket.Active :=FALSE;
  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.PMISSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
begin
      LogEvent('PMIS socket activated');
      SoundAlert(SndSockConnect);
      PMISConnected          := TRUE;
      PMISSock               := PMISSocket.Socket;
      CCDTempLbl.Enabled     := TRUE;
      CCDTempLabel.Enabled   := TRUE;
      CCDTempLabel.Caption   :='';
      PMISConnect.Enabled    := FALSE;
      PMISDisconnect.Enabled := TRUE;
      BtnObserve.Enabled     := FilterPcConnected AND not FiltSeqOn AND not AutoRunOn;
      BImFlatField.Enabled   := BtnObserve.Enabled;
      BTmpImg.Enabled        := BtnObserve.Enabled;
      BImIaquire.Enabled     := not FiltSeqOn AND not AutoRunOn;
      BImBias.Enabled        := BImIaquire.Enabled;
      BImArea.Enabled        := BImIaquire.Enabled;
      GuiderBtn.Enabled      := TRUE;
      GuiderStatusLabel.Enabled := TRUE;
      GraphicMove.Enabled    := ScopePcConnected AND BImIaquire.Enabled;
      BtnSTOPObserve.Enabled :=  not AutoRunOn;
      CCDSttusLbl.Enabled    := TRUE;
      CCDStatusLabel.Enabled := TRUE;
      PMISSock.SendText(PMISSendState);
      LogEvent('->CCD: ' +PMISSendState);
end;

//------------------------------------------------------------------------------
procedure TROForm.PMISSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
begin
      LogEvent('PMIS socket closed.');
      SoundAlert(SndSockDisconnect);
      PMISConnected := FALSE;
      CCDTempLbl.Enabled     := FALSE;
      CCDTempLabel.Enabled   := FALSE;
      CCDTempLabel.Caption   :='';
      PMISConnect.Enabled    := TRUE;
      PMISDisconnect.Enabled := FALSE;
      BtnObserve.Enabled     := FALSE;
      BImFlatField.Enabled   := FALSE;
      BImIaquire.Enabled     := FALSE;
      BImBias.Enabled        := FALSE;
      BTmpImg.Enabled        := FALSE;
      BImArea.Enabled        := FALSE;
      GuiderBtn.Enabled      := FALSE;
      GuiderStatusLabel.Enabled := FALSE;
      GraphicMove.Enabled    := FALSE;
      BtnSTOPObserve.Enabled := FALSE;
      CCDSttusLbl.Enabled    := FALSE;
      CCDStatusLabel.Enabled := FALSE;
end;

//------------------------------------------------------------------------------
procedure TROForm.PMISSocketError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
//------------------------------------------------------------------------------
begin
   LogEvent('PMIS Socket Error: '+IntToStr(ErrorCode)+'. Closing socket...');
   ErrorCode :=0;
   AlertForm.AlertTxt.Caption := 'PI CCD Communication Error';
   AlertForm.Show;
   PMISDisconnectClick(Sender);
end;

//------------------------------------------------------------------------------
procedure TROForm.PMISSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
//Possible Inputs:
//#         [PMISIdle | PMISExposing]
//[a|b|c]   bias sec [start|ongoing|done]
//d         Idareab done
//D         [bias|imtake] Disk Space low
//[e|f]     Imtake [started|done]
//[g|h]     Iaquire [started|done]
//[m|n]     Moveit On|off
//[i|j|k|l] Guider [Tracking|Stopped|Failed|Fade]
//[s]       ImageStatistics
//[o|p]     Temperature [ok|hot]

var
  msgText :string;
  msgStrings: TStrings;
  size    :integer;
begin
  msgText:=PMISSock.ReceiveText;
  Socket.SendText(roger);

  if msgText[1] in
['a','b','c','d','D','e','f','g','h','m','n','i','j','k','l','o','p','s','0','1','t'] then
    LogEvent('<-CCD: '+msgText)
  else
    LogEvent('<-CCD unknown: '+msgText);


  if msgText[1] in ['a', 'e', 'g', 'm','1'] then  begin  //PMISBusy
    BtnObserve.Enabled  := FALSE;
    BImIaquire.Enabled  := FALSE;
    BImBias.Enabled     := FALSE;
    BImFlatField.Enabled := FALSE;
    BTmpImg.Enabled     := FALSE;
    BImArea.Enabled     := FALSE;
    FilterWheel.Enabled := FALSE;
    GraphicMove.Enabled := FALSE;
     PMISStatus := PMISExposing;
     ObsTimer.Tag := 1;
     TakeExposure(Sender);
  end else   if msgText[1] in ['c','d', 'D','f', 'h', '0','n'] then  begin  //PMISIdle='0'
     PMISStatus := PMISIdle;
     ObsTimer.Enabled := FALSE;
     ObsTimer.Tag := 4;
     TakeExposure(Sender);
    BtnObserve.Enabled  := FilterPcConnected AND not FiltSeqOn AND not AutoRunOn;
    BImFlatField.Enabled := BtnObserve.Enabled;
    BTmpImg.Enabled     := BtnObserve.Enabled;
    BImIaquire.Enabled  := not FiltSeqOn AND not AutoRunOn;
    BImBias.Enabled     := BImIaquire.Enabled;
    BImArea.Enabled     := BImIaquire.Enabled;
    GraphicMove.Enabled    := ScopePcConnected AND BImIaquire.Enabled;
    FilterWheel.Enabled := (FWState = FWIdle) AND not(AutoRunOn OR FiltSeqOn);
  end else if msgText[1] in ['s'] then begin   // DP 22June2007
     // Read the CCD mean count                // DP 22June2007
     ImageMeanCount := strToFloat(msgText[2]); // DP 22June2007
  end;
  if (msgText[1] in ['g', 'h']) then begin
     CamFrmSizeX.Value    := 1024;
     CamFrmSizeY.Value    := 1024;
     CamLeftCorner.Value  := 1;
     CamTopCorner.Value   := 1;
     CCDBinXEdt.Value     := 2;
     CCDBinYEdt.Value     := 2;
  end else   if (msgText[1] ='d') then begin
     size := StrToIntDef(AnsiReplaceStr(msgText,'d ',''),0);
     CamFrmSizeX.Value    := size;
     CamFrmSizeY.Value    := size;
     CamLeftCorner.Value  := 512 - size div 2;
     CamTopCorner.Value   := CamLeftCorner.Value;
     CCDBinXEdt.Value     := 1;
     CCDBinYEdt.Value     := 1;
  end else if (msgText[1] ='m') then begin
     LogEvent('<-CCD: XYMOVE: Position cursor on image!')
  end;
  // Guider messages
  if (msgText[1] in ['i']) then begin
    GuiderStatusLabel.Caption := 'Tracking';
    GuiderStatusLabel.Font.Color := clWindowText;
    GuiderBtn.Caption         := 'Stop';
    GuiderBtn.Font.Color      := clRed;
    GuiderBtn.Enabled         := TRUE;
    if (AutoCycle.Text = '5') AND (AutoRunOn) then
        AutoCycle.Text := '2';
  end else if (msgText[1] in ['j']) then begin
    GuiderStatusLabel.Caption := 'Idle';
    GuiderStatusLabel.Font.Color := clWindowText;
    GuiderBtn.Caption         := 'Start';
    GuiderBtn.Font.Color      := clWindowText;
    GuiderBtn.Enabled         := TRUE;
    if (AutoCycle.Text = '3') AND (AutoRunOn) then
        AutoCycle.Text := '6';
  end else if (msgText[1] in ['k']) then begin
    GuiderStatusLabel.Caption := 'Failed';
    GuiderStatusLabel.Font.Color := clRed;
    GuiderBtn.Caption         := 'Start';
    GuiderBtn.Font.Color      := clWindowText;
    GuiderBtn.Enabled         := TRUE;
    AlertForm.AlertTxt.Caption := 'Failed to Auto-Guide! Guide manually';
    AlertForm.Show;
  end else if (msgText[1] in ['l']) then begin
    GuiderStatusLabel.Caption := 'Fade';
    GuiderStatusLabel.Font.Color := clRed;
    GuiderBtn.Caption         := 'Stop';
    GuiderBtn.Font.Color      := clRed;
    GuiderBtn.Enabled         := TRUE;
    AlertForm.AlertTxt.Caption := 'Guide star has faded!';
    AlertForm.Show;
  end;
  // CCD Temperature messages
  if (msgText[1] in ['o']) then begin
     CCDTempLabel.Caption := 'OK';
     CCDTempLabel.Font.Color := clWindowText;
     CCDTempLabel.Font.Style := [];
  end else if (msgText[1] in ['p']) then begin
     CCDTempLabel.Caption := 'HOT!';
     CCDTempLabel.Font.Color := clRed;
     CCDTempLabel.Font.Style := [fsBold];
     AlertForm.AlertTxt.Caption := 'CCD is too hot - cool it!';
     AlertForm.Show;
     SoundAlert(SndFailure);
     LogEvent('<- CCDTemp is too high');
  end;
  // Get selected star FWHM
  if (msgText[1] in ['t']) then begin
     msgStrings:= TStringList.Create;
     try
        ParseStr(msgText,msgStrings,' ');
        StarFWHM_ := StrToFloat(msgStrings[1]);
        StarIsSelected_ := TRUE;
     finally
        msgStrings.Free;
     end;
  end;
end;







//------------------------------------------------------------------------------
procedure TROForm.ListMask(Sender: TObject; ACol, ARow: Integer; var Value: String);
//------------------------------------------------------------------------------
begin
  with (Sender as TStringGrid) do
    begin
    if Cells[ACol, 0] = 'Epoch' then
    Value :=  '0000.0;1';
    if Cells[ACol, 0] = 'R.A.' then
    Value :=  '00\:00\:00.0;1';
    if Cells[ACol, 0] = 'Dec.' then
    Value :=  '#00\:00\:00.0;1; ';
  end;
end;


//------------------------------------------------------------------------------
procedure TROForm.GoToTimerTimer(Sender: TObject);
//------------------------------------------------------------------------------
begin
 case GoTOTimer.Tag of
 1: begin
    RABarLabel.Visible  := TRUE;
    DecBarLabel.Visible := TRUE;
    GoToTimer.Enabled := TRUE;
    RAPrBar.Visible   := TRUE;
    RAPrBar.Min       := 0;
    RAPrBar.Max       := Round(1000*abs(TargetRA-ScopeRA));
    RABarLbl1.Caption := format('%5.2f°', [abs(TargetRA-ScopeRA)/pi*180]);
    RABarLbl1.Visible := TRUE;
    RAPrBar.Tag       := Round(1000*TargetRA);
    RAPrBar.Position  := 0;
    DecPrBar.Visible  := TRUE;
    DecPrBar.Min      := 0;
    DecPrBar.Max      := Round(1000*abs(TargetDec-ScopeDec));
    DecPrBar.Visible  := TRUE;
    DecBarLbl1.Caption := format('%5.2f°', [abs(Str2CoordR(RADec.Text)-ScopeDec)/pi*180]);
    DecBarLbl1.Visible := TRUE;
    DecPrBar.Tag      := Round(1000*Str2CoordR(RADec.Text));
    GoToTimer.Tag     := 2;
 end;
 2: begin
    RAPrBar.Position  := RAPrBar.Max - Round(abs(1000*ScopeRA-RAPrBar.Tag));
    DecPrBar.Position := DecPrBar.Max - Round(abs(1000*ScopeDec-DecPrBar.Tag));
 end;
 3: begin
    GoToTimer.Enabled   := FALSE;
    RABarLabel.Visible  := FALSE;
    DecBarLabel.Visible := FALSE;
    RAPrBar.Visible     := FALSE;
    DecPrBar.Visible    := FALSE;
    RABarLbl1.Visible   := FALSE;
    DecBarLbl1.Visible  := FALSE;
    RABarLbl1.Visible   := FALSE;
    DecBarLbl1.Visible  := FALSE;
    GoToTimer.Tag       := -1;
 end;
 end;
end;

//------------------------------------------------------------------------------
procedure TROForm.ValidateRADataInput(Sender: TObject);
//------------------------------------------------------------------------------
begin
  CoordOK        := FALSE;
  CoordOKLabel.Visible  := FALSE;
  CoordErrLabel.Visible := FALSE;
  AddToGridB.Enabled    := FALSE;

  if (RATarget.Text ='') AND (RARA.Text ='') AND (RADec.Text ='') AND (RAEpoch.Text ='') then
  //do notging
  else if ValidateRA(RARA.Text, TargetRA) AND ValidateDec(RADec.Text, TargetDec)
         AND ValidateEpoch(RAEpoch.Text, LimitEpoch, MinEpoch, MaxEpoch, TargetEpoch) AND ValidateObjName(RATarget.Text) then begin
     CoordOK        := TRUE;
     CalcAltAz(TargetRA, TargetDec, STNow, SiteNorthLat,  TargetAlt, TargetAz);
     TargetAM := CalcAM(TargetAlt);
     CoordOKLabel.Caption := Format('Target:  AM=%0.1f  Alt=%0.1f°  Moon dist=%0.1f°',
          [TargetAM, TargetAlt/pi*180, SphereDist(TargetRA, TargetDec, MoonRA, MoonDec)/pi*180]);
     CoordOKLabel.Visible  := TRUE;
     if (OpenedListFiles.Count >0) then begin
        AddToGridB.Enabled := TRUE;
     end;
  end else begin
     CoordErrLabel.Visible := TRUE;
  end;
end;
    
//------------------------------------------------------------------------------
procedure TROForm.ListCloseClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
    if ( (ListPg.Pages[ListPg.ActivePageIndex].Controls[0] = AutoRunList) and AutoRunOn ) then begin
       ShowMessage('Can not close active list. Terminate Autocycle first');
       exit;
    end;

    OpenedListFiles.Delete(ListPg.ActivePageIndex);
    ListPg.Pages[ListPg.ActivePageIndex].Free;
    if (OpenedListFiles.Count <1) then begin
       Save_list.Enabled  := FALSE;
       SaveAs_List.Enabled := FALSE;
       AddToGridB.Enabled := FALSE;
       AutoMode.Enabled   := FALSE;
       AutoMode.Checked   := FALSE;
   end;

end;

//------------------------------------------------------------------------------
procedure TROForm.LogEvent(event: string);
//------------------------------------------------------------------------------
begin
  TerminalMemo.Lines.Add(LTEdit.Text+' '+event);
end;

//------------------------------------------------------------------------------
procedure TROForm.CamFrameSquareClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
   if CamFrameSquare.Checked then
      CamFrmSizeY.Visible := FALSE
   else
      CamFrmSizeY.Visible := TRUE;
end;

//------------------------------------------------------------------------------
procedure TROForm.DomeMic(Sender: TObject);
//------------------------------------------------------------------------------
begin
   case NetMeetOption of
        0: ShellExecute(Handle, 'open', Pchar('callto:'+MicIP),nil, nil, SW_MINIMIZE);
        1: ShellExecute(Handle, 'open',PChar(NetMeetPath), PChar(MicIP),nil, SW_MINIMIZE);
   end;
end;

//------------------------------------------------------------------------------
procedure TROForm.CamAMLimChange(Sender: TObject);
//------------------------------------------------------------------------------
var
  amlim : string;
begin
   CameraControlsColor(clWindow);
   amlim := CamAMLim.Text;
   if ValidateAMLimit(amlim)= FALSE then begin
      ShowMessage('Illegal airmass!');
      CamAMLim.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
procedure TROForm.ValidateHADataInput(Sender: TObject);
//------------------------------------------------------------------------------
begin
      if  ValidateHA(HAHA.Text, TargetHA) AND ValidateDec(HADec.Text, TargetDec) then begin
          CoordOK        := TRUE;
          CoordOKLabel.Visible  := TRUE;
          CoordErrLabel.Visible := FALSE;
          CalcAltAz_HA(TargetHA, TargetDec, SiteNorthLat,  TargetAlt, TargetAz);
          CoordOKLabel.Caption := Format('Target:  AM=%0.1f  Alt=%0.1f°  ',
          [CalcAM(TargetAlt), TargetAlt/pi*180]);
      end else begin
          CoordOK        := FALSE;
          CoordOKLabel.Visible  := FALSE;
          CoordErrLabel.Visible := TRUE;
      end;
end;


//------------------------------------------------------------------------------
procedure TROForm.ConnectAllClick(Sender: TObject);
//------------------------------------------------------------------------------
begin

 if not ScopePcConnected then
   ScopeConnectClick(Sender);
 if not DomePcConnected then
   InitDome(Sender);
 if not C18Connected then
   C18ConnectClick(Sender);
 if not FocusConnected then
   FocusConnectClick(Sender);
 if not WeatherConnected then
   WeatherConnectClick(Sender);

 Case INSTchoose.ItemIndex of
   0: begin  //PI Camera
       if not PMISConnected then
         PMISConnectClick(Sender);
       if not FilterPcConnected then
         InitFilters(Sender);
   end;
   1: begin  //LAIWO Camera
       if not LaiwoScienceConnected then
         LaiwoScienceConnectClick(Sender);
       if not LaiwoGuiderConnected then
         LaiwoGuiderConnectClick(Sender);
   end;
   end;

// Through the CCD socket (PMIS) - DP 20081220
// if not CCDTempConnected then
//   CCDTempConnectClick(Sender);
// SK remove skype connection 20070719
// DomeMic(Sender);
end;

//------------------------------------------------------------------------------
procedure TROForm.DisconnectAllClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
 if ScopePcConnected then
    ScopeDisconnectClick(Sender);
 if PMISConnected then
    PMISDisconnectClick(Sender);
 if LaiwoScienceConnected then
    LaiwoScienceDisconnectClick(Sender);
 if LaiwoGuiderConnected then
    LaiwoGuiderDisconnectClick(Sender);
 if FilterPcConnected then
    FWDisconnectClick(Sender);
 if DomePcConnected then
    DomeDisconnectClick(Sender);
 if C18Connected then
    C18DisconnectClick(Sender);
 if FocusConnected then
    FocusDisconnectClick(Sender);
 if WeatherConnected then
    WeatherDisconnectClick(Sender);
// Through the CCD socket (PMIS) - DP 20081220
// if CCDTempConnected then
//    CCDTempDisconnectClick(Sender);
end;

//------------------------------------------------------------------------------
procedure TROForm.Preferences1Click(Sender: TObject);
//------------------------------------------------------------------------------
begin
  if not(Preferences1.Checked) then
   PrefsForm.show;
end;

//------------------------------------------------------------------------------
procedure TROForm.ListCalcAM(Sender: TObject);
//------------------------------------------------------------------------------
var
 i :integer;
 RARad, DecRad, ObjAlt, ObjAz, HARad: extended;
begin
 if ListPg.PageCount>0 then
   with  (ListPg.ActivePage.Controls[0] as TStringGrid) do
   for i:= 1 to Rowcount-1 do
     if ( ValidateRA(Cells[2,i], RARad) AND ValidateDec(Cells[3,i], DecRad) ) then begin
         CalcAltAz(RARad, DecRad, STNow, SiteNorthLat,  ObjAlt, ObjAz);
         HARad := STNow-RARad/2/pi;
         if (HARad > 0.5) then
            HARad := HARad -1
         else if (HARad < -0.5) then
            HARad := HARad +1;
         Cells[9,i] := format('%0.1f',[CalcAM(ObjAlt)*Sign(-HARad)])
     end else
        Cells[9,i] := 'Err';
end;

//------------------------------------------------------------------------------
procedure TROForm.BtnStopObserveMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//------------------------------------------------------------------------------
begin
   if (ssShift in shift) and (PMISStatus=PMISExposing)then begin
      BtnStopObserveClick(Sender);
      if MessageDlg('Abort Exposure?', mtConfirmation,
                     [mbYes, mbNo], 0) = mrNo then
         exit;
         Case INSTchoose.ItemIndex of
         0: begin  //PI Camera
              PMISSock.SendText('1 abort');
            end;
         1: begin  //LAIWO Camera
//   Need to check what is the exact command for LaiwoScience here and put it here
//              LaiwoScienceSock.SendText('camera mode STOP'#10);
            end;
         end;
         LogEvent('->CCD: abort');
         ObsCycleStatus.Caption := 'Aborting Exposure';
   end;
end;

//------------------------------------------------------------------------------
procedure TROForm.SiteInfo1Click(Sender: TObject);
//------------------------------------------------------------------------------
begin
   SiteInfo.Show;
end;

//------------------------------------------------------------------------------
procedure TROForm.GraphicMoveClick(Sender: TObject);
//------------------------------------------------------------------------------
Var cmd : string;
begin
   CameraControlsColor(clWindow);
    CamExp.SetFocus;
   cmd := Format('%s %s %s', [PMISExecLine, 'RmoveIt', ROTATORE.Text ]);
   PMISSock.SendText(cmd);
   LogEvent('->CCD: ' +cmd);
end;

//------------------------------------------------------------------------------
procedure TROForm.SpinBUpClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
   if (Sender=AMLimSpinB) then
      CamAMLim.Text := Format('%0.1f',[Min(AMLimit,Max(1,StrToFloat(CamAMLim.Text)+1))])
   else if (Sender=RotatorSpinB) then
      RotatorE.Text := Format('%0.1f',[Min(359.9,Max(0,StrToFloat(ROTATORE.Text)+1))])

end;

//------------------------------------------------------------------------------
procedure TROForm.SpinBDownClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
   if (Sender=AMLimSpinB) then
      CamAMLim.Text := Format('%0.1f',[Max(1,Min(AMLimit,StrToFloat(CamAMLim.Text)-1))])
   else if (Sender=RotatorSpinB) then
      RotatorE.Text := Format('%0.1f',[Max(0,Min(359.9,StrToFloat(ROTATORE.Text)-1))]);
end;

//------------------------------------------------------------------------------
procedure TROForm.RotatorEExit(Sender: TObject);
//------------------------------------------------------------------------------
Var
//RotatorAngle should be a global var!
  RAngle, RotatorAngle : extended;
begin
   RotatorAngle := 999 ;
   RAngle := StrToFloatDef(ROTATORE.Text, -MaxExtended);
   if (RAngle <0) OR (RAngle>=360.0) then begin
      ShowMessage('Illegal rotation angle!');
      RotatorE.SetFocus;
   end else
      RotatorAngle := RAngle;
      LogEvent('Rotator Angle = '+IntToStr(Round(RotatorAngle)));
end;

//------------------------------------------------------------------------------
procedure TROForm.About1Click(Sender: TObject);
const
  crlf: string = #13#10;
  InfoNum = 3;
  InfoStr: array[1..InfoNum] of string = ('CompanyName', 'FileDescription', 'FileVersion');
var
  S: string;
  n, Len, i: DWORD;
  Buf: PChar;
  Values: array[1..InfoNum] of PChar;
  dt: TDateTime;
begin

  S := Application.ExeName;
  n := GetFileVersionInfoSize(PChar(S), n);
  if n > 0 then begin
    Buf := AllocMem(n);
    GetFileVersionInfo(PChar(S), 0, n, Buf);
    for i := 1 to InfoNum do
      VerQueryValue(Buf, PChar('StringFileInfo\040904E4\' + InfoStr[i]), Pointer(Values[i]), Len);
    FreeMem(Buf, n);
  end;

  dt := FileDateToDateTime(FileAge(Application.ExeName));
  ShowMessage(Format('%s'                                                     + crlf +
                 '  version %s (%s)'                                          + crlf +
                 '  %s'                                                       + crlf +
                                                                                crlf +
                 'Written:    2001-2006 by Yiftah Lipkin'                     + crlf +
                 'Maintained: since 2007 by Shai Kaspi and David Polishook'   + crlf +
                 'Maintained: since 2010 by Shai Kaspi'                       + crlf +
                 'Maintained: since 2015 by Arie Blumenzweig', [
                    Values[2],
                    Values[3],
                    FormatDateTime('d-mmm-yyyy@hh:nn.ss', dt),
                    Values[1]
                 ]));
end;


//------------------------------------------------------------------------------
procedure TROForm.BImBiasClick(Sender: TObject);
//------------------------------------------------------------------------------
var
 cmd :string;
begin
  CameraControlsColor(clWindow);
  cmd :='';
  if (Sender = BImBias) then begin
    if (BiasDialog.Showmodal = mrOK ) then begin
       cmd := Format('%s %s %s', [PMISExecLine, 'RImbias', BiasDialog.BiasSpin.Text ]);
       Texp := 0;
    end;
  end else if (Sender = BTmpImg) then begin
    if (TestExpDialog.Showmodal = mrOK ) then begin
       Texp := StrToFloat(TestExpDialog.TestExpE.Text);
       cmd := Format('%s %s %s %0.2f %s %d', [PMISExecLine, 'Rimtake','test',
                     Texp,FilterWheel.Items[FilterWheel.ItemIndex],
                     FilterWheel.ItemIndex]);
    end;
  end else if (Sender = BImIaquire) then begin
    if (AcquireDialog.Showmodal = mrOK ) then begin
       Texp := StrTofloat(AcquireDialog.AcExpE.Text);
       cmd := Format('%s %s %0.2f', [PMISExecLine, 'Racquire', Texp]);
    end;
  end else if (Sender = BImArea) then begin
    if (CCDAreaDialog.Showmodal = mrOK ) then begin
       cmd := Format('%s %s %s', [PMISExecLine, 'RIareab', CCDAreaDialog.IAreaE.Text ]);
    end;
  end;

  if (cmd <> '') then begin
     PMISSock.SendText(cmd);
     LogEvent('->CCD: ' +cmd);
  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.AutoDomeTrackClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
  AutoDomeTrack.Checked := not AutoDomeTrack.Checked;
  if AutoDomeTrack.Checked then
     if RATrackOn then begin
       DmTrackOnBtn.Down := True;
       DmTrackOnBtn.Click;
     end else begin
       DmTrackOffBtn.Down := True;
       DmTrackOffBtn.Click;
     end;
end;

//------------------------------------------------------------------------------
procedure TROForm.CamExpEnter(Sender: TObject);
//------------------------------------------------------------------------------
begin
   CameraControlsColor(clWindow);
end;

//------------------------------------------------------------------------------
procedure TROForm.CameraControlsColor(Color: TColor);
//------------------------------------------------------------------------------
begin
   if (CamExp.Color<>Color) then begin
      CamExp.Color    := Color;
      CamRepete.Color := Color;
      CamAMLim.Color  := Color;
      CamUTLim.Color  := Color;
      if (Color = clWindow) then
         ObsCycleStatus.Caption := '';
   end;
end;

//------------------------------------------------------------------------------
procedure TROForm.CamRepeteChange(Sender: TObject);
//------------------------------------------------------------------------------
begin
  CameraControlsColor(clWindow);
end;

//------------------------------------------------------------------------------
procedure TROForm.erminal1Click(Sender: TObject);
//------------------------------------------------------------------------------
begin
  TerminalMemo.Show;
end;

//------------------------------------------------------------------------------
procedure TROForm.Clock1Click(Sender: TObject);
//------------------------------------------------------------------------------
begin
    PosBox.Show;
end;

//------------------------------------------------------------------------------
procedure TROForm.CamUTLimExit(Sender: TObject);
//------------------------------------------------------------------------------
var
 UTLimF  : extended;
begin
  if (CamUTLim.Text = '') then
     CamUTLim.Text := SiteInfo.NautM.Caption;
  if not(ValidateRA(CamUTLim.Text+':00', UTLimF) ) then begin
     ShowMessage('Illegal UT limit!');
     CamUTLim.SetFocus;
 end;
end;


//------------------------------------------------------------------------------
procedure TROForm.ListPgMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
//------------------------------------------------------------------------------
begin
ListPg.PopupMenu.AutoPopup := TRUE;
end;

//------------------------------------------------------------------------------
procedure TROForm.DelGridLineClick(Sender: TObject);
//------------------------------------------------------------------------------
var
  i :integer;
  Grid : TstringGrid;
begin
  Grid:= ( ListPg.Pages[ListPg.ActivePageIndex].Controls[0] as TstringGrid);
  for i:= Grid.Row to Grid.RowCount-2 do
     Grid.Rows[i] := Grid.Rows[i+1];
  Grid.RowCount := Grid.RowCount-1;
end;

//------------------------------------------------------------------------------
procedure TROForm.InsGridLineClick(Sender: TObject);
//------------------------------------------------------------------------------
var
  i :integer;
  Grid : TstringGrid;
begin
  Grid:= ( ListPg.Pages[ListPg.ActivePageIndex].Controls[0] as TstringGrid);
  Grid.RowCount := Grid.RowCount+1;

   for i:= Grid.RowCount-1 downto Grid.Row+1 do
      Grid.Rows[i+1] := Grid.Rows[i];
  Grid.Rows[Grid.Row+1].Clear;
  Grid.Cells[0,Grid.Row+1] := '00';
end;

//------------------------------------------------------------------------------
procedure TROForm.Clear1Click(Sender: TObject);
//------------------------------------------------------------------------------
var
  Grid : TstringGrid;
begin
  Grid := ( ListPg.Pages[ListPg.ActivePageIndex].Controls[0] as TstringGrid);
  Grid.Rows[Grid.Row].Clear;
end;

//------------------------------------------------------------------------------
procedure TROForm.ListSaveClick(Sender: TObject);
//------------------------------------------------------------------------------
var
  ChildControl: TControl;
  F1: TextFile;
  i :integer;
begin
  ChildControl:= ListPg.Pages[ListPg.ActivePageIndex].Controls[0];
  With (ChildControl as TStringGrid) do begin
     AssignFile(F1, OpenedListFiles.Strings[(ChildControl.Parent as TTabSheet).Tag]);  //WRONG; SHOULD FIND NAME!
     Rewrite(F1);
     for i:= 1 to RowCount-1 do
       Writeln(F1,Format('%3s  %12s  %12s %5s %15s %20s',[Cells[0,i],Cells[2,i], Cells[3,i], Cells[4,i], Cells[1,i], Cells[5,i]]));
       CloseFile(F1);
  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.ListSaveAsClick(Sender: TObject);
//------------------------------------------------------------------------------
var
  ChildControl: TControl;
  F1: TextFile;
  i :integer;
begin
  ChildControl:= ListPg.Pages[ListPg.ActivePageIndex].Controls[0];
  With (ChildControl as TStringGrid) do begin
    SaveListDlg.FileName :=  ExtractFileName(OpenedListFiles[ListPg.ActivePageIndex]);
    SaveListDlg.InitialDir :=  ExtractFilePath(OpenedListFiles[ListPg.ActivePageIndex]);
    if SaveListDlg.Execute then begin
       AssignFile(F1, SaveListDlg.Filename);
       Rewrite(F1);
       for i:= 1 to RowCount-1 do
          Writeln(F1,Format('%3s  %12s  %12s %5s %15s %20s',[Cells[0,i],Cells[2,i], Cells[3,i], Cells[4,i], Cells[1,i], Cells[5,i]]));
          CloseFile(F1);
    end;
  end;
  With (ChildControl.Parent as TTabSheet) do begin
      OpenedListFiles.Strings[Tag] := SaveListDlg.Filename;
      Caption := ChangeFileExt(ExtractFileName(SaveListDlg.Filename), '');
  end;

end;

//------------------------------------------------------------------------------
procedure TROForm.MeteorologyMnuClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
// absolute
//  MeteorologyMnu.Checked := not MeteorologyMnu.Checked;
//  Wise_Meteorology.Visible := MeteorologyMnu.Checked;
end;

//------------------------------------------------------------------------------
procedure TROForm.AddToGridBClick(Sender: TObject);
//------------------------------------------------------------------------------
var
  Grid : TstringGrid;
begin
  if (OpenedListFiles.Count <1) then
    exit;
  Grid:= (ListPg.Pages[ListPg.ActivePageIndex].Controls[0] as TstringGrid);
  Grid.RowCount := Grid.RowCount+1;
  Grid.Row := Grid.RowCount-1;
  Grid.Cells[0,Grid.Row] := Format('%0.3d',[StrToIntDef(Grid.Cells[0,Grid.Row-1], -1)+1]);
  Grid.Cells[1,Grid.Row] := RATarget.Text;
  Grid.Cells[2,Grid.Row] := RARA.Text;
  Grid.Cells[3,Grid.Row] := RADec.Text;
  Grid.Cells[4,Grid.Row] := RAEpoch.Text;
  Grid.Cells[5,Grid.Row] := AnsiReplaceText(AnsiReplaceText(
                            CamExp.Strings.DelimitedText, ',','  '), '=',' ');

end;

//------------------------------------------------------------------------------
procedure TROForm.ListReloadClick(Sender: TObject);
//------------------------------------------------------------------------------
Var
   S: string;
   InList, Tokens: TStrings;
   i: integer;

begin
  with (ListPg.Pages[ListPg.ActivePageIndex].Controls[0] as TStringGrid) do begin
    RowCount := 1;
    Tokens:=TStringList.Create;
    InList:= TStringList.Create;
    try
      InList.LoadFromFile(OpenedListFiles.Strings[(Parent as TTabSheet).Tag]);
{use Dynamic arrays here: SetLength(Array, n) }
      for i:=1 to InList.Count do begin
         S:=InList.Strings[i-1];
         Tokens.Clear;
         ParseStr(S, Tokens,' ');
         if Tokens.Count <5 then
           showMessage('line #'+Format('%d',[i])+': ''' +StringReplace(S, '  ', ' ',[rfReplaceAll])+ ''' illegel')
         else begin
           RowCount:=RowCount+1;
           Cells[0,RowCount-1]:=Tokens[0];Cells[1,RowCount-1]:=Tokens[4];
           Cells[2,RowCount-1]:=Tokens[1];Cells[3,RowCount-1]:=Tokens[2];
           Cells[4,RowCount-1]:=Tokens[3];
           if (Tokens.Count>5) then
             cells[5,RowCount-1]:=AppendStr(Tokens,5);
         end;
      end;
    finally
      Tokens.Free;
      InList.Free;
    end;
    if RowCount>1 then
       FixedRows:=1
    else begin
            //Empty List!
    end;
        end;
   end;

// Added by DP 21May07 - Still work on this
//------------------------------------------------------------------------------
procedure TROForm.INSTchooseChange(Sender: TObject);
//------------------------------------------------------------------------------

 Begin
   Case INSTchoose.ItemIndex of
   0: begin  //PI Camera
      Instrument := 'PI' ;
      PMISConnect.Enabled := True ;
      FWConnect.Enabled := True ;
      LAIWOScienceConnect.Enabled := False ;
      LAIWOGuiderConnect.Enabled := False  ;
   end;
   1: begin  //LAIWO Camera
      Instrument := 'LAIWO' ;
      PMISConnect.Enabled := False ;
      FWConnect.Enabled := False ;
      LAIWOScienceConnect.Enabled := True ;
      LAIWOGuiderConnect.Enabled := True  ;
   end;
{   2: begin  //FOSC
      Instrument := 'FOSC' ;
   end;
}
   end;
   ReWrite(InstrumentFile);
   WriteLn(InstrumentFile,Instrument);
   CloseFile(InstrumentFile);
End;



// Added by DP 22June2007
//------------------------------------------------------------------------------
procedure TROForm.BImFlatFieldClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
   FlatScriptDialog.Show;
end;

// Added by DP 22June2007
//------------------------------------------------------------------------------
function  TROForm.isTelescopeMoving(Sender: TObject) : Boolean;
//------------------------------------------------------------------------------
begin
   Result := TelescopeMoving;
end;

// Added by DP 22June2007
//------------------------------------------------------------------------------
function  TROForm.isFiltSeqOn(Sender: TObject) : Boolean;
//------------------------------------------------------------------------------
begin
   Result := FiltSeqOn;
end;

// Added by DP 22June2007
//------------------------------------------------------------------------------
procedure TROForm.askCCDMeanCount(Sender: TObject);
//------------------------------------------------------------------------------
var
cmd : string;
begin
   cmd := PMISGetMeanCount;
   PMISSock.SendText(cmd);
end;

// Added by DP 22June2007
//------------------------------------------------------------------------------
function  TROForm.GetCCDMeanCount(Sender: TObject) : Extended;
//------------------------------------------------------------------------------
begin
   Result := ImageMeanCount;
end;

// Added by DP July2007
//------------------------------------------------------------------------------
procedure TROForm.Debugoptions1Click(Sender: TObject);
//------------------------------------------------------------------------------
begin
   if (not debugOptions_) then begin
      debugOptions_ := TRUE;
      VentsBtn.Visible := TRUE;
      VentsLabel.Visible := TRUE;
      FlatLAmpLabel.Visible := TRUE;
      FlatLampBtn.Visible := TRUE;
   end else if (debugOptions_) then begin
      debugOptions_ := FALSE;
      VentsBtn.Visible := FALSE;
      VentsLabel.Visible := FALSE;
      FlatLAmpLabel.Visible := FALSE;
      FlatLampBtn.Visible := FALSE;
   end;
end;

// Added by DP July2007
//------------------------------------------------------------------------------
procedure TROForm.SendAbortImageToCCD(Sender: TObject);
//------------------------------------------------------------------------------
begin
        Case INSTchoose.ItemIndex of
         0: begin  //PI Camera
              PMISSock.SendText('1 abort');
            end;
         1: begin  //LAIWO Camera
 //   Need to check what is the exact command for LaiwoScience here and put it here
 //             LaiwoScienceSock.SendText('camera mode STOP'#10);
            end;
         end;
   LogEvent('->CCD: abort');
   ObsCycleStatus.Caption := 'Aborting Exposure';
end;

//------------------------------------------------------------------------------
procedure TROForm.GuiderBtnClick(Sender: TObject);
//------------------------------------------------------------------------------
var
 cmd :string;
begin
   Case INSTchoose.ItemIndex of
   0: begin  //PI Camera
      if (GuiderStatusLabel.Caption = 'Idle') or
              (GuiderStatusLabel.Caption = 'Failed') then begin
        cmd := Format('%s %s %s', [PMISExecLine, 'Guide','start']);
      // To add the Texp to the command? - DP July2007
      //   cmd := Format('%s %s %s %0.2f', [PMISExecLine, 'Guide','start', Texp]);
        GuiderStatusLabel.Caption := 'Exposing';
        GuiderStatusLabel.Font.Color := clWindowText;
        GuiderBtn.Caption         := 'Wait...';
        GuiderBtn.Enabled := FALSE;
      end else if (GuiderStatusLabel.Caption = 'Tracking') or
               (GuiderStatusLabel.Caption = 'Fade') then begin
         cmd := Format('%s %s %s', [PMISExecLine, 'Guide','stop']);
      end;

      if (cmd <> '') then begin
         PMISSock.SendText(cmd);
         LogEvent('->CCD: ' +cmd);
      end;

   end;
   1: begin  //LAIWO Camera
      if (GuiderStatusLabel.Caption = 'Idle') or
               (GuiderStatusLabel.Caption = 'Faild') then begin
          LaiwoGuiderSock.SendText('guider autoguide 1'#10);
          LaiwoGuiderSock.SendText('guider mode overview'#10);
          LaiwoGuiderSent := 1 ;
          GuiderStatusLabel.Caption := 'Tracking';
          GuiderBtn.Font.Color      := clRed;
          GuiderBtn.Caption         := 'Stop';
          GuiderBtn.Enabled         := TRUE;
      end else if (GuiderStatusLabel.Caption = 'Tracking') or
               (GuiderStatusLabel.Caption = 'Fade') then begin
          LaiwoGuiderSock.SendText('guider mode stop'#10);
          LaiwoGuiderSent := 2 ;
          GuiderStatusLabel.Caption := 'Idle';
          GuiderBtn.Caption         := 'Start';
          GuiderBtn.Font.Color      := clWindowText;
          GuiderBtn.Enabled         := TRUE;
      end;
   end;
   end;
end;

//------------------------------------------------------------------------------
// Socket added by Shai (20081124) for Laiwo to control the DomeTrack operation
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
procedure TROForm.LaiwoSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
var
 LaiwoText:  string;
 msgStrings: TStrings;
begin
   LaiwoText :=Socket.ReceiveText;
   if (LaiwoText[1] = '1') then begin
      if (DomeStatus <> DmStuck) then begin
          DomeTrackOn := TRUE ;
          DmTrackOnBtn.Down := True;
          DmTrackOnBtn.Click;
          LogEvent('DomeTrackOn '+LaiwoText[1]);
      end else
          DmTrackOffBtn.Down := True;
      if RATrackON then
         SlitThAzLbl.Font.Color := clWindowText
      else
         SlitThAzLbl.Font.Color := clRed;
   end else if (LaiwoText[1] = '0') then begin
      DomeTrackOn := FALSE;
      DmTrackOffBtn.Down := True;
      DmTrackOffBtn.Click;
      LogEvent('DomeTrackOff '+LaiwoText[1]);
      if RATrackON then
         SlitThAzLbl.Font.Color := clRed
      else
         SlitThAzLbl.Font.Color := clWindowText;
   end;

  if (LaiwoText[1] = '2') then begin
  msgStrings:= TStringList.Create;
    try
       ParseStr(LaiwoText,msgStrings,' ');
       Tabs.ActivePage := TabRA;
       RATarget.Text   := msgStrings.Strings[4];
       RARA.Text       := msgStrings.Strings[1];
       RADec.Text      := msgStrings.Strings[2];
       RAEpoch.Text    := msgStrings.Strings[3];
    finally
     msgStrings.Free;
    end;
       ValidateRADataInput(Sender);
       TabsChange(Sender);
       BtnGoTo.Click;
  end;
end;


// Added by David Polishook to read the sky conditions from the C!8 clarity tool - December 2008
//------------------------------------------------------------------------------
procedure TROForm.C18SocketConnect(Sender: TObject;
//------------------------------------------------------------------------------
  Socket: TCustomWinSocket);
begin
      LogEvent('C18 socket activated');
      SoundAlert(SndSockConnect);
      C18Connected := TRUE;
      C18Sock := C18Socket.Socket;
      SkyStatLabel.Visible := TRUE;
      SkyStatLabel.Enabled := TRUE;
      SkyStatLabel.Caption :='Unknown';
      SkyStatLabel.Font.Color := clRed;
      C18Connect.Enabled    := FALSE;
      C18Disconnect.Enabled := TRUE;
      C18Sock.SendText('S');
end;

//------------------------------------------------------------------------------
procedure TROForm.C18SocketDisconnect(Sender: TObject;
//------------------------------------------------------------------------------
  Socket: TCustomWinSocket);
begin
      LogEvent('C18 socket closed.');
      SoundAlert(SndSockDisconnect);
      C18Connected := FALSE;
      SkyStatLabel.Caption :='Not Connected';
      SkyStatLabel.Font.Color := clRed;
      SkyStatLabel.Font.Size := 10;
      C18Connect.Enabled    := TRUE;
      C18Disconnect.Enabled := FALSE;
end;

//------------------------------------------------------------------------------
procedure TROForm.C18SocketError(Sender: TObject; Socket: TCustomWinSocket;
//------------------------------------------------------------------------------
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
   LogEvent('Clouds Radar Socket Error: '+IntToStr(ErrorCode)+'. Closing socket...');
   ErrorCode :=0;
   AlertForm.AlertTxt.Caption := 'Clouds Radar Communication Error';
   AlertForm.Show;
   C18DisconnectClick(Sender);
end;

//------------------------------------------------------------------------------
procedure TROForm.C18ConnectClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
  if not C18Connected then
  with  C18Socket do begin
     Address := C18IP;
     Port := C18Port;
     Active := TRUE;
     LogEvent('Opening C18 socket '+Address+':'+IntToStr(Port)+'...');
  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.C18DisconnectClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
  if C18Connected then
  begin
   LogEvent('Closing C18 socket...');
   C18Socket.Active :=FALSE;
  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.C18SocketRead(Sender: TObject; Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
//Possible Inputs:
//Sky status:[S [C18Unknown|C18Clear|C18Cloudy|C18VeryCloudy|C18Rain]]
var
  msg :string;
  msgStrings: TStrings;
begin
  msg:=C18Sock.ReceiveText;
  Socket.SendText(msgOK);
  msgStrings:= TStringList.Create;
  try
    ParseStr(msg,msgStrings,' ');
    case msg[1] of
      'S': begin
         ClarityStatus := StrToInt(msgStrings[1]);
      end;
    end;
  finally
     msgStrings.Free;
  end;

  case ClarityStatus of
        C18Unknown: begin        // Unknown
           SkyStatLabel.Caption :='Unknown';
           SkyStatLabel.Font.Color := clRed;
           SkyStatLabel.Font.Size := 12;
        end;
        C18Clear:  begin        // Clear
           SkyStatLabel.Caption :='Clear';
           SkyStatLabel.Font.Color := clGreen;
           SkyStatLabel.Font.Size := 12;
        end;
        C18Cloudy:  begin        // Partly Cloudy
           SkyStatLabel.Caption :='Cloudy';
           SkyStatLabel.Font.Color := clMaroon;
           SkyStatLabel.Font.Size := 12;
        end;
        C18VeryCloudy:  begin        // Very Cloudy
           SkyStatLabel.Caption :='Very Cloudy';
           SkyStatLabel.Font.Color := clRed;
           SkyStatLabel.Font.Size := 12;
        end;
        C18Rain:  begin        // Rain
           SkyStatLabel.Caption :='Rain!!!';
           SkyStatLabel.Font.Color := clRed;
           SkyStatLabel.Font.Size := 18;
//           SoundAlert(SndFailure);
//           LogEvent('<- It is raining - close the dome!!!');
        end;
  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.BFocusClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
   FocusDialog.Show;
end;

//------------------------------------------------------------------------------
procedure TROForm.FocusSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
begin
      LogEvent('Focus socket activated');
      SoundAlert(SndSockConnect);
      FocusConnected          := TRUE;
      FocusSock               := FocusSocket.Socket;
      FocusConnect.Enabled    := FALSE;
      FocusDisconnect.Enabled := TRUE;
      FocusBtn.Enabled        := TRUE;
      FocusLabel.Enabled      := TRUE;
      FocusDialog.FocusLabel.Enabled := TRUE;
      FocusDialog.IterLabel.Enabled  := TRUE;
      FocusDialog.GotoButton.Enabled := TRUE;
      FocusDialog.StopButton.Enabled := TRUE;
      FocusDialog.FocusWantedVal.Enabled := TRUE;
      FocusDialog.AutoFocusButton.Enabled := TRUE;
      FocusSock.SendText('v');
//      FocusSock.SendText(FocusSendState);
      LogEvent('->Focus: ' +FocusSendState);
end;

//------------------------------------------------------------------------------
procedure TROForm.FocusSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
begin
      LogEvent('Focus socket closed.');
      SoundAlert(SndSockDisconnect);
      FocusConnected := FALSE;
      FocusConnect.Enabled    := TRUE;
      FocusDisconnect.Enabled := FALSE;
      FocusBtn.Enabled        := FALSE;
      FocusLabel.Enabled      := FALSE;
      FocusDialog.FocusLabel.Enabled := FALSE;
      FocusDialog.IterLabel.Enabled  := FALSE;
      FocusDialog.GotoButton.Enabled := FALSE;
      FocusDialog.StopButton.Enabled := FALSE;
      FocusDialog.FocusWantedVal.Enabled := FALSE;
      FocusDialog.AutoFocusButton.Enabled := FALSE;
end;

//------------------------------------------------------------------------------
procedure TROForm.FocusSocketError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
//------------------------------------------------------------------------------
begin
   LogEvent('Focus Socket Error: '+IntToStr(ErrorCode)+'. Closing socket...');
   ErrorCode :=0;
   AlertForm.AlertTxt.Caption := 'Focuser Communication Error';
   AlertForm.Show;
   FocusDisconnectClick(Sender);
end;

//------------------------------------------------------------------------------
procedure TROForm.FocusSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
var
  msg :string;
  msgStrings: TStrings;
//  size    :integer;
  dummy : string;
begin
  msg:=FocusSock.ReceiveText;
  Socket.SendText(roger);

  // Update the relevant letters - DP2009Jan
  if msg[1] in ['a','b','c','d','i','m','n','v','@'] then
    LogEvent('<-Focus: '+msg)
  else
    LogEvent('<-Focus unknown: '+msg);

  msgStrings:= TStringList.Create;
  try
    ParseStr(msg,msgStrings,' ');
    case msg[1] of
      'a': begin
         // Focuser Idle
         FocusLabel.Font.Color := clWindowText;
         FocusDialog.FocusLabel.Font.Color := clWindowText;
      end;
      'b': begin
         // Going Up
         FocusLabel.Font.Color := clAqua;
         FocusDialog.FocusLabel.Font.Color := clAqua;
      end;
      'c': begin
         // Going Down
         FocusLabel.Font.Color := clAqua;
         FocusDialog.FocusLabel.Font.Color :=  clAqua;
      end;
      'd': begin
         // Stuck
         FocusLabel.Font.Color := clRed;
         FocusDialog.FocusLabel.Font.Color := clRed;
      end;
      'v': begin
         if (msgStrings[1][1] = '+') or (msgStrings[1][1] = '-') then begin
            FocusDialog.FocusLabel.Font.Color := clAqua;
            FocusLabel.Font.Color := clAqua;
            FocusDialog.GotoButton.Enabled := FALSE;
            FocusDialog.AutoFocusButton.Enabled := FALSE;
         end else begin
            FocusDialog.FocusLabel.Font.Color := clWindowText;
            FocusLabel.Font.Color := clWindowText;
            FocusDialog.GotoButton.Enabled := TRUE;
            FocusDialog.AutoFocusButton.Enabled := TRUE;
         end;
         dummy := msgStrings.Strings[1];
         if IsInt(dummy[length(msgStrings[1])]) then begin
            FocusDialog.FocusLabel.Caption := msgStrings[1];
            FocusLabel.Caption := msgStrings[1];
         end else begin
            dummy := copy(msgStrings[1], 1, length(msgStrings[1])-1);
            FocusDialog.FocusLabel.Caption := dummy;
            FocusLabel.Caption := dummy;
         end;
//         // Send back 'roger'
//         FocusSock.SendText('@');
      end;
      'i': begin
         FocusDialog.IterLabel.Caption := msgStrings[1];
//         // Send back 'roger'
//         FocusSock.SendText('@');
      end;
    end;
  finally
     msgStrings.Free;
  end;

end;

//------------------------------------------------------------------------------
procedure TROForm.FocusConnectClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
  if not FocusConnected then
  with  FocusSocket do begin
     Address :=FocusIP;
     Port :=FocusPort;
     Active :=TRUE;
     LogEvent('Opening Focus socket '+Address+':'+IntToStr(Port)+'...');
  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.FocusDisconnectClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
  if  FocusConnected then
  begin
   LogEvent('Closing Focus socket...');
   FocusSocket.Active :=FALSE;
  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.GoFocus(Sender: TObject; FocusVal: Integer);
//------------------------------------------------------------------------------
begin
   FocusSock.SendText('l ' + IntToStr(FocusVal));
end;

//------------------------------------------------------------------------------
procedure TROForm.StopFocus(Sender: TObject);
//------------------------------------------------------------------------------
begin
   FocusSock.SendText('n');
end;


// METEOROLOGY - by David 22/3/2009 //
//------------------------------------------------------------------------------
procedure TROForm.WeatherSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
begin
      LogEvent('Weather socket activated');
      SoundAlert(SndSockConnect);
      WeatherConnected          := TRUE;
      WeatherSock               := WeatherSocket.Socket;
      WeatherConnect.Enabled    := FALSE;
      WeatherDisconnect.Enabled := TRUE;
      MeteorologyMnu.Enabled    := TRUE;
      WeatherBtn.Enabled        := TRUE;

      Wise_Meteorology.TemperatureE.Text := 'Unknown';
      Wise_Meteorology.PressureE.Text := 'Unknown';
      Wise_Meteorology.HumidityE.Text := 'Unknown';
      Wise_Meteorology.WindSpeedE.Text := 'Unknown';
      Wise_Meteorology.WindDirE.Text := 'Unknown';
      Wise_Meteorology.TemperatureE.Font.Color := clRed;
      Wise_Meteorology.PressureE.Font.Color := clRed;
      Wise_Meteorology.HumidityE.Font.Color := clRed;
      Wise_Meteorology.WindSpeedE.Font.Color := clRed;
      Wise_Meteorology.WindDirE.Font.Color := clRed;
end;

//------------------------------------------------------------------------------
procedure TROForm.WeatherSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
begin
      LogEvent('Weather socket closed.');
      SoundAlert(SndSockDisconnect);
      WeatherConnected := FALSE;
      WeatherConnect.Enabled    := TRUE;
      WeatherDisconnect.Enabled := FALSE;
      MeteorologyMnu.Enabled    := FALSE;
      WeatherBtn.Enabled        := FALSE;
end;

//------------------------------------------------------------------------------
procedure TROForm.WeatherSocketError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
//------------------------------------------------------------------------------
begin
   LogEvent('Weather Socket Error: '+IntToStr(ErrorCode)+'. Closing socket...');
   ErrorCode :=0;
   AlertForm.AlertTxt.Caption := 'Weather Communication Error';
   AlertForm.Show;
   FocusDisconnectClick(Sender);
end;

//------------------------------------------------------------------------------
procedure TROForm.WeatherSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
//------------------------------------------------------------------------------
var
  msg :string;
  msgStrings: TStrings;
//  size    :integer;
//  dummy : string;
begin
  msg:=WeatherSock.ReceiveText;
  Socket.SendText(roger);

  // Update the relevant letters - DP2009Jan
  if msg[1] in ['#'] then
    LogEvent('<-Weather: '+msg)
  else
    LogEvent('<-Focus unknown: '+msg);

  msgStrings:= TStringList.Create;
  try
    ParseStr(msg,msgStrings,' ');
    case msg[1] of
      '#': begin
         // Update Weather data
         Wise_Meteorology.TemperatureE.Text := msgStrings.Strings[2];
         Wise_Meteorology.HumidityE.Text :=  msgStrings.Strings[5];
         Wise_Meteorology.PressureE.Text :=  msgStrings.Strings[7];
         Wise_Meteorology.WindSpeedE.Text :=  msgStrings.Strings[8];
         Wise_Meteorology.WindDirE.Text :=  msgStrings.Strings[9];

         Wise_Meteorology.TemperatureE.Font.Color := clWindowText;
         Wise_Meteorology.PressureE.Font.Color := clWindowText;
         Wise_Meteorology.HumidityE.Font.Color := clWindowText;
         Wise_Meteorology.WindSpeedE.Font.Color := clWindowText;
         Wise_Meteorology.WindDirE.Font.Color := clWindowText;
      end;
    end;
  finally
     msgStrings.Free;
  end;

  analizeWeather(Sender);

end;

//------------------------------------------------------------------------------
procedure TROForm.WeatherConnectClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
  if not WeatherConnected then
  with  WeatherSocket do begin
     Address :=WeatherIP;
     Port :=WeatherPort;
     Active :=TRUE;
     LogEvent('Opening Weather socket '+Address+':'+IntToStr(Port)+'...');
  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.WeatherDisconnectClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
  if  WeatherConnected then
  begin
   LogEvent('Closing Weather socket...');
   WeatherSocket.Active :=FALSE;
  end;
end;

//------------------------------------------------------------------------------
procedure TROForm.analizeWeather(Sender: TObject);
//------------------------------------------------------------------------------
begin
   if (StrToInt(Wise_Meteorology.HumidityE.Text) > 84) then begin
      LogEvent('High Humidity: '+Wise_Meteorology.HumidityE.Text);
      Wise_Meteorology.HumidityE.Font.Color := clRed;
      SoundAlert(SndFailure);
      AlertForm.AlertTxt.Caption := 'High Humidity: '+Wise_Meteorology.HumidityE.Text;
      AlertForm.Show;
   end else begin
      Wise_Meteorology.HumidityE.Font.Color := clWindowText;
   end;
   if (StrToFloat(Wise_Meteorology.WindSpeedE.Text) > 40) then begin
      LogEvent('Fast Wind: '+Wise_Meteorology.WindSpeedE.Text);
      Wise_Meteorology.WindSpeedE.Font.Color := clRed;
      SoundAlert(SndFailure);
      AlertForm.AlertTxt.Caption := 'Fast Wind: '+Wise_Meteorology.WindSpeedE.Text;
      AlertForm.Show;
   end else begin
      Wise_Meteorology.WindSpeedE.Font.Color := clWindowText;
   end;
end;

//------------------------------------------------------------------------------
procedure TROForm.Meteorology1Click(Sender: TObject);
//------------------------------------------------------------------------------
begin
  MeteorologyMnu.Checked := not MeteorologyMnu.Checked;
  Wise_Meteorology.Visible := MeteorologyMnu.Checked;
end;

//------------------------------------------------------------------------------
procedure TROForm.WeatherBtnClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
   Meteorology1Click(Sender);
end;

//------------------------------------------------------------------------------
procedure TROForm.PosComboChange(Sender: TObject);
//------------------------------------------------------------------------------

Begin
   Case PosCombo.ItemIndex of
   0: begin  //Zenith Park
    Tabs.ActivePage := TabHA;
    HAHA.Text := '00:00:00.0';
    HADec.Text := CoordR2Str(SiteNorthLat);
   end;
   1: begin  //Mirror Cover Park
    Tabs.ActivePage := TabHA;
    HAHA.Text := '00:00:00.0';
    HADec.Text := '88:00:00';
   end;
   2: begin  //Dome Flat Park
    Tabs.ActivePage := TabHA;
    HAHA.Text := '-01:35:59.0';
    HADec.Text := '+41:59:20.0';
   end;
   3: begin  //Sky Flat Position
    Tabs.ActivePage := TabRA;
    RARA.Text := STEdit.Text;
    RADec.Text := CoordR2Str(SiteNorthLat);
   end;
   4: begin  //Open/Close Dome Position
    Tabs.ActivePage := TabHA;
    HAHA.Text := '00:00:00.0';
    HADec.Text := '60:00:00.0';
   end;

   end;
End;

procedure TROForm.Button1Click(Sender: TObject);
begin
     LAIWOGuiderConnect.Click ;
end;

procedure TROForm.rcServerSocketClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
  Reply:   string;
  Request: string;
const
  fieldSep:  string = '@';
  recordSep: string = ';';
  crlf:      string = #10#13;
begin
   if Socket.ReceiveLength > 0 then begin
     Request := Socket.ReceiveText;

     if AnsiStartsStr('get-fits-keywords', Request) then begin

       Reply :=               Format('OBJNAME%s%s',    [fieldSep, RATarget.Text])
                + recordSep + Format('EXPTIME%s%s',    [fieldSep, CamExp.Cells[0,1]]);

       if hostname = 'mizpe-cdr' then begin
         Reply := Reply
                + recordSep + Format('RA%s%%s',        [fieldSep, RAEdit.Text])
                + recordSep + Format('DEC%s%%s',       [fieldSep, DecEdit.Text])
                + recordSep + Format('EQUINOX%s%s',    [fieldSep, EpochEdit.Text])
                + recordSep + Format('AIRMASS%s%s',    [fieldSep, AMEdit.Text]);
       end else begin
         Reply := Reply
                + recordSep + Format('RA%s%s',         [fieldSep, RARA.Text])
                + recordSep + Format('DEC%s%s',        [fieldSep, RADec.Text])
                + recordSep + Format('EQUINOX%s%0.1f', [fieldSep, Epochnow])
                + recordSep + Format('AIRMASS%s%0.1f', [fieldSep, AMNow]);
       end;
       Reply := Reply + crlf;

       Socket.SendText(Reply);
     end;
   end;
end;

end.


