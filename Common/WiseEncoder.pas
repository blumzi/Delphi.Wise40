unit WiseEncoder;

interface

uses
  Windows, Math, ExtCtrls, cbw, StopWatch, SysUtils, WiseHardware, WiseDaq, WisePort;

type TWiseEncoderSimState = ( Idle = 0, MovingCCW = 1, MovingCW = 2 );
type TWiseEncoder = class(TWiseMultiPort)
  private
    fNativeTicks:          integer;                   // Native number of ticks
    fIsGray:               boolean;                   // Returns Gray code
    fValue:                integer;

  protected
    { Protected declarations }
  public
    constructor Create(Name: string; isGray: boolean; var daqids: array of TDaqId; lastMask: integer; nativeTicks: integer; Timeout: TLargeInteger); overload;
    constructor Create(Name: string; isGray: boolean; var daqids: array of TDaqId; lastMask: integer; nativeTicks: integer); overload;
    constructor Create(Name: string; isGray: boolean; specs: TWiseMultiPortSpecs; nativeTicks: integer); overload;

    function    GetValue():  integer;  // reads the actual encoder

    property    Ticks:       integer read fNativeTicks;
    property    Value:       integer read GetValue;

    { Public declarations }
  published
    { Published declarations }
  end;

{ -- TWiseDomeEncoder -- }

type TWiseDomeEncoder = class(TWiseEncoder)
private
  fCaliTicks:   integer;                   // ticks at calibration point
  ticksPerDeg:  real;
  fCaliAz:      real;                      // azimuth at calibration point
  caliTime:     TDateTime;                 // last calibration time
{$ifdef SIMULATE_DOME_ENCODER}
  sim_ticks:       integer;
  sim_ticks_timer: TTimer;
  fSim_dir:        TWiseDirection;
  procedure        onSimTicksTimer(Sender: TObject);
{$endif SIMULATE_DOME_ENCODER}
  function      GetValue: integer;

public
  constructor   Create(name: string; daqids: array of TDaqId; lastMask: integer; travelTicks: integer; nativeTicks: integer);
  destructor    Destroy; override;

  function      GetAzimuth: real;
  procedure     Calibrate(az: real);
  function      ShortestDeltaValue(prevValue: integer): integer;  // returns ticks distance between a previous and current values

{$ifdef SIMULATE_DOME_ENCODER}
  procedure     SimulateMovement(dir: TWiseDirection);
{$endif SIMULATE_DOME_ENCODER}
  property      Azimuth:   real    read GetAzimuth write Calibrate;
  property      CaliTicks: integer read fCaliTicks;
  property      CaliAz:    real    read fCaliAz;
  property      Value:     integer read GetValue;
end;

{ -- TWiseFocusEncoder -- }

type TWiseFocusEncoder = class(TWiseEncoder)
private

public
  constructor Create(name: string; specs: TWiseMultiPortSpecs);

  function GetValue: integer;

  property Value: integer read GetValue;
end;

implementation

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

{ -- TWiseEncoder -- }

constructor TWiseEncoder.Create(Name: string; isGray: boolean; var daqids: array of TDaqId; lastMask: integer; nativeTicks: integer; Timeout: TLargeInteger);
begin
     Inherited Create(Name, daqids, lastMask, Timeout);

     Self.fNativeTicks := nativeTicks;
     Self.fIsGray      := isGray;
end;

constructor TWiseEncoder.Create(Name: string; isGray: boolean; var daqids: array of TDaqId; lastMask: integer; nativeTicks: integer);
begin
     Inherited Create(Name, daqids, lastMask, MaxTimeout);

     Self.fNativeTicks := nativeTicks;
     Self.fIsGray      := isGray;
end;

constructor TWiseEncoder.Create(Name: string; isGray: boolean; specs: TWiseMultiPortSpecs; nativeTicks: integer);
begin
     Inherited Create(Name, specs, MaxTimeout);

     Self.fNativeTicks := nativeTicks;
     Self.fIsGray      := isGray;
end;


