unit WiseHardwareAllTogether;

interface

uses
  Windows, Messages, SysUtils, Classes, cbw, StopWatch, Winsock;

Const
  MaxTries           = 5;
  MaxTimeout         = 100;                 // microseconds between port reads
  FullPortMask       = $ff;
  MaxBoards          = 3;                   // Max number of boards supported
  MaxPortsPerBoard   = 8;                   // FIRST to EIGHTH
  BytesPerPort       = 3;                   // FIRSTPORTA(8), FIRSTPORTB(8), FIRSTPORTCL(4), FIRSTPORTCH(4)

(*
type TDaqId          = byte;                // ((Board << 4) | port)
type TDaqIds         = set of TDaqId;
type PTDaqIds        = ^TDaqIds;

type TDaqPortNumbers = set of FIRSTPORTA .. EIGHTHPORTCH;
type PTDaqPortNumbers = ^TDaqPortNumbers;

type TWiseDaq         = record
     Board:           Integer;              // The Daq board number
     Port:            Integer;              // The port on the Daq board
     Dir:             Integer;              // The port direction
     Mask:            Byte;
     Val:             Byte;                 // Remembered by software
end;
*)

type TWiseControl   = class
 private
    Name:           string;
 public
    constructor Create(Name: string);
end;

(*
type TWiseMultiPort = class(TWiseControl)
 private
    Daqs:          array of TWiseDaq;    // Interfaces to the MCC boards
 public
    constructor Create(Name: string; Daqs: array of TWiseDaq; Direction: Integer);
end;

type TWiseSinglePort = class(TWiseControl)
 private
    fPersistent: boolean;  // Remembers bit values
 public
    Daq:         TWiseDaq;             // Interface to the MCC board
    constructor  Create(Name: string; Daq: TWiseDaq; Direction: Integer);
    procedure    SetDirection(dir: integer);

    property     Persistent: boolean read fPersistent write fPersistent;
end;
*)

(*
type TWiseEncoder = class(TWiseMultiPort)
  private
    Timeout:               TLargeInteger;             // Max time (micros) between Daq reads
    Ngets:                 TLargeInteger;             // How many times the encoder was read
    LastVal:               word;                      // The last value read from the encoder
    LastTime:              TDateTime;                 // When was the last value read
    ReductionFactor:       real;                      // ClicksPerTravel / NativeClicks
    fCorrection:           real;                      // Added to the readout to produce the value
    fNativeClicks:         integer;                   // Native max number of clicks
    fClicksPerTravel:      integer;                   // Number of clicks per full working travel (e.g. per 360 degrees azimuth)
    fIsGray:               boolean;                   // Returns Gray code
    fValue:                real;
    //fAzimuth:              real;

    function               ReadDaqs(): integer;         // Actually reads the daqs

  protected
    { Protected declarations }
  public
    constructor Create(Name: string; isGray: boolean; var Daqs: array of TWiseDaq; travelClicks: integer; nativeClicks: integer; init: integer; Timeout: TLargeInteger); overload;
    constructor Create(Name: string; isGray: boolean; var Daqs: array of TWiseDaq; travelClicks: integer; nativeClicks: integer; init: integer); overload;

    function    GetValue():    Integer;  // reads the actual encoder
    procedure   SetValue(v: integer);

    function    GetLast():     Integer;  // gets the last-read value
    function    GetLastTime(): TDateTime;// gets the time when the actual encoder was read
    procedure   Reset();                 // resets internal counters

    procedure   SetAzimuth(az: real);    // computes the encoder's current azimuth
    function    GetAzimuth(): real;

    property    Clicks:        integer read fNativeClicks;
    property    Correction:    real    read fCorrection;

    property    Value:         integer read GetValue   write SetValue;
    property    Azimuth:       real    read GetAzimuth write SetAzimuth;

    { Public declarations }
  published
    { Published declarations }
  end;
*)

(*
type  TWisePin = class(TWiseSinglePort)
  private
    Pin:        Integer;

  public
    constructor Create(Name: string; Daq: TWiseDaq; Pin: Integer; Direction: Integer);
    procedure   SetOn();             // sets the corresponding bit to 1
    procedure   SetOff();            // sets the corresponding bit to 0
    procedure   Reset();             // sets the remembered value to 0
    function    IsOn(): boolean;
end;
*)

