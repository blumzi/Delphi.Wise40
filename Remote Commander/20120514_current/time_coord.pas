unit Time_Coord;
//******************************************************************************
// UNIT NAME         Time_Coord
// USED BY PROJECTS  RemoteCommander, TelescopeAgent
// AUTHOR            Yiftah Lipkin
// DESCRIPTION       Time and Coordinate Conversion Routines
// LAST MODIFIED     2003 Oct 01
//******************************************************************************

interface

uses
  Math, Windows, TelePars;

Type
LBR = record
        L: extended;
        B: extended;
        R: extended;
end;

//1-----------------------------------------------------------------------------
  function CalcST(JD:extended; EastLong:extended; STType:integer): extended;
//2-----------------------------------------------------------------------------
  function CalcJD(date:_SYSTEMTIME): extended;
//3-----------------------------------------------------------------------------
  function CalcEpoch(JD:extended): extended;
//4-----------------------------------------------------------------------------
  function CalcAM(alt:extended): extended;
//5-----------------------------------------------------------------------------
  procedure CalcAltAz(RA:extended; Dec: extended; ST: extended; Lat: extended; var Alt: extended; var Az: extended);
//6-----------------------------------------------------------------------------
  procedure CalcAltAz_HA(HA:extended; Dec: extended; Lat: extended; var Alt: extended; var Az: extended);
//7--------------------------------------------------------------- -------------
  procedure CalcMoonPos(JD: extended; ST: extended; Lat: extended; var RA: extended; var Dec: extended; Var Alt: extended);
//8-----------------------------------------------------------------------------
  function SphereDist(Long1:extended; Lat1:extended; Long2:extended; Lat2:extended): extended;
//9-----------------------------------------------------------------------------
  function CalcMoonIllumFrac(JD:extended): extended;
//10----------------------------------------------------------------------------
  function CalcSunAltAz(JD: extended; ST: extended; Lat: extended):LBR;
//11----------------------------------------------------------------------------
  function CalcDomePos(HA, Az, Alt : extended):extended;
//12----------------------------------------------------------------------------
  procedure CalcPrecession(Equinoxin, Equinoxout, RAIn, DecIn: extended; out RAOut, DecOut: extended);
//13----------------------------------------------------------------------------
  procedure CalcNutation(EquinoxIn, RAIn, DecIn: extended; out RAOut, DecOut: extended);
//14----------------------------------------------------------------------------
  procedure CalcAbberation(JD,RA, Dec :extended; out dRA, dDec: extended);
//15----------------------------------------------------------------------------
//  procedure CalcRefraction(T,P,RH, Z, HA, Dec, Lat :extended; out Ref, dRA, dDec: extended);
//DEGUG
  procedure CalcRefraction(T,P,RH, Z, HA, Dec, Lat :extended; out  dRA, dDec, Ref, C: extended);
//16----------------------------------------------------------------------------
function Epoch2JD(epoch : extended):extended;

implementation

type
    Matrix = array[1..3] of array[1..3] of extended;

const
    SEC_IN_MIN             : extended  = 60.0;
    SEC_IN_HOUR            : extended  = 3600.0;
    ARCSEC_IN_DEG          : extended  = 3600.0;
    SEC_IN_DAY             : extended  = 86400.0;
    JD2000                 : extended  = 2451545.0;
    DAYS_IN_JULIAN_CENTURY : extended  = 36525.0;
    RADIAN                 : extended  = 57.29577951308232;  //[deg] degrees in 1rad
    MEAN_SOLAR_DAY         : extended  = 1.00273790935;
    MEAN_SIDEREAL_DAY      : extended  = 0.99726956633;
    ASTRONOMICAL_UNIT      : extended  = 149597870;      // km 1au

//********************PRIVATE FUNCTIONS*****************************************
//P1----------------------------------------------------------------------------
  function Obliquity(JD:extended): extended; forward;
//P2----------------------------------------------------------------------------
  procedure PrecessCoord(EquinoxJDin, EquinoxJDout: extended;
            DirVec: array of extended; out OutDirVec: array of extended); forward;
//P3----------------------------------------------------------------------------
  procedure Spherical2CosineDirection(RA,Dec : extended; out Vec: array of extended); forward;
//P4----------------------------------------------------------------------------
  procedure CosineDirection2Spherical(Vec: array of extended; out RA,Dec : extended); forward;
//P6----------------------------------------------------------------------------
  function RangeTPI(Angle:extended): extended; forward;
//P7----------------------------------------------------------------------------
  Procedure CalcNutationTerms(JD:extended; var NutLong, NutObl:extended); forward;
//P8----------------------------------------------------------------------------
function Ecliptic2Equatorial(Ecliptic:LBR; JD:extended): LBR;  forward;
//P9----------------------------------------------------------------------------
function Equatorial2Horiz(Equatorial:LBR; LAST:extended; Lat:extended): LBR; forward;
//P10---------------------------------------------------------------------------
function CalcLAMoonEclPos(JD:extended): LBR; forward;
//P11---------------------------------------------------------------------------
function CalcLASolarEclPos(JD:extended): LBR;  forward;
//P12---------------------------------------------------------------------------
procedure matrix_vector_mult(M: Matrix; V1: array of extended; out Vr: array of extended); forward;
//P13---------------------------------------------------------------------------
function matrix_transpose(M: Matrix): Matrix; forward;
//P14***************************************************************************
procedure nutation_coordinates(JD: extended; DirVec: array of extended; out OutDirVec: array of extended); forward;