function TWiseEncoder.GetValue(): integer;
begin
  fValue := TWiseMultiPort(Self).Value;
  if (Self.fIsGray) then
    fValue := Gray2BCD[fValue];
  Result := fValue;
end;

{ -- TWiseDomeEncoder -- }

function TWiseDomeEncoder.GetValue: integer;
begin
{$ifdef SIMULATE_DOME_ENCODER}
  Result := Self.sim_ticks;
{$else}
  Result := TWiseEncoder(Self).Value;
{$endif SIMULATE_DOME_ENCODER}
end;

{$ifdef SIMULATE_DOME_ENCODER}
procedure TWiseDomeEncoder.onSimTicksTimer(Sender: TObject);
begin
  if Self.fSim_dir = DirCW then
    Dec(Self.sim_ticks)
  else if fSim_dir = DirCCW then
    Inc(Self.sim_ticks);

  if Self.sim_ticks = fNativeTicks then
    Self.sim_ticks := 0
  else if Self.sim_ticks = -1 then
    Self.sim_ticks := fNativeTicks - 1;
end;

procedure TWiseDomeEncoder.SimulateMovement(dir: TWiseDirection);
begin
  Self.fSim_dir := dir;

  case dir of
  DirNone: Self.sim_ticks_timer.Enabled := false;
  DirCCW:  Self.sim_ticks_timer.Enabled := true;
  DirCW:   Self.sim_ticks_timer.Enabled := true;
  end;
end;

{$endif SIMULATE_DOME_ENCODER}

constructor TWiseDomeEncoder.Create(Name: string; daqids: array of TDaqId; lastMask: integer; travelTicks: integer; nativeTicks: integer);
begin
  inherited Create(name, true, daqids, lastMask, nativeTicks, 50);
  Self.fCaliTicks  := -1;
  Self.ticksPerDeg := 360 / travelTicks;
{$ifdef SIMULATE_DOME_ENCODER}
     Self.sim_ticks_timer := TTimer.Create(nil);
     Self.sim_ticks_timer.Enabled := false;
     Self.sim_ticks_timer.Interval := Floor(1000 / 6);
     Self.sim_ticks_timer.onTimer := onSimTicksTimer;
     
     Randomize;
     sim_ticks := 256 + Random(Floor(Self.fNativeTicks / 2));
{$endif SIMULTE_DOME_ENCODER}
end;

destructor TWiseDomeEncoder.Destroy;
begin
  inherited Destroy;
end;

procedure TWiseDomeEncoder.Calibrate(az: real);
begin
  Self.fCaliTicks := Self.Value;
  Self.fCaliAz    := az;
  Self.caliTime   := Now;
end;

function TWiseDomeEncoder.GetAzimuth: real;
var
  currTicks:  integer;
begin
  if Self.fCaliTicks = -1 then begin  // not calibrated yet
    Result := -1.;
    exit;
  end;

  currTicks := Self.Value;

  if currTicks = Self.fCaliTicks then         // at calibration point
    Result := Self.fCaliAz
  else if currTicks > Self.fCaliTicks then    // between calibration point and 1024
    Result := Self.fCaliAz + (Self.fCaliTicks + Self.Ticks - currTicks) * Self.ticksPerDeg
  else                                        // between 1024 and calibration point
    Result := Self.fCaliAz + (Self.fCaliTicks - currTicks) * Self.ticksPerDeg;

  if Result >= 360.0 then
     Result := Result - 360.0
  else if Result < 0 then
     Result := Result + 360;
end;

function TWiseDomeEncoder.ShortestDeltaValue(prevValue: integer): integer;
var
  currValue: integer;
begin
  currValue := Self.Value;
  if currValue = prevValue then
    Result := 0
  else if currValue < prevValue then
    Result := Self.Ticks - prevValue + currValue
  else
    Result := prevValue + Self.Ticks - currValue;
end;

{
  TWiseFocusEncoder
}
constructor TWiseFocusEncoder.Create(name: string; specs: TWiseMultiPortSpecs);
begin
  inherited Create(name, true, specs, 1024);
end;

function TWiseFocusEncoder.GetValue: integer;
begin
  Result := Self.Value;
end;

end.

