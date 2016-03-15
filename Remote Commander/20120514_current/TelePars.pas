unit TelePars;
//******************************************************************************
// UNIT NAME         TelePars
// USED BY PROJECTS  TelescopeAgent
// AUTHOR            Yiftah Lipkin
// DESCRIPTION       Various Telescope and Site paraemters
// LAST MODIFIED     2004 Apr 02
//******************************************************************************

interface
uses Windows;

const
//Site Parameters
 SiteName         :string = 'Wise Observatory';
 SiteEastLong     :real   = 0.606714554348564;//+34:45:43.86;
 SiteNorthLat     :real   = 0.534024354440983; //+30:35:50.43;
 //Note Geocentroc latitude is : 0.5310862517367
 SiteGeodAlt      :real   = 882.9;   //m
 Datum            :string = 'WGS84';
 //TimeZone       :Integer = +2;
 //DayLightSaving :Integer = 0;

//Setting Safety Constants
 AltLimit0        : real = 0.34907;  //[rad] 20deg; Do not allow TeleMove below this value
 AMLimit0 : integer = 9;                     // Absolute AM Limit. Must be smaller than 9.9, the uppper limit of CalcAM
 DefaultAMLimit0      = 2.9;                   // Default AM limit

var
//Telescope Variables
 UTnow, LTnow     : _SYSTEMTIME;
 STnow, JDnow, Epochnow, AMnow, AltNow, Aznow : extended;
 SunAlt, MoonAlt, MoonIllum, MoonRA, MoonDec, MoonDist : extended;
 TargetRA, TargetDec, TargetHA, TargetEpoch, TargetAlt, TargetAz, TargetAM, TargetDomeAz: extended;  //Teaget coordinates [rad]
 CoordOK          : Boolean = FALSE;  //Is input Data in RA/HA/Offset window valid?
 ScopeHA          : extended;
 ScopeRA          : extended;
 ScopeDec         : extended;

//Setting Safety Parameters
 AltLimit        : real;   //[rad]; Do not allow TeleMove below this value
 AMLimit         : integer;                     // Absolute AM Limit. Must be smaller than 9.9, the uppper limit of CalcAM
 DefaultAMLimit  : real;                   // Default AM limit


implementation

end.