(*
type TWisePort = class(TWiseSinglePort)
  public
    constructor Create(Name: string; Daq: TWiseDaq; Direction: Integer; Persistent: boolean = false);
    destructor  Destroy(); override;
    function    GetVal(): word;      // reads the current port value
    procedure   SetVal(val: word);   // sets the port to the given value
    procedure   SetOn(bit: integer); // turns on a bit
    procedure   SetOff(bit: integer);// turns off a bit
    procedure   Clear();             // sets the remembered value to 0

    property    Value: word read GetVal write SetVal;
end;
*)

type TPortId = FIRSTPORTA .. EIGHTHPORTCH;

    EWiseError          = class(Exception);
    EWiseConfigError    = class(EWiseError);
    EWiseEncoderError   = class(EWiseError);
    EWisePinError       = class(EWiseError);
    EWisePortError      = class(EWiseError);

(*
function daqId(daq: TWiseDaq): byte;
*)

var
   EightBitDaqs, FourBitDaqs: TDaqIds;   // Sets of (board, port) tuples
   DaqPortNames: array[AUXPORT .. EIGHTHPORTCH] of string;
   DirNames:     array[DIGITALOUT .. DIGITALIN] of string = ('DIGITALOUT', 'DIGITALIN');


implementation

var InDaqs, OutDaqs:  TDaqIds;   // Set of DIGITALIN/DIGITALOUT ports
var ConfiguredDaqs:   TDaqIds;   // Set of (board, port) tuples that were already configured

(*
const EightBitPortIds: array[0..15] of integer = (
                             FIRSTPORTA,    FIRSTPORTB,    SECONDPORTA,  SECONDPORTB,
                             THIRDPORTA,    THIRDPORTB,    FOURTHPORTA,  FOURTHPORTB,
                             FIFTHPORTA,    FIFTHPORTB,    SIXTHPORTA,   SIXTHPORTB,
                             SEVENTHPORTA,  SEVENTHPORTB,  EIGHTHPORTA,  EIGHTHPORTB
                            );

const FourBitPortIds: array[0..15] of integer = (
                             FIRSTPORTCL,   FIRSTPORTCH,   SECONDPORTCL, SECONDPORTCH,
                             THIRDPORTCL,   THIRDPORTCH,   FOURTHPORTCL, FOURTHPORTCH,
                             FIFTHPORTCL,   FIFTHPORTCH,   SIXTHPORTCL,  SIXTHPORTCH,
                             SEVENTHPORTCL, SEVENTHPORTCH, EIGHTHPORTCL, EIGHTHPORTCH
                            );
*)

var hostname: array[0..256] of Char;
var production: boolean = false;
var bid, pid, dirid: integer;

