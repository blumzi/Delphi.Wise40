unit SiteInformation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils, Math, DateUtils;

type
  TSiteInfo = class(TForm)
    Close: TButton;
    LabelEvening: TLabel;
    LabelMorning: TLabel;
    SetE: TLabel;
    RiseM: TLabel;
    Label00: TLabel;
    Label06: TLabel;
    CivilM: TLabel;
    CivilE: TLabel;
    NautE: TLabel;
    NautM: TLabel;
    Label12: TLabel;
    Label18: TLabel;
    AstroM: TLabel;
    AstroE: TLabel;
    LabelMoon2: TLabel;
    Moon1E: TLabel;
    TwilightDate: TLabel;
    LabelLong: TLabel;
    LabelLat: TLabel;
    LabelAlt: TLabel;
    ESiteName: TLabel;
    ESiteLong: TLabel;
    EsiteLat: TLabel;
    EsiteAlt: TLabel;
    LabelMoon1: TLabel;
    Moon2E: TLabel;
    procedure UpdateTwilights(Sender: TObject);
    procedure CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SiteInfo: TSiteInfo;

implementation

{$R *.dfm}
uses WiseConst,Time_Coord, TelePars, WiseStr;
////////////////////////////////////////////////////////////////////////////////
procedure TSiteInfo.UpdateTwilights(Sender: TObject);
const
 Days: array [0..6] of string =('Sun', 'Mon', 'Tue', 'Wed', 'Thu','Fri','Sat');
 Months: array [1..12] of string =('Jan', 'Fab', 'Mar', 'Apr', 'May','Jun','Jul',
                                   'Aug', 'Sep', 'Oct', 'Nov', 'Dec');
Var
 T, Tss, Tsr: TDateTime;
 Ts: TSystemTime;
 JD, MoonAltSS, MoonAlt, MoonRA, MoonDec: extended;
begin
  Ts := UTNow;
  T  := SystemTimeToDateTime(Ts);
  JD := CalcJD(Ts);

//If already dark, Start with tonight's evening
  while (CalcSunAltAz(JD, CalcST(JD,SiteEastLong,1), SiteNorthLat).B<=0) do begin
    T  := IncHour(T,-1);
    DateTimeToSystemTime(T,Ts);
    JD := CalcJD(Ts);
  end;
 SiteInfo.Caption := Format('%s, %d %s %d',[Days[Ts.wDayofWeek],
                                 Ts.wDay,Months[Ts.wMonth],Ts.wYear]);
//Sun Set
  repeat
    T  := IncHour(T,1);
    DateTimeToSystemTime(T,Ts);
    JD := CalcJD(Ts);
  until CalcSunAltAz(JD, CalcST(JD,SiteEastLong,1), SiteNorthLat).B<=0;
    T  := IncHour(T,-1);
  repeat
    T  := IncMinute(T,1);
    DateTimeToSystemTime(T,Ts);
    JD := CalcJD(Ts);
  until CalcSunAltAz(JD, CalcST(JD,SiteEastLong,1), SiteNorthLat).B<=0;
  Tss := T;
  SetE.Caption := Format('%5s',[LeftStr(Time2Str(Ts),5)]);
//Civil Twilight
  repeat
    T  := IncMinute(T,1);
    DateTimeToSystemTime(T,Ts);
    JD := CalcJD(Ts);
  until CalcSunAltAz(JD, CalcST(JD,SiteEastLong,1), SiteNorthLat).B<=DegToRad(-6.0);
  CivilE.Caption := Format('%5s',[LeftStr(Time2Str(Ts),5)]);
//Nautical Twilight
  repeat
    T  := IncMinute(T,1);
    DateTimeToSystemTime(T,Ts);
    JD := CalcJD(Ts);
  until CalcSunAltAz(JD, CalcST(JD,SiteEastLong,1), SiteNorthLat).B<=DegToRad(-12.0);
  NautE.Caption := Format('%5s',[LeftStr(Time2Str(Ts),5)]);
//Astronomical Twilight
  repeat
    T  := IncMinute(T,1);
    DateTimeToSystemTime(T,Ts);
    JD := CalcJD(Ts);
  until CalcSunAltAz(JD, CalcST(JD,SiteEastLong,1), SiteNorthLat).B<=DegToRad(-18.0);
  AstroE.Caption := Format('%5s',[LeftStr(Time2Str(Ts),5)]);


//Astronomical Twilight
  repeat
    T  := IncHour(T,1);
    DateTimeToSystemTime(T,Ts);
    JD := CalcJD(Ts);
  until CalcSunAltAz(JD, CalcST(JD,SiteEastLong,1), SiteNorthLat).B>=DegToRad(-18.0);
    T  := IncHour(T,-1);
  repeat
    T  := IncMinute(T,1);
    DateTimeToSystemTime(T,Ts);
    JD := CalcJD(Ts);
  until CalcSunAltAz(JD, CalcST(JD,SiteEastLong,1), SiteNorthLat).B>=DegToRad(-18.0);
  AstroM.Caption := Format('%5s',[LeftStr(Time2Str(Ts),5)]);
//Morning Nautical Twilight
  repeat
    T  := IncMinute(T,1);
    DateTimeToSystemTime(T,Ts);
    JD := CalcJD(Ts);
  until CalcSunAltAz(JD, CalcST(JD,SiteEastLong,1), SiteNorthLat).B>=DegToRad(-12.0);
  NautM.Caption := Format('%5s',[LeftStr(Time2Str(Ts),5)]);
