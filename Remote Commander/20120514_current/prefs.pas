unit Prefs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls, Spin, ExtCtrls, ImgList, Buttons,
  ShlObj, ScktComp;

type
  TPrefsForm = class(TForm)
    Button1: TButton;
    CancelBtn: TButton;
    BtnApply: TButton;
    PrefsFileDlg: TOpenDialog;
    PrefsTab: TPageControl;
    PrefComm: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    TeleIPME: TMaskEdit;
    DomeIPMe: TMaskEdit;
    TekIPME: TMaskEdit;
    FWIPMe: TMaskEdit;
    TekTempIPMe: TMaskEdit;
    FWPortE: TEdit;
    TekTempPortE: TEdit;
    TekPortE: TEdit;
    DomePortE: TEdit;
    TelePortE: TEdit;
    MicIPME: TMaskEdit;
    GroupBox3: TGroupBox;
    NetMeetOption0R: TRadioButton;
    NetMeetOption1R: TRadioButton;
    NetMeetPathE: TEdit;
    NetMeetPathBtn: TBitBtn;
    PrefExtrn: TTabSheet;
    TabSheet4: TTabSheet;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    LisPathE: TLabeledEdit;
    SpinEdit1: TSpinEdit;
    CheckBox1: TCheckBox;
    Edit7: TEdit;
    Edit6: TEdit;
    RadioButton2: TRadioButton;
    RadioButton1: TRadioButton;
    LisPathBtn: TBitBtn;
    GroupBox2: TGroupBox;
    FchartPathE: TLabeledEdit;
    FchartExtnE: TLabeledEdit;
    FchartPathBtn: TBitBtn;
    GroupBox5: TGroupBox;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    GroupBox6: TGroupBox;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit9: TMaskEdit;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    MaskEdit11: TMaskEdit;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    GroupBox4: TGroupBox;
    BrowserOption0R: TRadioButton;
    BrowserOption2R: TRadioButton;
    BrowserPathE: TEdit;
    BrowserPathBtn: TBitBtn;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    CheckBox4: TCheckBox;
    BrowserOption1R: TRadioButton;
    GroupBox7: TGroupBox;
    ImgViewerOption0R: TRadioButton;
    ImgViewerOption1R: TRadioButton;
    ImgViewerPathE: TEdit;
    ImgViewerPathBtn: TBitBtn;
    TabSheet1: TTabSheet;
    ListBox1: TListBox;
    VolumeGroup: TGroupBox;
    VolumeLeftTB: TTrackBar;
    VolumeRightTB: TTrackBar;
    VolumLeftMute: TCheckBox;
    VolumRightMute: TCheckBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    SameVolume: TCheckBox;
    BitBtn1: TBitBtn;
    ComboBox1: TComboBox;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure RemotePrefsModified(Sender: TObject);
    procedure PrefsDirSelect(Sender: TObject);
    function ChooseFolder(const Title: string): string;
    procedure BtnApplyClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure PathBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure UpdateSock(Sc : TClientSocket; IP: string; Port: integer);
    procedure VolumeTBChange(Sender: TObject);
    procedure VolumMuteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrefsForm: TPrefsForm;

implementation

{$R *.dfm}

uses WiseConst, main;
procedure TPrefsForm.FormCreate(Sender: TObject);
begin
     TeleIPME.Text  := ScopePcIP;
     TelePortE.Text := IntToStr(ScopePcPort);
     TekIPME.Text   := PMISIP;
     TekPortE.Text  := IntToStr(PMISPort);
     FWIPMe.Text    := FilterPcIP;
     FWPortE.Text   := IntToStr(FilterPcPort);
     TekTempIPMe.Text := CCDTempIP;
     TekTempPortE.Text:= IntToStr(CCDTempPort);
     DomeIPMe.Text  := DomePcIP;
     DomePortE.Text := IntToStr(DomePcPort);
     MicIPME.Text   := MicIP;

     LisPathE.Text    :=LisPath;
     FchartPathE.Text := FchartPath;
     FchartExtnE.Text :=  FchartExtn;
     case BrowserOption of
          0: BrowserOption0R.Checked := TRUE;
          1: BrowserOption1R.Checked := TRUE;
          2: BrowserOption2R.Checked := TRUE;
     end;
     case NetMeetOption of
          0: NetMeetOption0R.Checked := TRUE;
          1: NetMeetOption1R.Checked := TRUE;
     end;
     case ImgViewerOption of
          0: ImgViewerOption0R.Checked := TRUE;
          1: ImgViewerOption1R.Checked := TRUE;
     end;