//*******************************
//******PUBLIC FUNCTIONS*********
//*******************************
//1-----------------------------------------------------------------------------
function CalcST(JD:extended; EastLong: extended; STType:integer): extended;
//------------------------------------------------------------------------------
// Calculate Apparent Local Sidereal Time
// Input : JD (fraction of day)[real]
//         East longitude (radians)[extended]
//         Equation of Equinox (radians)[ extended] <- if 0 then calculate mean sidereal time!
// Output: Sidereal time (fraction of day) [extended]
// EO - May 2002
var
   T               : extended;
   TJD             : extended;
   GMST0UT         : extended;
   FracDay         : extended;
   ALST            : extended;
   EquationOfEquinox : extended;
   NutLong, NutObl : extended;
begin
   TJD     := int(JD - 0.5) + 0.5;
   FracDay := JD - TJD;
   T       := (TJD - JD2000)/DAYS_IN_JULIAN_CENTURY;
   // GMST at 0 UT
   GMST0UT := 24110.54841 + 8640184.812866*T + 0.093104*sqr(T) - 6.2e-6*power(T,3);

   // convert sec to frac of days
   GMST0UT := Frac(GMST0UT/SEC_IN_DAY);
   if (FracDay>1) then
      FracDay := FracDay - 1;

   ALST := GMST0UT + FracDay*MEAN_SOLAR_DAY;
   if STType=0 then
      EquationOfEquinox := 0
   else
      begin
      CalcNutationTerms(JD, NutLong, NutObl);
      EquationOfEquinox := NutLong*cos(Obliquity(JD));
     end;
   ALST := ALST + EquationOfEquinox/(2*pi)+ EastLong/(2*pi);
   Result := ALST - floor(ALST);
end;

//2-----------------------------------------------------------------------------
function CalcJD(date:_SYSTEMTIME): extended;
//------------------------------------------------------------------------------
// Convert date to julian day
// Input : date_ut [_SYSTEMTIME]
// Output: JD [extended]
// EO - May 2002
// debuging: 27.01.333 12:00:00 -> 1842713.0
//          01.01.2000 18:00:00 -> 2451545.25
var
   Frac, A, B : extended;

begin
 with date do
 begin
   Frac := (SEC_IN_HOUR*wHour + SEC_IN_MIN*wMinute + wSecond  + 0.001*wMilliseconds)/SEC_IN_DAY;

   B := 0;
   if (wMonth<3) then
    begin
      wYear  := wYear - 1;
      wMonth := wMonth + 12;
    end;
   if ((wYear>1582) OR ((wYear=1582) AND (wMonth>10)) OR ((wYear=1582) AND (wMonth=10) AND (wDay>=15))) then
    begin
      A := int(wYear/100);
      B := 2 - A + int(A/4);
    end;
   Result := floor(365.25*(wYear + 4716)) + int(30.6001*(wMonth + 1)) + wDay + B - 1524.5 + Frac;

 end;
end;

//3-----------------------------------------------------------------------------
function CalcEpoch(JD:extended): extended;
//------------------------------------------------------------------------------
//Returns Julian epoch.  Input: UT structure
begin
   Result := 2000 + 100*(JD - JD2000)/DAYS_IN_JULIAN_CENTURY;
end;

//4-----------------------------------------------------------------------------
function CalcAM(alt:extended): extended;
//------------------------------------------------------------------------------
//Returns Air mass. Input: Zenith Distance [rad]
//Uses hardie formula. Valid to zenith-distance of about 87deg.
//By : Eran O. Ofek           January 1994
var
    secz1   : extended;
begin
  if (pi/2-alt)>1.466 then   //Calc up to ZD=1.466Radians=84 degrees
    Result:=9.9
  else begin
     secz1:= Sec(pi/2-alt)-1;
     Result := secz1+1 - 0.0018167*secz1 - 0.002875*sqr(secz1) - 0.0008083*power(secz1,3);
   end;
end;

//5-----------------------------------------------------------------------------
procedure CalcAltAz(RA, Dec: extended; ST: extended; Lat: extended; var Alt, Az: extended);
//------------------------------------------------------------------------------
var
 RADec, AltAz: LBR;
begin
 RADec.L := RA;
 RADec.B := Dec;
 RADec.R := 1;

 AltAz  := Equatorial2Horiz(RADec, ST, Lat);
 Az     := AltAz.L-(Sign(AltAz.L)-1)*pi;
 Alt    := AltAz.B;
end;

//6-----------------------------------------------------------------------------
procedure CalcAltAz_HA(HA:extended; Dec: extended; Lat: extended; var Alt: extended; var Az: extended);
//------------------------------------------------------------------------------
var
   SinAz , SinAlt, CosAz, CosAlt: extended;