//Morning Civil Twilight
  repeat
    T  := IncMinute(T,1);
    DateTimeToSystemTime(T,Ts);
    JD := CalcJD(Ts);
  until CalcSunAltAz(JD, CalcST(JD,SiteEastLong,1), SiteNorthLat).B>=DegToRad(-6.0);
  CivilM.Caption := Format('%5s',[LeftStr(Time2Str(Ts),5)]);
//Sun Rise
  repeat
    T  := IncMinute(T,1);
    DateTimeToSystemTime(T,Ts);
    JD := CalcJD(Ts);
  until CalcSunAltAz(JD, CalcST(JD,SiteEastLong,1), SiteNorthLat).B>=0;
  Tsr := T;
  RiseM.Caption := Format('%5s',[LeftStr(Time2Str(Ts),5)]);


//MoonEvent #1:
  LabelMoon1.Visible := FALSE;
  LabelMoon2.Visible := FALSE;
  Moon1E.Visible     := FALSE;
  Moon2E.Visible     := FALSE;

  T:= IncMinute(Tss,-1);
  DateTimeToSystemTime(T,Ts);
  JD := CalcJD(Ts);
  CalcMoonPos(JD, CalcST(JD,SiteEastLong,1), SiteNorthLat, MoonRA, MoonDec, MoonAltSS);
  if (Abs(MoonAltSS) < 0.0001) then begin
    T:= IncMinute(Tss,-1);
    DateTimeToSystemTime(T,Ts);
    JD := CalcJD(Ts);
    CalcMoonPos(JD, CalcST(JD,SiteEastLong,1), SiteNorthLat, MoonRA, MoonDec, MoonAltSS);
  end;

  repeat
    T  := IncHour(T,1);
    DateTimeToSystemTime(T,Ts);
    JD := CalcJD(Ts);
    CalcMoonPos(JD, CalcST(JD,SiteEastLong,1), SiteNorthLat, MoonRA, MoonDec, MoonAlt);
  until ( (MoonAltSS*MoonAlt<=0) OR (T>=Tsr) );
    T  := IncHour(T,-1);
  repeat
    T  := IncMinute(T,1);
    DateTimeToSystemTime(T,Ts);
    JD := CalcJD(Ts);
    CalcMoonPos(JD, CalcST(JD,SiteEastLong,1), SiteNorthLat, MoonRA, MoonDec, MoonAlt);
  until  ( (MoonAltSS*MoonAlt<=0) OR (T>=Tsr) );

  if ((MoonAltSS*MoonAlt)<=0) then begin
     if (MoonAltSS<0) OR (MoonAlt >0) then
        LabelMoon1.Caption := 'Moon Rise'
     else
        LabelMoon1.Caption := 'Moon Rise';
     Moon1E.Caption     := Format('%5s',[LeftStr(Time2Str(Ts),5)]);
     LabelMoon1.Visible := TRUE;
     Moon1E.Visible     := TRUE;
  end;

//MoonEvent #2:
  T  := IncMinute(T,30);
  DateTimeToSystemTime(T,Ts);
  JD := CalcJD(Ts);
  CalcMoonPos(JD, CalcST(JD,SiteEastLong,1), SiteNorthLat, MoonRA, MoonDec, MoonAltSS);

  repeat
    T  := IncHour(T,1);
    DateTimeToSystemTime(T,Ts);
    JD := CalcJD(Ts);
    CalcMoonPos(JD, CalcST(JD,SiteEastLong,1), SiteNorthLat, MoonRA, MoonDec, MoonAlt);
  until ( (MoonAltSS*MoonAlt<=0) OR (T>=Tsr) );
    T  := IncHour(T,-1);
  repeat
    T  := IncMinute(T,1);
    DateTimeToSystemTime(T,Ts);
    JD := CalcJD(Ts);
    CalcMoonPos(JD, CalcST(JD,SiteEastLong,1), SiteNorthLat, MoonRA, MoonDec, MoonAlt);
  until  ( (MoonAltSS*MoonAlt<=0) OR (T>=Tsr) );

  if ((MoonAltSS*MoonAlt)<=0) then begin
     if (MoonAltSS<0) OR (MoonAlt >0) then
        LabelMoon2.Caption := 'Moon Rise'
     else
        LabelMoon2.Caption := 'Moon Rise';
     Moon2E.Caption     := Format('%5s',[LeftStr(Time2Str(Ts),5)]);
     LabelMoon2.Visible := TRUE;
     Moon2E.Visible     := TRUE;
  end;




end;

////////////////////////////////////////////////////////////////////////////////
procedure TSiteInfo.CloseClick(Sender: TObject);
begin
    Self.Hide;
end;

procedure TSiteInfo.FormCreate(Sender: TObject);
begin
  ESiteName.Caption := SiteName;
  ESiteLong.Caption := Format('%0.3f°',[RadToDeg(SiteEastLong)]);
  ESiteLat.Caption  := Format('%0.3f°',[RadToDeg(SiteNorthLat)]);
  ESiteAlt.Caption  :=Format('%0.1fm',[SiteGeodAlt]);
end;

end.