(*
const Gray2BCD : Array[0..1023] of integer = (
    0,    1,    3,    2,    7,    6,    4,    5,   15,   14,
   12,   13,    8,    9,   11,   10,   31,   30,   28,   29,
   24,   25,   27,   26,   16,   17,   19,   18,   23,   22,
   20,   21,   63,   62,   60,   61,   56,   57,   59,   58,
   48,   49,   51,   50,   55,   54,   52,   53,   32,   33,
   35,   34,   39,   38,   36,   37,   47,   46,   44,   45,
   40,   41,   43,   42,  127,  126,  124,  125,  120,  121,
  123,  122,  112,  113,  115,  114,  119,  118,  116,  117,
   96,   97,   99,   98,  103,  102,  100,  101,  111,  110,
  108,  109,  104,  105,  107,  106,   64,   65,   67,   66,
   71,   70,   68,   69,   79,   78,   76,   77,   72,   73,
   75,   74,   95,   94,   92,   93,   88,   89,   91,   90,
   80,   81,   83,   82,   87,   86,   84,   85,  255,  254,
  252,  253,  248,  249,  251,  250,  240,  241,  243,  242,
  247,  246,  244,  245,  224,  225,  227,  226,  231,  230,
  228,  229,  239,  238,  236,  237,  232,  233,  235,  234,
  192,  193,  195,  194,  199,  198,  196,  197,  207,  206,
  204,  205,  200,  201,  203,  202,  223,  222,  220,  221,
  216,  217,  219,  218,  208,  209,  211,  210,  215,  214,
  212,  213,  128,  129,  131,  130,  135,  134,  132,  133,
  143,  142,  140,  141,  136,  137,  139,  138,  159,  158,
  156,  157,  152,  153,  155,  154,  144,  145,  147,  146,
  151,  150,  148,  149,  191,  190,  188,  189,  184,  185,
  187,  186,  176,  177,  179,  178,  183,  182,  180,  181,
  160,  161,  163,  162,  167,  166,  164,  165,  175,  174,
  172,  173,  168,  169,  171,  170,  511,  510,  508,  509,
  504,  505,  507,  506,  496,  497,  499,  498,  503,  502,
  500,  501,  480,  481,  483,  482,  487,  486,  484,  485,
  495,  494,  492,  493,  488,  489,  491,  490,  448,  449,
  451,  450,  455,  454,  452,  453,  463,  462,  460,  461,
  456,  457,  459,  458,  479,  478,  476,  477,  472,  473,
  475,  474,  464,  465,  467,  466,  471,  470,  468,  469,
  384,  385,  387,  386,  391,  390,  388,  389,  399,  398,
  396,  397,  392,  393,  395,  394,  415,  414,  412,  413,
  408,  409,  411,  410,  400,  401,  403,  402,  407,  406,
  404,  405,  447,  446,  444,  445,  440,  441,  443,  442,
  432,  433,  435,  434,  439,  438,  436,  437,  416,  417,
  419,  418,  423,  422,  420,  421,  431,  430,  428,  429,
  424,  425,  427,  426,  256,  257,  259,  258,  263,  262,
  260,  261,  271,  270,  268,  269,  264,  265,  267,  266,
  287,  286,  284,  285,  280,  281,  283,  282,  272,  273,
  275,  274,  279,  278,  276,  277,  319,  318,  316,  317,
  312,  313,  315,  314,  304,  305,  307,  306,  311,  310,
  308,  309,  288,  289,  291,  290,  295,  294,  292,  293,
  303,  302,  300,  301,  296,  297,  299,  298,  383,  382,
  380,  381,  376,  377,  379,  378,  368,  369,  371,  370,
  375,  374,  372,  373,  352,  353,  355,  354,  359,  358,
  356,  357,  367,  366,  364,  365,  360,  361,  363,  362,
  320,  321,  323,  322,  327,  326,  324,  325,  335,  334,
  332,  333,  328,  329,  331,  330,  351,  350,  348,  349,
  344,  345,  347,  346,  336,  337,  339,  338,  343,  342,
  340,  341, 1023, 1022, 1020, 1021, 1016, 1017, 1019, 1018,
 1008, 1009, 1011, 1010, 1015, 1014, 1012, 1013,  992,  993,
  995,  994,  999,  998,  996,  997, 1007, 1006, 1004, 1005,
 1000, 1001, 1003, 1002,  960,  961,  963,  962,  967,  966,
  964,  965,  975,  974,  972,  973,  968,  969,  971,  970,
  991,  990,  988,  989,  984,  985,  987,  986,  976,  977,
  979,  978,  983,  982,  980,  981,  896,  897,  899,  898,
  903,  902,  900,  901,  911,  910,  908,  909,  904,  905,
  907,  906,  927,  926,  924,  925,  920,  921,  923,  922,
  912,  913,  915,  914,  919,  918,  916,  917,  959,  958,
  956,  957,  952,  953,  955,  954,  944,  945,  947,  946,
  951,  950,  948,  949,  928,  929,  931,  930,  935,  934,
  932,  933,  943,  942,  940,  941,  936,  937,  939,  938,
  768,  769,  771,  770,  775,  774,  772,  773,  783,  782,
  780,  781,  776,  777,  779,  778,  799,  798,  796,  797,
  792,  793,  795,  794,  784,  785,  787,  786,  791,  790,
  788,  789,  831,  830,  828,  829,  824,  825,  827,  826,
  816,  817,  819,  818,  823,  822,  820,  821,  800,  801,
  803,  802,  807,  806,  804,  805,  815,  814,  812,  813,
  808,  809,  811,  810,  895,  894,  892,  893,  888,  889,
  891,  890,  880,  881,  883,  882,  887,  886,  884,  885,
  864,  865,  867,  866,  871,  870,  868,  869,  879,  878,
  876,  877,  872,  873,  875,  874,  832,  833,  835,  834,
  839,  838,  836,  837,  847,  846,  844,  845,  840,  841,
  843,  842,  863,  862,  860,  861,  856,  857,  859,  858,
  848,  849,  851,  850,  855,  854,  852,  853,  512,  513,
  515,  514,  519,  518,  516,  517,  527,  526,  524,  525,
  520,  521,  523,  522,  543,  542,  540,  541,  536,  537,
  539,  538,  528,  529,  531,  530,  535,  534,  532,  533,
  575,  574,  572,  573,  568,  569,  571,  570,  560,  561,
  563,  562,  567,  566,  564,  565,  544,  545,  547,  546,
  551,  550,  548,  549,  559,  558,  556,  557,  552,  553,
  555,  554,  639,  638,  636,  637,  632,  633,  635,  634,
  624,  625,  627,  626,  631,  630,  628,  629,  608,  609,
  611,  610,  615,  614,  612,  613,  623,  622,  620,  621,
  616,  617,  619,  618,  576,  577,  579,  578,  583,  582,
  580,  581,  591,  590,  588,  589,  584,  585,  587,  586,
  607,  606,  604,  605,  600,  601,  603,  602,  592,  593,
  595,  594,  599,  598,  596,  597,  767,  766,  764,  765,
  760,  761,  763,  762,  752,  753,  755,  754,  759,  758,
  756,  757,  736,  737,  739,  738,  743,  742,  740,  741,
  751,  750,  748,  749,  744,  745,  747,  746,  704,  705,
  707,  706,  711,  710,  708,  709,  719,  718,  716,  717,
  712,  713,  715,  714,  735,  734,  732,  733,  728,  729,
  731,  730,  720,  721,  723,  722,  727,  726,  724,  725,
  640,  641,  643,  642,  647,  646,  644,  645,  655,  654,
  652,  653,  648,  649,  651,  650,  671,  670,  668,  669,
  664,  665,  667,  666,  656,  657,  659,  658,  663,  662,
  660,  661,  703,  702,  700,  701,  696,  697,  699,  698,
  688,  689,  691,  690,  695,  694,  692,  693,  672,  673,
  675,  674,  679,  678,  676,  677,  687,  686,  684,  685,
  680,  681,  683,  682
);
*)