begin
   SinAlt := sin(Dec)*sin(Lat) + cos(Dec)*cos(HA)*cos(Lat);
   CosAlt := sqrt(1-SinAlt*SinAlt);

   SinAz  := (-cos(Dec)*sin(HA))/CosAlt;
   CosAz  := (sin(Dec)*cos(Lat) - cos(Dec)*cos(HA)*sin(Lat))/CosAlt;

   Az     := arctan2(SinAz, CosAz);
   Az     := Az-(Sign(Az)-1)*pi;
   Alt    := arcsin(SinAlt);
end;

//7-----------------------------------------------------------------------------
procedure CalcMoonPos(JD: extended; ST: extended; Lat: extended; var RA: extended;
          var Dec: extended; Var Alt: extended);
//------------------------------------------------------------------------------
var
  AltAz, RADec :LBR;
begin
RADec   := Ecliptic2Equatorial(CalcLAMoonEclPos(JD),JD);
AltAz   := Equatorial2Horiz(RADec, ST, Lat);
RA      := RADec.L;
Dec     := RADec.B;
Alt     := AltAz.B;
end;

//8-----------------------------------------------------------------------------
function SphereDist(Long1:extended; Lat1:extended; Long2:extended; Lat2:extended): extended;
//------------------------------------------------------------------------------
// calculate the spherical distance between two coordinates
// Input : Long1 in radians [extended]
//         Lat1  in radians [extended]
//         Long2 in radians [extended]
//         Lat2  in radians [extended]
// Output: distance in radians [extended]
// EO - May 2002
begin
   Result := arccos(sin(Lat1)*sin(Lat2) + cos(Lat1)*cos(Lat2)*cos(Long1 - Long2));
end;

//9-----------------------------------------------------------------------------
function CalcMoonIllumFrac(JD:extended): extended;
//------------------------------------------------------------------------------
//Return low-accuracy moon illuminated fraction
// Input : JD [extended]
// EO - May 2002
// debuging:

var
   T,T2,T3     : extended;
   D     : extended;
   M     : extended;
   Mt    : extended;
   I     : extended;

begin
   T     := (JD - JD2000)/DAYS_IN_JULIAN_CENTURY;
   T2    :=  sqr(T);
   T3    :=  power(T,3);
   D     := 297.85036 + 445267.111480*T - 0.0019142*T2 + T3/189474.0;
   M     := 357.52772 + 35999.050340*T - 0.0001603*T2 - T3/300000.0;
   Mt    := 134.96298 + 477198.867398*T + 0.0086972*T2 + T3/56250.0;

   D     := RangeTPI(D/RADIAN);
   M     := RangeTPI(M/RADIAN);
   Mt    := RangeTPI(Mt/RADIAN);

   // the phase angle
   I     := 180 - D*RADIAN - 6.289*sin(Mt) + 2.100*sin(M)  - 1.274*sin(2*D - Mt)
                           - 0.658*sin(2*D)  - 0.214*sin(2*Mt)  - 0.110*sin(D);
   I     := RangeTPI(I/RADIAN);

   Result  := 0.5*(1 + cos(I));
end;

//10----------------------------------------------------------------------------
function CalcSunAltAz(JD: extended; ST: extended; Lat: extended):LBR;
//------------------------------------------------------------------------------
begin
 Result:=CalcLASolarEclPos(JD);
Result:=Ecliptic2Equatorial(CalcLASolarEclPos(JD),JD);
Result := Equatorial2Horiz(Ecliptic2Equatorial(CalcLASolarEclPos(JD),JD),ST, Lat);
end;

//11----------------------------------------------------------------------------
function CalcDomePos(HA, Az, Alt : extended):extended;
//------------------------------------------------------------------------------
//input parameters:
//Lat      [radians]
//HA       [radians, positive to west]
//Az       [radians, positive to east]
//Alt      [radians]
//output parameter:
//DomeAz   [radians, positive to east]
const
// RA-Dec center relative to dome-center
// X is pointing to north
// Y is to the west
// Z is up
X0 = 0.0;    // meters
Y0 = 0.0;    // meters
Z0 = 0.0;    // meters
R  = 5.0;   // Dome Radius [m]
L  = 1.0;   // Shift between the RA - Dec, and the Dec - Optical-Axis crosspoints [m]

var
Lx, Ly, Lz, Px, Py, Pz, PL, QA, QB, QC, A1, Rx1, Ry1 :extended;
//A2, Rz1, Rx2, Ry2, Rz2 :extended;
DomeAz :extended;

begin
Lx   := X0 - sin(SiteNorthLat)*sin(-HA)*L;
Ly   := Y0 +          cos(-HA)*L;
Lz   := Z0 + cos(SiteNorthLat)*sin(-HA)*L;

Px   := cos(-Az)*cos(Alt);
Py   := sin(-Az)*cos(Alt);
Pz   :=          sin(Alt);

PL   := Px*Lx + Py*Ly + Pz*Lz;

QA  := 1;
QB  := 2*PL;
QC  := L*L - R*R;

A1  := (-QB + sqrt(QB*QB - 4*QA*QC))/(2*QA);
//A2  := (-QB - sqrt(QB*QB - 4*QA*QC))/(2*QA);

