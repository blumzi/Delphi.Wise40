unit DomeProtocol;
//******************************************************************************
// UNIT NAME         DomeProtocol
// USED BY PROJECTS  RemoteDome, Remote
// AUTHOR            Yiftah Lipkin
// DESCRIPTION       Determines the communication protocol with the Dome Deamon
// LAST MODIFIED     2003 Jun 10
//******************************************************************************
interface
const

  msgOK       = '.';  //Change to '#'roger
  roger     :char = '#';
  msgErr      = '+';

///////////////////////////////
//Commands sent TO DomeDeamon//
///////////////////////////////
// General Form: [xn1]
//      x  [char]      Command to Dome
//      n1 [integer]   (optional) commant parameter

//DMInit: sent status every N1[/N2] sec when idle[/busy] (<0.1<N1<1, 0.05<N2<1)
  DmInit      = 'i'; //+2 params (N1, N2) NEW
  DmSendParam = 'j'; //Send DomeFFAz, ZenParkAz, VentsAz
  DmSendState = 'k'; //Send: [chch int int] DmState  DmShState DmPos*10 DmShPos*10

//OpenClose shutter: Optional. Numerical parameter is [0..10 = 10*DomeShFinalPos].
//Without numerical parameter = go until further notice/fully opened/closed
  DmShOpen    = 'l';
  DmShClose   = 'm';
  DmShStop    = 'n';

//Move Dome: Numeric parameter is [0..3600 = 10*DomeFinalAz].
//Mandatory for DmMove. Optional for DmMoveL DmMoveR
//DmMoveL DmMoveR without numeric parameter =  go until further notice
  DmMoveL     = 'o';  //New
  DmMoveR     = 'p';  //New
  DmMove      = 'q';  //New
  DmStop      = 'r';

//Send Dome to a Special Positions
  DmFFPark    = 's';
  DmZenPark   = 't';
  DmVents     = 'u';

///////////////////////////////
//Status sent FROM DomeDeamon//
///////////////////////////////
// General Form: [Sxyn1 n2]
//  'S'             Status message prefix
//  x  [char]       Shutter State
//  y  [char]       Done State
//  n1 [integer]    Round(Shutter position *10)
//  n2 [integer]    Round(Dome Position* 10)

//Shutter States
  DmShIdle    = 'a';
  DmShOpening = 'b';
  DmShClosing = 'c';
  DmShStuck   = 'd';
  DmShUnKnown = 'v';  

//Dome States
  DmIdle      = 'e';
  DmMovingL   = 'f';
  DmMovingR   = 'g';
  DmStuck     = 'h';
  DmProblem  = 'i';   //ONLY for external use. this is equal to internally turning DMStuckInProgress=TRUE.

//Validation Key Generator
  function keygen(par: integer):integer;

implementation
uses Windows,math;

function keygen(par: integer):integer;
const
   a1     = 0.5534;
   a2     = 0.6469;
   a3     = 0.1123;
   a4     = 0.6735;
   a5     = 0.1903;
var
   UTNow :  _SYSTEMTIME;
begin
  GetSystemTime(UTnow);
  result := round(1000*(a1*power(par,3)+a2*sqrt(par)+a3*sin(UTNow.wDay+a4*UTNow.wHour)));
end;

end.