function daqId(daq: TWiseDaq): byte; overload;
var
   r: integer;
begin
     r := (daq.Board SHL 4) OR daq.Port;
     if daq.Dir = DIGITALIN then
        r := r OR (1 SHL 7)
     else
        r := r OR (0 SHL 7);
     Result := r;
end;

function daqId(board: integer; port: integer; dir: integer): byte; overload;
var
   r: integer;
begin
     r := (board SHL 4) OR port;
     if dir = DIGITALIN then
        r := r OR (1 SHL 7)
     else
        r := r OR (0 SHL 7);
     Result := r;
end;

{
 Remembers Daq information and:
  - prevents ports from being used for both directions
  - calls the UL configuration only once per port.
}
procedure ConfigureDaqs(Name: string; var Daqs: array of TWiseDaq; Direction: Integer);
var
   i, stat: Integer;
   TheseDaqs, ThoseDaqs: PTDaqIds;
   dId: TDaqId;
begin
     TheseDaqs := nil;
     ThoseDaqs := nil;

     for i := 0 to High(Daqs) do begin

         dId := daqId(daqs[i]);

         case Direction of
         DIGITALIN:  begin TheseDaqs := @InDaqs;  ThoseDaqs := @OutDaqs; end;
         DIGITALOUT: begin TheseDaqs := @OutDaqs; ThoseDaqs := @InDaqs;  end;
         end;

         if dId in ThoseDaqs^ then
            raise EWiseError.CreateFmt('[%s]: %s: "(%d, %s)" is already registered for the opposite direction.',
                     ['ConfigureDaqs', name, daqs[i].Board, DaqPortNames[daqs[i].Port]]);

         TheseDaqs^ := TheseDaqs^ + [dId];

         if dId in ConfiguredDaqs then continue;

         stat := cbDConfigPort(daqs[i].Board, daqs[i].Port, Direction);
         if (stat <> 0) then
             raise EWisePortError.CreateFmt('%s: Cannot cbDConfigPort "%s" on board %d for %s',
               [name, DaqPortNames[daqs[i].Port], daqs[i].Board, DirNames[daqs[i].Dir]]);

         ConfiguredDaqs := ConfiguredDaqs + [dId];
         daqs[i].Dir    := Direction;
     end;