Rx1 := A1*Px - Lx;
Ry1 := A1*Py - Ly;
//Rz1 := A1*Pz - Lz;

//Rx2 := A2*Px - Lx;
//Ry2 := A2*Py - Ly;
//Rz2 := A2*Pz - Lz;

//if (Rz1>0) then
   DomeAz  := -arctan2(Ry1,Rx1);   //Dome Azimuth
//else
//   DomeAz  := -arctan2(Ry2,Rx2);  //Dome Azimuth

if (DomeAz < 0) then
   DomeAz := DomeAz +2*pi;
   Result := DomeAz
end;

//12----------------------------------------------------------------------------
procedure CalcPrecession(Equinoxin, Equinoxout, RAIn, DecIn: extended; out RAOut, DecOut: extended);
//------------------------------------------------------------------------------
var
 VecIn, VecOut : array[0..2] of extended;
begin
    Spherical2CosineDirection(RAIn,DecIn ,VecIn);
    PrecessCoord(Epoch2JD(Equinoxin), Epoch2JD(Equinoxout),VecIn, VecOut);
    CosineDirection2Spherical(VecOut,RAOut,DecOut);
end;

//13----------------------------------------------------------------------------
procedure CalcNutation(EquinoxIn, RAIn, DecIn: extended; out RAOut, DecOut: extended);
//------------------------------------------------------------------------------
var
 VecIn, VecOut : array[0..2] of extended;
begin
    Spherical2CosineDirection(RAIn,DecIn ,VecIn);
    nutation_coordinates(Epoch2JD(Equinoxin), VecIn, VecOut);
    CosineDirection2Spherical(VecOut,RAOut,DecOut);
end;

//14----------------------------------------------------------------------------
procedure CalcAbberation(JD,RA, Dec :extended; out dRA, dDec: extended);
// approximate correction for abberation
// return the difference between the apparent place and the geometric place
// input : JD, RA, Dec
// output : DeltaRA, DeltaDec (add to geometric to get apparent)
// debug: RA= 02:46:11.331 Dec = +49:20:54.54
//        JD= 2462088.69
//        DeltaRA = 30.047 DeltaDec=6.696 (arcsec)
//------------------------------------------------------------------------------

const
   K     :extended = 9.9365085e-05; //[rad] constant of abberation= 20.49552"
var
  T,E,P,Obl, SolarLong :extended;

begin
   T    := (JD - JD2000)/DAYS_IN_JULIAN_CENTURY;

// Earth eccentricity
   E := 0.016708617 - 0.000042037*T - 0.0000001236*Sqr(T);

// Earth longitude of perigee
   P := (102.93735 + 0.71953*T + 0.00046*Sqr(T))/RADIAN;

// Mean obliquity of ecliptic
   Obl := Obliquity(JD); // radians

// solar geometric longitude
//   SunEclPos := CalcLASolarEclPos(JD); // LBR type...
//   SunLong   := SunEclPos.L;
   SolarLong := CalcLASolarEclPos(JD).L; // LBR type...

   dRA   := -(K*sin(SolarLong) + K*E*sin(P))*sin(RA)*sec(Dec) -
   (K*cos(SolarLong)*cos(Obl) + K*E*cos(P)*cos(Obl))*cos(RA)*sec(Dec);

   dDec  := -(K*sin(SolarLong) + K*E*sin(P))*cos(RA)*sin(Dec) -
   (K*cos(SolarLong)*cos(Obl) + K*E*cos(P)*cos(Obl))*(tan(Obl)*cos(Dec) -
   sin(RA)*sin(Dec));
end;

//15----------------------------------------------------------------------------
//procedure CalcRefraction(T,P,RH, Z, HA, Dec, Lat :extended; out Ref, dRA, dDec: extended);
//DEBUG:
procedure CalcRefraction(T,P,RH, Z, HA, Dec, Lat :extended; out  dRA, dDec, Ref, C: extended);
// approximate correction for refraction
// return the difference between the apparent place and the geometric place
// based on Saastamoinen's formula, good to Z<70deg
// Input : T  - temperature [K]
//         P  - pressure [mbar]
//         RH - relative humidity [%]
//         Z  - zenith distance [radians]
//         HA - hour angle [radians]
//         Dec - declination [radians]
//         Lat - observer latitude [radians]
// Output : Ref - refraction [radinas]
//         DeltaRA, DeltaDec
//------------------------------------------------------------------------------
const
  Delta :extended = 18.36; // partial pressure of water vapor

var
//  PW, Q, TanZ, Ref, C : extended;
  PW, Q, TanZ : extended;

begin
  PW    := RH*Power((T/247.1),Delta);
  Q     := (P - 0.156*PW)/T;
  TanZ  := Tan(Z);
  Ref   := 16.271 * Q * TanZ * (1 + 0.0000394*Q*Sqr(TanZ)) -
           0.0000749*P*TanZ*(1 + Sqr(TanZ));


  // calculate the paralactic angle : C
  C := ArcTan(Sin(HA)/(Tan(Lat)*Cos(Dec) - Sin(Dec)*Cos(HA)));
  Ref   := Ref/ARCSEC_IN_DEG/RADIAN;

  dRA  := Ref*Sec(Dec)*Sin(C);
  dDec := Ref*Cos(C);