end;

procedure TPrefsForm.RemotePrefsModified(Sender: TObject);
begin
     BtnApply.Enabled := TRUE;
//INTERNET BROWSER OPTIONS:
     if (Sender = BrowserOption2R) then begin
         BrowserPathE.Enabled   := TRUE;
         BrowserPathBtn.Enabled := TRUE;
         BrowserPathE.Color     := clWhite;
     end else if (Sender = BrowserOption0R) OR (Sender = BrowserOption1R) then begin
         BrowserPathE.Enabled   := FALSE;
         BrowserPathBtn.Enabled := FALSE;
         BrowserPathE.Color     := cl3DLight;
     end;
//NETMEETING OPTIONS:
     if (Sender = NetMeetOption0R) then begin
         NetMeetPathE.Enabled   := FALSE;
         NetMeetPathBtn.Enabled := FALSE;
         NetMeetPathE.Color     := cl3DLight;
     end else if (Sender = NetMeetOption1R) then begin
         NetMeetPathE.Enabled   := TRUE;
         NetMeetPathBtn.Enabled := TRUE;
         NetMeetPathE.Color     := clWhite;
     end;

//Image Viewer OPTIONS:
     if (Sender = ImgViewerOption0R) then begin
         ImgViewerPathE.Enabled   := FALSE;
         ImgViewerPathBtn.Enabled := FALSE;
         ImgViewerPathE.Color     := cl3DLight;
     end else if (Sender = ImgViewerOption1R) then begin
         ImgViewerPathE.Enabled   := TRUE;
         ImgViewerPathBtn.Enabled := TRUE;
         ImgViewerPathE.Color     := clWhite;
     end;
end;

procedure TPrefsForm.PrefsDirSelect(Sender: TObject);
begin
    if (Sender = LisPathBtn) then
      LisPAthE.Text := ChooseFolder('hello')
    else if (Sender = FchartPathBtn) then
      FchartPathE.Text := ChooseFolder('hello')
end;

function TPrefsForm.ChooseFolder(const Title: string): string;
var
 Path: array [0..MAX_PATH] of char;
 pidl: PItemIDList;
 bi: TBrowseInfo;
begin
 result := '';
 with bi do
 begin
   hwndOwner := Handle;
   pidlRoot  := nil;
   pszDisplayName := Path;
   lpszTitle := PChar(Title);
   ulFlags := BIF_RETURNONLYFSDIRS;
   lpfn := nil;
   lParam := 0;
 end;
 pidl := ShBrowseForFolder(bi);
 if (pidl <> nil) and (SHGetPathFromIDList(pidl, path)) then
   result := path;
// CoTaskMemFree(pidl);
end;

procedure TPrefsForm.BtnApplyClick(Sender: TObject);
begin
//Update Sockets
  if (TeleIPME.Text <> ScopePcIP) OR
     (StrToIntDef(TelePortE.Text,0) <> ScopePcPort) then begin
     ScopePcPort := StrTOIntDef(TelePortE.Text,0);
     ScopePcIP   := TeleIPME.Text;
     UpdateSock(ROForm.ScopeSocket,ScopePcIP,ScopePcPort);
  end;

  if (TekIPME.Text <> PMISIP) OR
     (StrToIntDef(TekPortE.Text,0) <> PMISPort) then begin
     PMISPort := StrTOIntDef(TekPortE.Text,0);
     PMISIP   := StringReplace(TekIPME.Text,' ','',[rfReplaceAll]);
     if (ROForm.PMISSocket.Active) then begin
         ROForm.PMISDisconnectClick(Sender);
         ROForm.PMISConnectClick(Sender);
     end;
  end;
  if (TeleIPME.Text <> ScopePcIP) OR
     (StrToIntDef(TelePortE.Text,0) <> ScopePcPort) then begin
     ScopePcPort := StrTOIntDef(TelePortE.Text,0);
     ScopePcIP   := TeleIPME.Text;
     if (ROForm.ScopeSocket.Active) then begin
         ROForm.ScopeDisconnectClick(Sender);
         ROForm.ScopeConnectClick(Sender);
     end;
  end;
  if (FWIPME.Text <> FilterPcIP) OR
     (StrToIntDef(FWPortE.Text,0) <> FilterPcPort) then begin
     FilterPcPort := StrTOIntDef(FWPortE.Text,0);
     FilterPcIP   := FWIPME.Text;
     if (ROForm.FilterSocket.Active) then begin
         ROForm.FWDisconnectClick(Sender);
         ROForm.InitFilters(Sender);
     end;
  end;
  if (TekTempIPME.Text <> CCDTempIP) OR
     (StrToIntDef(TekTempPortE.Text,0) <> CCDTempPort) then begin
     CCDTempPort := StrTOIntDef(TekTempPortE.Text,0);
     CCDTempIP   := TekTempIPME.Text;
     if (ROForm.PMISSocket.Active) then begin
         ROForm.CCDTempDisconnectClick(Sender);
         ROForm.CCDTempConnectClick(Sender);
     end;
  end;
  if (DomeIPME.Text <> DomePcIP) OR
     (StrToIntDef(DomePortE.Text,0) <> DomePcPort) then begin
     DomePcPort := StrTOIntDef(DomePortE.Text,0);
     DomePcIP   := DomeIPME.Text;
     if (ROForm.DomeSocket.Active) then begin
         ROForm.DomeDisconnectClick(Sender);
         ROForm.InitDome(Sender);
     end;
  end;