end;

procedure UnconfigureDaqs(daqs: array of TWiseDaq);
var
   i: integer;
   dId: TDaqId;
begin
   for i := 0 to High(daqs) do begin
       dId := daqId(daqs[i]);
       ConfiguredDaqs := ConfiguredDaqs - [dId];

       case daqs[i].Dir of
       DIGITALIN:       InDaqs  := InDaqs  - [dId];
       DIGITALOUT:      OutDaqs := OutDaqs - [dId];
       end;
   end;
end;

{ TWiseControl implementation }

constructor TWiseControl.Create(Name: string);
begin
     Self.Name := Name;
end;

(*
{ TWiseMultiPort implementation }

constructor TWiseMultiPort.Create(Name: string; Daqs: array of TWiseDaq; Direction: Integer);
var
   i: Integer;
begin
     Inherited Create(Name);

     ConfigureDaqs(Name, Daqs, Direction);
     SetLength(Self.Daqs, High(Daqs) + 1);
     for i := 0 to High(Daqs) do begin
         Self.Daqs[i] := Daqs[i];
         Self.Daqs[i].Dir := Direction;
     end;
end;


{ TWiseSinglePort implementation }

constructor TWiseSinglePort.Create(Name: string; Daq: TWiseDaq; Direction: Integer);
begin
     Inherited Create(Name);

     ConfigureDaqs(Name, Daq, Direction);
     Self.Daq := Daq;
end;
*)

(*
{ TWiseEncoder implementation }

constructor TWiseEncoder.Create(Name: string; isGray: boolean; var Daqs: array of TWiseDaq; travelClicks: integer; nativeClicks: integer; init: integer; Timeout: TLargeInteger);
begin
     Inherited Create(Name, Daqs, DIGITALIN);
     Self.Timeout          := Timeout;
     Self.fNativeClicks    := nativeClicks;
     self.fClicksPerTravel := travelClicks;
     //Self.fCorrection      := init;
     Self.fIsGray          := isGray;
     Self.ReductionFactor  := travelClicks / nativeClicks;
end;

constructor TWiseEncoder.Create(Name: string; isGray: boolean; var Daqs: array of TWiseDaq; travelClicks: integer; nativeClicks: integer; init: integer);
begin
     Inherited Create(Name, Daqs, DIGITALIN);
     Self.Timeout          := MaxTimeout;
     Self.fNativeClicks    := nativeClicks;
     self.fClicksPerTravel := travelClicks;
     //Self.fCorrection      := init;
     Self.fIsGray          := isGray;
     Self.ReductionFactor  := travelClicks / nativeClicks;
end;

var stopper: TStopWatch;                // Used to time the interval between Daq reads

function TWiseEncoder.ReadDaqs(): Integer;
var
   val:                         word;
   daqno, tries, elapsed, stat: Integer;
begin
    tries   := 0;
    elapsed := 0;
    repeat
          Result := 0;
          daqno := 0;
          repeat
                if (daqno > 0) then stopper.Start;                                  // start the stopper
                stat := cbDIn(Self.Daqs[daqno].Board, Self.Daqs[daqno].Port, val);  // try to read the port
                if (daqno > 0) then begin
                   stopper.Stop;                                                    // stop the stopper
                   elapsed := stopper.ElapsedMicroseconds;
                end;

                if (stat <> 0) or ((daqno > 0) and (elapsed > Self.Timeout)) then begin
                   daqno := 0;                                                      // read failed or took too long between reads => start over
                   continue;
                end;

                val    := val AND Self.Daqs[daqno].Mask;
                Result := Result OR (val SHL (daqno * 8));
                Inc(daqno);
          until daqno = High(Self.Daqs) + 1;
          if (daqno = High(Self.Daqs) + 1) then break;
          Inc(tries)
    until tries = MaxTries;

    if (tries = MaxTries) then
       raise EWiseEncoderError.CreateFmt('[%s]: %s: Cannot read after %d tries.', ['TWiseEncoder.ReadDaqs', Self.Name, MaxTries]);

    if (Self.fIsGray) then
       Result := Gray2BCD[Result];

    Self.fValue   := Result;
    if (Self.Ngets > 0) then
       Self.LastVal  := Result;                        // remember the last value read
    Self.LastTime := Time();
    Inc(Self.Ngets);
end;

function TWiseEncoder.GetValue(): integer;
begin
     if (production) then
        Self.fValue := ReadDaqs();

     Result := Round(Self.fValue * Self.ReductionFactor);
end;

procedure TWiseEncoder.SetValue(v: integer);
begin
     Self.fValue := v;
end;

function TWiseEncoder.GetLast(): Integer;
begin
     if (Ngets = 0) then
        raise EWiseEncoderError.CreateFmt('[%s]: %s: No previous value.', ['TWiseEncoder.GetLast', Self.Name]);

     Result := Self.LastVal;
end;

function TWiseEncoder.GetLastTime(): TDateTime;
begin
     if (Ngets = 0) then
        raise EWiseEncoderError.CreateFmt('[%s]: %s: No previous read.', ['TWiseEncoder.GetLastTime', Self.Name]);

     Result := Self.LastTime;
end;

procedure TWiseEncoder.Reset();
begin
     Self.Ngets    := 0;
     Self.LastVal  := 0;
     Self.LastTime := 0;
end;

procedure TWiseEncoder.SetAzimuth(az: real);
begin
     Self.fCorrection := Round((az / 360) - ((Self.fClicksPerTravel * Self.fValue) / Self.fNativeClicks));
end;

function TWiseEncoder.GetAzimuth(): real;
begin
    Result := 360 * (Self.Value - Self.fCorrection) / Self.fClicksPerTravel;
end;
*)