end;

//16----------------------------------------------------------------------------
function Epoch2JD(epoch : extended):extended;
//------------------------------------------------------------------------------
begin
   Result := ((epoch-2000.0)* 365.25)+JD2000;
end;

//*******************************
//******PRIVATE FUNCTIONS********
//*******************************
//P1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Obliquity(JD:extended): extended;
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Calculate obliquity of ecliptic
// Input : JD [extended]
// Output: Obliquity of ecliptic (radians) [extended]
// EO - May 2002
// debuging:
//     2451545.0 -> 0.409092802283074
//     2411000.0 -> 0.409344733169504
//     2431000.0 -> 0.409220466327102
var
   T               : extended;
begin
   T    := (JD - JD2000)/DAYS_IN_JULIAN_CENTURY;
   Result := ( 23.439291 - 0.0130042*T - 0.00000016*sqr(T) + 0.000000504*power(T,3))/RADIAN ;
end;

//P2****************************************************************************
procedure PrecessCoord(EquinoxJDin, EquinoxJDout: extended; DirVec: array of extended; out OutDirVec: array of extended);
//******************************************************************************
//Precess from  JDin to J2000, and then from J2000 to JDoud
//input : EquinoxJDin, EquinoxJDout [JD]
//        DirVec
//output: OutDirVec
var
  T, T2,T3,ZetaA, ZA, ThetaA: extended;
  RotP :Matrix;
  i    : integer;

begin
    if (EquinoxJDin =  EquinoxJDout) then begin
       for i := 0 to 2 do
           OutDirVec[i] := DirVec[i];
       exit;
    end;
    if (EquinoxJDin<> JD2000) then begin
        T  := (EquinoxJDin - JD2000)/DAYS_IN_JULIAN_CENTURY;
        T2 := Sqr(T);
        T3 := power(T,3);

        ZetaA  := (0.6406161*T + 0.0000839*T2 + 0.0000050*T3)/RADIAN;;
        ZA     := (0.6406161*T + 0.0003041*T2 + 0.0000051*T3)/RADIAN;;
        ThetaA := (0.5567530*T - 0.0001185*T2 - 0.0000116*T3)/RADIAN;;

        RotP[1,1] := cos(ZetaA)*cos(ThetaA)*cos(ZA) - sin(ZetaA)*sin(ZA);
        RotP[2,1] := cos(ZetaA)*cos(ThetaA)*sin(ZA) + sin(ZetaA)*cos(ZA);
        RotP[3,1] := cos(ZetaA)*sin(ThetaA);
        RotP[1,2] :=-sin(ZetaA)*cos(ThetaA)*cos(ZA) - cos(ZetaA)*sin(ZA);
        RotP[2,2] :=-sin(ZetaA)*cos(ThetaA)*sin(ZA) + cos(ZetaA)*cos(ZA);
        RotP[3,2] :=-sin(ZetaA)*sin(ThetaA);
        RotP[1,3] :=-sin(ThetaA)*cos(ZA);
        RotP[2,3] :=-sin(ThetaA)*sin(ZA);
        RotP[3,3] := cos(ThetaA);

        RotP := matrix_transpose(RotP);
        matrix_vector_mult(RotP,DirVec,OutDirVec);

        for i := 0 to 2 do
            DirVec[i] := OutDirVec[i];
    end;

    if (EquinoxJDout <> JD2000) then begin
       T  := (EquinoxJDout - JD2000)/DAYS_IN_JULIAN_CENTURY;
       T2 := Sqr(T);
       T3 := power(T,3);

       ZetaA  := 0.6406161*T + 0.0000839*T2 + 0.0000050*T3;
       ZA     := 0.6406161*T + 0.0003041*T2 + 0.0000051*T3;
       ThetaA := 0.5567530*T - 0.0001185*T2 - 0.0000116*T3;
       ZetaA  := ZetaA/RADIAN;
       ZA     := ZA/RADIAN;
       ThetaA := ThetaA/RADIAN;

       RotP[1,1] := cos(ZetaA)*cos(ThetaA)*cos(ZA) - sin(ZetaA)*sin(ZA);
       RotP[2,1] := cos(ZetaA)*cos(ThetaA)*sin(ZA) + sin(ZetaA)*cos(ZA);
       RotP[3,1] := cos(ZetaA)*sin(ThetaA);
       RotP[1,2] :=-sin(ZetaA)*cos(ThetaA)*cos(ZA) - cos(ZetaA)*sin(ZA);
       RotP[2,2] :=-sin(ZetaA)*cos(ThetaA)*sin(ZA) + cos(ZetaA)*cos(ZA);
       RotP[3,2] :=-sin(ZetaA)*sin(ThetaA);
       RotP[1,3] :=-sin(ThetaA)*cos(ZA);
       RotP[2,3] :=-sin(ThetaA)*sin(ZA);
       RotP[3,3] := cos(ThetaA);

      matrix_vector_mult(RotP,DirVec,OutDirVec);
    end;
end;