//Update Browser options
  if (BrowserOption0R.Checked) then
     BrowserOption :=0
  else if (BrowserOption1R.Checked) then
     BrowserOption :=1
  else if (BrowserOption2R.Checked) then begin
     if not(FileExists(BrowserPathE.Text)) then  begin
        showmessage('Internet Browser: You specify a valid program!');
        exit;
     end else
        BrowserPath := BrowserPathE.Text;
     BrowserOption :=2;
  end;

  if (ImgViewerOption0R.Checked) then
     ImgViewerOption :=0
  else if (ImgViewerOption1R.Checked) then begin
     if not(FileExists(ImgViewerPathE.Text)) then  begin
        showmessage('Image Viewer: You must specify a valid program!');
        exit;
     end else
        ImgViewerPath := ImgViewerPathE.Text;
     ImgViewerOption :=1;
  end;

  if (FchartPathE.Text<>FchartPath) then
        FchartPath := FchartPathE.Text;

  BtnApply.Enabled :=FALSE;
end;

procedure TPrefsForm.Button1Click(Sender: TObject);
begin
   if BtnApply.Enabled then
      BtnApplyClick(Sender);
   Self.Hide;
end;

procedure TPrefsForm.PathBtnClick(Sender: TObject);
begin
    if PrefsFileDlg.Execute then begin
        if (Sender = BrowserPathBtn) then
                BrowserPathE.Text:=PrefsFileDlg.FileName
        else if (Sender = ImgViewerPathBtn) then
                ImgViewerPathE.Text:=PrefsFileDlg.FileName
        else if (Sender = NetMeetPathBtn) then
                NetMeetPathE.Text:=PrefsFileDlg.FileName;
    end;
end;

procedure TPrefsForm.FormShow(Sender: TObject);
begin
     BtnApply.Enabled :=FALSE;
end;

procedure TPrefsForm.CancelBtnClick(Sender: TObject);
begin
    Self.Hide;
end;


procedure TPrefsForm.UpdateSock(Sc : TClientSocket; IP: string; Port: integer);
var
 ScOpen : Boolean;
begin
   ScOpen := False;
   if Sc.Active then begin
      ScOpen := TRUE;
      if MessageDlg('Socket active. Close?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
         exit;
   end;
   Sc.Close;
   Sc.Port := Port;
   SC.Address := IP;
   if ScOpen then
      Sc.Open;
end;

procedure TPrefsForm.VolumeTBChange(Sender: TObject);
begin
    if (SameVolume.Checked) then
       if (Sender = VolumeLeftTB) then
           VolumeRightTB.Position := VolumeLeftTB.Position
       else if (Sender = VolumeRightTB) then
           VolumeLeftTB.Position := VolumeRightTB.Position;

end;

procedure TPrefsForm.VolumMuteClick(Sender: TObject);
begin
  if (SameVolume.Checked) then
    if (Sender = VolumLeftMute) then
         VolumRightMute.Checked := VolumLeftMute.Checked
    else if (Sender = VolumRightMute) then
         VolumLeftMute.Checked := VolumRightMute.Checked;

  VolumeLeftTB.Enabled  := not VolumLeftMute.Checked;
  VolumeRightTB.Enabled := not VolumRightMute.Checked;
end;

end.