(*
{ TWisePin implementation }

constructor TWisePin.Create(Name: string; Daq: TWiseDaq; Pin: Integer; Direction: Integer);
begin
     Inherited Create(Name, Daq, Direction);

     if not Pin in [0 .. 7] then
         raise EWisePinError.CreateFmt('[%s]: %s: Invalid pin number "%d", must be in [0 .. 7]', ['TWisePin.Create', Name, Pin]);

     if ((Direction <> DIGITALIN) and (Direction <> DIGITALOUT)) then begin
         raise EWisePinError.CreateFmt('[%s]: %s: Invalid direction "%d", must be (DIGITALIN, DIGITALOUT)', ['TWisePin.Create', Name, Direction]);
         exit;
     end;

     Self.Pin        := Pin;
     Self.Daq.Dir    := Direction;
end;

procedure TWisePin.SetOn();
var
   stat, i:   Integer;
   val:       Byte;
begin
   if (Self.Persistent) then
      val := Self.Daq.Val OR (1 SHL Self.Pin)
   else
      val := 1 SHL Self.Pin;

   for i := 0 to MaxTries do begin
       stat := cbDOut (Self.Daq.Board, Self.Daq.Port, val);
       if stat = 0 then begin
          if Self.Persistent then
             Self.Daq.Val := val;
          exit;
       end;
   end;

   raise EWisePinError.CreateFmt('[%s]: %s: Cannot cbDOut(%d, %s, $%x) => %d',
         ['TWisePin.SetOn', Self.Name, Self.Daq.Board, DaqPortNames[Self.Daq.Port], val, stat]);
end;

procedure TWisePin.SetOff();
var
   stat, i:   Integer;
   val:       Byte;
begin
   if Self.Persistent then
      val := Self.Daq.Val AND NOT (1 SHL Self.Pin)
   else
      val := 0;

   for i := 0 to MaxTries do begin
       stat := cbDOut (Self.Daq.Board, Self.Daq.Port, val);
       if stat = 0 then begin
          if Self.Persistent then
             Self.Daq.Val := val;
          exit;
       end;
   end;

   raise EWisePinError.CreateFmt('[%s]: %s: Cannot cbDOut(%d, %s, $%x) => %d',
         ['TWisePin.SetOff', Self.Name, Self.Daq.Board, DaqPortNames[Self.Daq.Port], stat]);
end;

function TWisePin.IsOn(): boolean;
var
   stat, tries: Integer;
   val:         Word;
begin

   for tries := MaxTries downto 0 do begin
     stat := cbDIn(Self.Daq.Board, Self.Daq.Port, val);
     if (stat = 0) then begin
        if ((val AND (1 SHL Self.Pin)) <> 0) then Result := true else Result := false;
        exit;
     end;
   end;

   raise EWisePinError.CreateFmt('[%s]: %s: Cannot read "%s" on board %d after %d tries.',
            ['TWisePin.IsOn', Self.Name, DaqPortNames[Self.Daq.Port], Self.Daq.Board, MaxTries]);
end;

procedure TWisePin.Reset();
begin
     if Self.Persistent then Self.Daq.Val := 0;
end;
*)