//P3****************************************************************************
procedure Spherical2CosineDirection(RA,Dec : extended; out Vec: array of extended);
//******************************************************************************
//Vec: open array with  1..3  positions
begin
 Vec[0] := cos(Dec)*cos(RA);
 Vec[1] := cos(Dec)*sin(RA);
 Vec[2] := sin(Dec);
end;

//P4****************************************************************************
procedure CosineDirection2Spherical(Vec: array of extended; out RA,Dec : extended);
//******************************************************************************
//Vec: open array with  1..3  positions
var
 CosDec : extended;
begin
 Dec    := arcsin(Vec[2]);
 CosDec := cos(Dec);   
 RA     := arctan2(Vec[1]/CosDec,Vec[0]/CosDec); //do we neet CosDec??

 if (RA<0) then
    RA := RA+2*pi;
end;

//P6****************************************************************************
function RangeTPI(Angle:extended): extended;
//******************************************************************************
// convert angle in radians to range 0-2pi
// Input : angle in radians [extended]. Output: angle in radians in range 0-2pi [extended]
// EO - May 2002
begin
   RangeTPI := (Angle/(2*pi) - floor(Angle/(2*pi)))*2*pi;
end;

//P7****************************************************************************
Procedure CalcNutationTerms(JD:extended; var NutLong, NutObl:extended);
//******************************************************************************
// calculate low-accuracy (~0.5") the nutations in longitude (Dpsi)
// and in obliquity (Deps)
// referred to the mean ecliptic and equinox of date.
// add nutation in longitude to get apparent coordinates.
// Input : JD [extended]
// Output: LBR structure (long, lat, distance in km)
// EO - May 2002
// debuging:

var
   T,T2,T3     : extended;
//   D, F     : extended;
   M     : extended;
   Mt    : extended;
   Omega : extended;
   L     : extended;
   Lt    : extended;

begin
   T     := (JD - JD2000)/DAYS_IN_JULIAN_CENTURY;
   T2    := sqr(T);
   T3    := power(T,3);

//  D     := (297.85036 + 445267.111480*T - 0.0019142*T2 + T3/189474.0)/RADIAN;
   M     := (357.52772 + 35999.050340*T - 0.0001603*T2 - T3/300000.0)/RADIAN;
   Mt    := (134.96298 + 477198.867398*T + 0.0086972*T2 + T3/56250.0)/RADIAN;
//   F     := (93.27191 + 483202.017538*T - 0.0036825*T2 + T3/327270.0)/RADIAN;
   Omega := (125.04452 - 1934.136261*T + 0.0020708*T2 + T3/450000.0)/RADIAN;
// Moon's mean longitude (equinox of date + light term)
   Lt    := (218.3164591 + 481267.88134236*T - 0.0013268*T2
            + T3/538841 - power(T,4)/65194000);
   L     := (280.46645 + 36000.76983*T + 0.0003032*T2);

//   D     := RangeTPI(D);
   M     := RangeTPI(M);
   Mt    := RangeTPI(Mt);
//   F     := RangeTPI(F);
   Omega := RangeTPI(Omega);

// nutation in longitude [radians]
   NutLong  := (-17.1996-0.01742*T)*sin(Omega) + (-1.3187-0.00016*T)*sin(2*L) -
                0.2274*sin(2*Lt) + 0.2062*sin(2*Omega) + 0.1426*sin(M) + 0.0712*sin(Mt);
   NutLong  := NutLong/(ARCSEC_IN_DEG*RADIAN);
// nutation in obliquity [radians]
   NutObl  :=   9.20*cos(Omega) + 0.57*cos(2*L) + 0.10*cos(2*Lt) - 0.09*cos(2*Omega);
   NutObl  := NutObl/(ARCSEC_IN_DEG*RADIAN);
end;

//P8****************************************************************************
function Ecliptic2Equatorial(Ecliptic:LBR; JD:extended): LBR;
//******************************************************************************
// Convert Ecliptic coordinates to equatorial coordinates
// referred to a given mean ecliptic.
// Input : Ecliptic coordinates [LBR structure]
//         JD [extended]
// Output: Equatorial coordinates [LBR structure]
// EO - May 2002
// debuging:

var
//   T   : extended;
   Obl : extended;
   X   : extended;
   Y   : extended;
   Z   : extended;

begin
//   T   := (JD - JD2000)/DAYS_IN_JULIAN_CENTURY;
   Obl := Obliquity(JD);   // mean obliquity of date

   X   := cos(Ecliptic.B)*cos(Ecliptic.L);
   Y   := cos(Ecliptic.B)*sin(Ecliptic.L)*cos(Obl) - sin(Ecliptic.B)*sin(Obl);
   Z   := cos(Ecliptic.B)*sin(Ecliptic.L)*sin(Obl) + sin(Ecliptic.B)*cos(Obl);

   Result.L := arctan2(Y,X);
   Result.L := Result.L - (sign(Result.L) - 1)*pi;
   Result.B := arctan(Z/sqrt(sqr(X)+sqr(Y)));
   Result.R := Ecliptic.R;

end;