(*
{ TWisePort implementation }

constructor TWisePort.Create(Name: string; Daq: TWiseDaq; Direction: Integer; Persistent: boolean = false);
begin
     Inherited Create(Name, Daq, Direction);

     Self.Daq.Dir    := Direction;
     Self.Daq.Val    := 0;
     Self.Persistent := Persistent;
end;

destructor TWisePort.Destroy();
begin
     UnconfigureDaqs(Self.daq);

     inherited Destroy;
end;

function TWisePort.GetVal(): word;
var
   stat, tries: Integer;
   val:         word;
begin
     for tries := MaxTries downto 0 do begin
         stat := cbDIn(Self.Daq.Board, Self.Daq.Port, val);
         if (stat = 0) then begin
            Result     := val;
            if (Self.Persistent) then
               Self.Daq.Val := val;
            exit;
         end;
     end;

     raise EWisePortError.CreateFmt('[%s]: %s: Cannot read "%s" on board %d after %d tries.',
           ['TWisePort.GetVal', Self.Name, DaqPortNames[Self.Daq.Port], Self.Daq.Board, MaxTries]);
end;

procedure TWisePort.SetVal(val: word);
var
   stat, tries: Integer;
begin
     val := val AND Self.Daq.Mask;
     for tries := MaxTries downto 0 do begin
         stat := cbDOut(Self.Daq.Board, Self.Daq.Port, val);
         if (stat = 0) then begin
            if (Self.Persistent) then
               Self.Daq.Val := val;
            exit;
         end;
     end;

     raise EWisePortError.CreateFmt('[%s]: %s: Cannot cbDout(%d, "%s", %x) => %d (after %d tries).',
           ['TWisePort.SetVal', Self.Name, Self.Daq.Board, DaqPortNames[Self.Daq.Port], val, stat, MaxTries]);
end;

procedure TWisePort.SetOn(bit: integer);
var
   stat, tries: integer;
   val:         byte;
begin
     if (Self.Persistent) then
        val := Self.Daq.Val OR (1 SHL bit)
     else
        val := (1 SHL bit);
     val := val AND Self.Daq.Mask;

     for tries := MaxTries downto 0 do begin
         stat := cbDOut(Self.Daq.Board, Self.Daq.Port, val);
         if (stat = 0) then begin
            if (Self.Persistent) then
               Self.Daq.Val := val;
            exit;
         end;
     end;

     raise EWisePortError.CreateFmt('[%s]: %s: Cannot cbDout(%d, "%s", %x) => %d (after %d tries).',
           ['TWisePort.SetOn', Self.Name, Self.Daq.Board, DaqPortNames[Self.Daq.Port], val, stat, MaxTries]);
end;

procedure TWisePort.SetOff(bit: integer);
var
   stat, tries: integer;
   val:         byte;
begin
     if (Self.Persistent) then
        val := Self.Daq.Val AND NOT (1 SHL bit)
     else
        val := 0;
     val := val AND Self.Daq.Mask;

     for tries := MaxTries downto 0 do begin
         stat := cbDOut(Self.Daq.Board, Self.Daq.Port, val);
         if (stat = 0) then begin
            if (Self.Persistent) then
               Self.Daq.Val := val;
            exit;
         end;
     end;

     raise EWisePortError.CreateFmt('[%s] %s: Cannot cbDout(%d, "%s", %x) => %d (after %d tries).',
           ['TWisePort.SetOff', Self.Name, Self.Daq.Board, DaqPortNames[Self.Daq.Port], val, stat, MaxTries]);
end;

procedure TWisePort.Clear();
var
   stat, tries: integer;
begin
     Self.Daq.Val := 0;
     if (Self.Daq.Dir = DIGITALIN) then
        exit;

     for tries := MaxTries downto 0 do begin
         stat := cbDOut(Self.Daq.Board, Self.Daq.Port, Self.Daq.Val);
         if (stat = 0) then
            exit;
     end;

     raise EWisePortError.CreateFmt('[%s]: %s: Cannot cbDout(%d, "%s", %x) => %d (after %d tries).',
           ['TWisePort.Clear', Self.Name, Self.Daq.Board, DaqPortNames[Self.Daq.Port], Self.Daq.Val, stat, MaxTries]);
end;

procedure TWiseSinglePort.SetDirection(dir: integer);
var
   daq: TWiseDaq;
begin
     if (Self.Daq.Dir <> dir) then begin
        daq := Self.Daq;
        daq.Dir := dir;
        ConfigureDaqs(Self.Name, daq, dir);
     end;
     Self.Daq.Dir := dir;
end;
*)