//P9******************************************************************************
function Equatorial2Horiz(Equatorial:LBR; LAST:extended; Lat:extended): LBR;
//******************************************************************************
// Convert equatorial coordinates to horizontal coordinates.
// Input : Equatorial coordinates [LBR structure]
//         Local apparent sidereal time in frac of day [extended]
//         Geodetic latitude in radians [extended]
// Output: Horizontal coordinates, Az,Alt,R [LBR structure]
// EO - May 2002
var
   HA    : extended;
   RA    : extended;
   Dec   : extended;
   Az    : extended;
   Alt   : extended;
   SinAz , SinAlt, CosAz, CosAlt: extended;

begin
   RA   := Equatorial.L;
   Dec  := Equatorial.B;
   HA   := 2*pi*LAST - RA;

   SinAlt := sin(Dec)*sin(Lat) + cos(Dec)*cos(HA)*cos(Lat);
   CosAlt := sqrt(1-SinAlt*SinAlt);

   SinAz  := (-cos(Dec)*sin(HA))/CosAlt;
   CosAz  := (sin(Dec)*cos(Lat) - cos(Dec)*cos(HA)*sin(Lat))/CosAlt;

   Az     := arctan2(SinAz, CosAz);
   Alt    := arcsin(SinAlt);

   Equatorial2Horiz.L := Az;
   Equatorial2Horiz.B := Alt;
   Equatorial2Horiz.R := Equatorial.R;
end;

//P10******************************************************************************
function CalcLAMoonEclPos(JD:extended): LBR;
//******************************************************************************
// calculate the geocentric low accuracy ecliptic coordinates of the moon
// referred to the mean ecliptic and equinox of date.
// add nutation in longitude to get apparent coordinates.
// Input : JD [extended]
// Output: LBR structure (long, lat, distance in km)
// EO - May 2002
// debuging:

var
   T, T2, T3, T4      : extended;
   Lt     : extended;     // Moon's mean longitude (equinox of date + light term)
   D      : extended;     // Mean elongation of the Moon
   M      : extended;     // Sun's mean anomaly
   Mt     : extended;     // Moon's mean anomaly
   F      : extended;     // Moon's argument of latitude
   E      : extended;     // Earth eccentricity
   SumL, SumB, SumR   : extended;
   Lon, Lat, RadVec : extended;

begin
   T  := (JD - JD2000)/DAYS_IN_JULIAN_CENTURY;
   T2 := sqr(T);
   T3 := power(T,3);
   T4 := power(T,4);

   Lt := 218.3164591 + 481267.88134236*T - 0.0013268*T2 + T3/538841 - T4/65194000;
   D  := 297.8502042 + 445267.1115168*T - 0.0016300*T2 + T3/545868 -T4/113065000;
   M  := 357.5291092 + 35999.0502909*T - 0.0001536*T2 + T3/24490000;
   Mt := 134.9634114 + 477198.8676313*T + 0.0089970*T2 + T3/69699 + T4/14712000;
   F  := 93.2720993 + 483202.0175273*T - 0.0034029*T2 - T3/3526000 + T4/863310000;
   E  := 1 - 0.002516*T - 0.0000074*T2;

   // convert to radians -> convert to 0-2\pi
   Lt := RangeTPI(Lt/RADIAN);
   D  := RangeTPI(D/RADIAN);
   M  := RangeTPI(M/RADIAN);
   Mt := RangeTPI(Mt/RADIAN);
   F  := RangeTPI(F/RADIAN);

   SumL := 6288774*sin(Mt) +
     1274027*sin(2*D - Mt) +
     658314*sin(2*D) +
     213618*sin(2*Mt) -
     185116*sin(M)*E -
     114332*sin(2*F) +
     58793*sin(2*D - 2*Mt) +
     57066*sin(2*D - M - Mt)*E +
     53322*sin(2*D + Mt) +
     45758*sin(2*D - M)*E -
     40923*sin(M - Mt)*E -
     34720*sin(D) -
     30383*sin(M + Mt)*E +
     15327*sin(2*D - 2*F) -
     12528*sin(Mt + 2*F) +
     10980*sin(Mt - 2*F) +
     10675*sin(4*D - Mt) +
     10034*sin(Mt) +
     8548*sin(4*D - 2*Mt) -
     7888*sin(2*D + M - Mt)*E -
     6766*sin(2*D + M)*E -
     5163*sin(D - Mt);

  SumR := -20905355*cos(Mt)
     -3699111*cos(2*D - Mt)
     -2955968*cos(2*D)
     -569925*cos(2*Mt)
     +48888*cos(M)*E
     -3149*cos(2*F)
     +246158*cos(2*D - 2*Mt)
     -152138*cos(2*D - M - Mt)*E
     -170733*cos(2*D + Mt)
     -204586*cos(2*D - M)*E
     -129620*cos(M - Mt)*E
     +108743*cos(D)
     +104755*cos(M + Mt)*E
     +10321*cos(2*D - 2*F)
     +0*cos(Mt + 2*F)
     +79661*cos(Mt - 2*F)
     -34782*cos(4*D - Mt)
     -23210*cos(Mt)
     -21636*cos(4*D - 2*Mt)
     +24208*cos(2*D + M - Mt)*E
     +30824*cos(2*D + M)*E
     -8379*cos(D - Mt);


  SumB := 5128122*sin(F)
     +280602*sin(Mt + F)
     +277693*sin(Mt - F)
     +173237*sin(2*D - F)
     +55413*sin(2*D - Mt + F)
     +46271*sin(2*D - Mt - F)
     +32573*sin(2*D + F)
     +17198*sin(2*Mt + F)
     +9266*sin(2*D + Mt - F)
     +8822*sin(2*Mt - F)
     +8216*sin(2*D - M - F)*E;

   Lon    := RangeTPI(Lt + SumL*1e-6/RADIAN);
   Lat    := RangeTPI(SumB*1e-6/RADIAN);
   RadVec := 385000.56 + SumR*1e-3;
//   HP     := arcsin(6378.14/RADIAN);     // horizontal parallax ??? -1<x<1 !

   CalcLAMoonEclPos.L := Lon;
   CalcLAMoonEclPos.B := Lat;
   CalcLAMoonEclPos.R := RadVec;
end;

//P11***************************************************************************
function CalcLASolarEclPos(JD:extended): LBR;
//******************************************************************************
// Calculate Low Accuracy (0.01deg) apparent solar ecliptic coordinates
// referred to the true dynamical ecliptic and equinox of date
// Input : JD [extended]
// Output: Solar LBR position: longitude (radians), latitude (radians), radius-vector (au) [LBR structure]
// EO - May 2002
// debuging:

var
   T,T2          : extended;
   L0         : extended;
   M          : extended;
   E          : extended;
   C          : extended;
   V          : extended;
   Long       : extended;
   Lat        : extended;
   RadiusVec  : extended;
   Omega      : extended;

begin
   T    := (JD - JD2000)/DAYS_IN_JULIAN_CENTURY;
   T2   :=sqr(T);
   L0  := RangeTPI( (280.46645 + 36000.76983*T + 0.0003032*T2)/RADIAN );           // Sun mean longitude
   // Sun mean anomaly
   M   := RangeTPI( (357.52910 + 35999.05030*T - 0.0001559*T2 - 0.00000048*power(T,3))/RADIAN );
   E   := 0.016708617 - 0.000042037*T - 0.0000001236*T2;           // Earth eccentricity

   C := +(1.914600 - 0.004817*T - 0.000014*T2)*sin(M)
        +(0.019993 - 0.000101*T)*sin(2*M) +0.000290*sin(3*M);
   C := RangeTPI (C/RADIAN );

   V := M + C;     // true anomaly

   Long         := L0 + C;         // the Sun true longitude
   RadiusVec    := 1.000001018*(1-sqr(E))/(1 + E*cos(V));
   Lat          := 0;

   // correct for nutation and abberation
   Omega  := RangeTPI( (125.04 - 1934.136*T)/RADIAN );
   Long   := Long - (0.00569 - 0.00478*sin(Omega))/RADIAN;

   CalcLASolarEclPos.L := Long;
   CalcLASolarEclPos.B := Lat;
   CalcLASolarEclPos.R := RadiusVec;

end;

//P12***************************************************************************
procedure matrix_vector_mult(M: Matrix; V1: array of extended; out Vr: array of extended);
//******************************************************************************
//M1: open array with  [1..3][1..3]  positions.
//V1, Vr: open array with  1..3  positions.
var
 I: integer;
//  V = M*V1
begin
 for I := 0 to 2 do
    Vr[I] := M[I+1,1]*V1[0] + M[I+1,2]*V1[1] + M[I+1,3]*V1[2];
end;

//P13****************************************************************************
function matrix_transpose(M: Matrix): Matrix;
//******************************************************************************
//M, MT: open array with  [1..3][1..3]  positions. The function returna the same sturct.
begin
  Result[1,1] := M[1,1];
  Result[1,2] := M[2,1];
  Result[1,3] := M[3,1];
  Result[2,1] := M[1,2];
  Result[2,2] := M[2,2];
  Result[2,3] := M[3,2];
  Result[3,1] := M[1,3];
  Result[3,2] := M[2,3];
  Result[3,3] := M[3,3];
end;

//P14***************************************************************************
procedure nutation_coordinates(JD: extended; DirVec: array of extended; out OutDirVec: array of extended);
//****************************************************************************
// Mean obliquity of ecliptic
var
Obl, NutLong, NutObl : extended;
RotN : Matrix;
begin
Obl := Obliquity(JD); // radians
CalcNutationTerms(JD, NutLong, NutObl);

RotN[1,1]  := 1;
RotN[1,2]  := -NutLong*cos(Obl);
RotN[1,3]  := -NutLong*sin(Obl);
RotN[2,1]  := +NutLong*cos(Obl);
RotN[2,2]  := 1;
RotN[2,3]  := -NutObl;
RotN[3,1]  := NutLong*sin(Obl);
RotN[3,2]  := +NutObl;
RotN[3,3]  := 1;

matrix_vector_mult(RotN,DirVec, OutDirVec);
end;


//----------------------------------------------------------
(*matrix_mult(M1,M2)
// M := M1*M2

for I:=1:1:3,
   for J:=1:1:3,
      M(I,J) := M1(I,1)*M2(1,J) + M1(I,2)*M2(2,J) + M1(I,3)*M2(3,J);
   end
end
*)
end.