initialization

  if ((gethostname(hostname, sizeof(hostname)) = 0) and (hostname = 'dome-pc')) then
      production := true;
(*
  DaqPortNames[AUXPORT]          := 'AUXPORT';
  DaqPortNames[FIRSTPORTA]       := 'FIRSTPORTA';
  DaqPortNames[FIRSTPORTB]       := 'FIRSTPORTB';
  DaqPortNames[FIRSTPORTCL]      := 'FIRSTPORTCL';
  DaqPortNames[FIRSTPORTCH]      := 'FIRSTPORTCH';
  DaqPortNames[SECONDPORTA]      := 'SECONDPORTA';
  DaqPortNames[SECONDPORTB]      := 'SECONDPORTB';
  DaqPortNames[SECONDPORTCL]     := 'SECONDPORTCL';
  DaqPortNames[SECONDPORTCH]     := 'SECONDPORTCH';
  DaqPortNames[THIRDPORTA]       := 'THIRDPORTA';
  DaqPortNames[THIRDPORTB]       := 'THIRDPORTB';
  DaqPortNames[THIRDPORTCL]      := 'THIRDPORTCL';
  DaqPortNames[THIRDPORTCH]      := 'THIRDPORTCH';
  DaqPortNames[FOURTHPORTA]      := 'FOURTHPORTA';
  DaqPortNames[FOURTHPORTB]      := 'FOURTHPORTB';
  DaqPortNames[FOURTHPORTCL]     := 'FOURTHPORTCL';
  DaqPortNames[FOURTHPORTCH]     := 'FOURTHPORTCH';
  DaqPortNames[FIFTHPORTA]       := 'FIFTHPORTA';
  DaqPortNames[FIFTHPORTB]       := 'FIFTHPORTB';
  DaqPortNames[FIFTHPORTCL]      := 'FIFTHPORTCL';
  DaqPortNames[FIFTHPORTCH]      := 'FIFTHPORTCH';
  DaqPortNames[SIXTHPORTA]       := 'SIXTHPORTA';
  DaqPortNames[SIXTHPORTB]       := 'SIXTHPORTB';
  DaqPortNames[SIXTHPORTCL]      := 'SIXTHPORTCL';
  DaqPortNames[SIXTHPORTCH]      := 'SIXTHPORTCH';
  DaqPortNames[SEVENTHPORTA]     := 'SEVENTHPORTA';
  DaqPortNames[SEVENTHPORTB]     := 'SEVENTHPORTB';
  DaqPortNames[SEVENTHPORTCL]    := 'SEVENTHPORTCL';
  DaqPortNames[SEVENTHPORTCH]    := 'SEVENTHPORTCH';
  DaqPortNames[EIGHTHPORTA]      := 'EIGHTHPORTA';
  DaqPortNames[EIGHTHPORTB]      := 'EIGHTHPORTB';
  DaqPortNames[EIGHTHPORTCL]     := 'EIGHTHPORTCL';
  DaqPortNames[EIGHTHPORTCH]     := 'EIGHTHPORTCH';
*)

  DirNames[DIGITALIN]    := 'DIGITALIN';
  DirNames[DIGITALOUT]   := 'DIGITALOUT';

(*
  stopper                := TStopWatch.Create(false);
*)
  for bid := 0 to MaxBoards do begin
      for dirid := DIGITALOUT to DIGITALIN do begin
          for pid := 0 to High(EightBitPortIds) do
              EightBitDaqs := EightBitDaqs + [daqId(bid, EightBitPortIds[pid], dirid)];

          for pid := 0 to High(FourBitPortIds) do
              FourBitDaqs  := FourBitDaqs  + [daqId(bid, FourBitPortIds[pid], dirid)];
      end;
  end;

end.
