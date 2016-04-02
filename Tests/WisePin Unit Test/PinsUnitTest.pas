unit PinsUnitTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WiseHardware, WiseDaq, WisePin, ExtCtrls, DateUtils,
  CheckLst, ComCtrls, cbw;

type
  TForm1 = class(TForm)
    MainTimer: TTimer;
    PortGroupBox: TGroupBox;
    PortSelector: TComboBox;
    DirectionSelector: TRadioGroup;
    PortStatusTimer: TTimer;
    BoardSelector: TComboBox;
    ValueBox: TGroupBox;
    StatusBar: TLabel;
    BoardDescription: TLabel;
    EightBitsPanel: TPanel;
    FourBitsPanel: TPanel;
    procedure MainTimerTick(Sender: TObject);
    procedure PortStatusTimerTick(Sender: TObject);
    procedure ChangeBoard(Sender: TObject);
    procedure RedefinePins(Sender: TObject);
    procedure OnClickCheck(Sender: TObject);
    procedure ShowPinValues();
    procedure OnCreate(Sender: TObject);
    procedure DestroyForm(Sender: TObject);

  private
    { Private declarations }
  public
    procedure SetPortStatus(s: string; millis: integer); overload;
    procedure SetPortStatus(s: string; millis: integer; color: TColor); overload;
    { Public declarations }
  end;

type TBoardInfo = record
     name:       PChar;
     num:        integer;
     ndaqs:      integer;
     bitsPerDaq: array of integer;
     Items:      TStrings;
end;
type PTBoardInfo = ^TBoardInfo;

var
  Form1:                TForm1;
  PortStatusExpiration: TDateTime;

  Pins:                 array of TWisePin;
  PortType:             (SingleBit = 0, MultipleBits = 1) = SingleBit;
  DirectionType:        (Output = 0, Input = 1);
  i:                    integer;
  BitsChecker:          TCheckListBox = nil;

  okboard, okport:      integer;
  initResult:           string;

procedure makeBitsChecker();

implementation

{$R *.dfm}

procedure TForm1.MainTimerTick(Sender: TObject);
begin
     if DirectionSelector.ItemIndex = 1 then
        ShowPinValues;
end;

procedure TForm1.PortStatusTimerTick(Sender: TObject);
begin
     if (Time > PortStatusExpiration) then begin
        StatusBar.Caption := '';
        StatusBar.Font.Color := clWindowText;
     end;
end;

procedure TForm1.SetPortStatus(s: string; millis: integer);
begin
     StatusBar.Caption := s;
     if (millis = 0) then
        PortStatusExpiration := IncYear(Time, 1)
     else
        PortStatusExpiration := IncMilliSecond(Time, millis)
end;

procedure TForm1.SetPortStatus(s: string; millis: integer; color: TColor);
begin
     StatusBar.Font.Color  := color;
     StatusBar.Caption  := s;
     if (millis = 0) then
        PortStatusExpiration := IncYear(Time, 1)
     else
        PortStatusExpiration := IncMilliSecond(Time, millis)
end;

procedure SetBoardDescription(boardno: integer);
begin
    Form1.BoardDescription.Caption := Format('Board #%d: %s (%d daqs)',
                   [boardno, WiseBoards[boardno].model, WiseBoards[boardno].Ndaqs]);
end;

procedure TForm1.ChangeBoard(Sender: TObject);
var
   boardno, daqno: integer;
begin
   boardno := BoardSelector.ItemIndex;
   PortSelector.Items.Clear;
   for daqno := 0 to WiseBoards[boardno].ndaqs - 1 do
       PortSelector.Items.Add(Format('%s', [WiseDaqPortNames[daqno + FIRSTPORTA]]));
   SetBoardDescription(boardno);
end;

procedure TForm1.RedefinePins(Sender: TObject);
var
   npins, i:      integer;
   did:           TDaqId;
   newpin:        array[0..7] of TWisePin;
   boardno, portno, dir: integer;
begin
   {
      Prepare a new Daq.
      Don't change display until a new port is successfully created.
   }
   boardno := BoardSelector.ItemIndex;
   portno  := PortSelector.ItemIndex + FIRSTPORTA;

   dir := DIGITALOUT;
   if DirectionSelector.ItemIndex = 1 then
    dir := DIGITALIN;

   did := daqId(boardno, portno, dir);

   npins := WiseBoards[BoardSelector.ItemIndex].bitsPerDaq[PortSelector.ItemIndex];
   SetLength(Pins, npins);
   for i := 0 to npins - 1 do
      if Pins[i] <> nil then begin
         Pins[i].Destroy;
         Pins[i] := nil;
      end;

   try
      for i := 0 to npins - 1 do
          newpin[i] := TWisePin.Create(Format('Pin%d', [i]), did, i);
   except begin
      SetPortStatus(Format('Board%d:%s NOT SUPPORTED!',
             [BoardSelector.ItemIndex, PortSelector.Items[PortSelector.ItemIndex]]), 2000, clRed);
      BoardSelector.ItemIndex := boardno;
      PortSelector.ItemIndex  := portno - FIRSTPORTA;

      exit;
      end;
   end;

   {
      At this point the new port was successfully created, we can update the display.
      daq contains either the new values or the restored values
   }

   okboard := boardno;
   okport  := portno;
   for i:= 0 to npins - 1 do begin
       if Pins[i] <> nil then
          Pins[i].Destroy;
       Pins[i] := newpin[i];
   end;

   SetBoardDescription(boardno);
   makeBitsChecker;
   ShowPinValues;
end;

procedure TForm1.ShowPinValues();
var
   bit, highest: integer;
begin
   highest   := WiseBoards[BoardSelector.ItemIndex].bitsPerDaq[PortSelector.ItemIndex] - 1;

   for bit := 0 to highest do
       if Pins[bit].isOn then  // this bit is ON
          BitsChecker.Checked[highest - bit] := true
       else
          BitsChecker.Checked[highest - bit] := false;
end;


procedure TForm1.OnClickCheck(Sender: TObject);
var
   bit, highest: integer;
begin

   if not BitsChecker.Visible then
      exit;

   highest := WiseBoards[BoardSelector.ItemIndex].bitsPerDaq[PortSelector.ItemIndex] - 1;
   bit     := highest - BitsChecker.ItemIndex;

   if (BitsChecker.Checked[BitsChecker.ItemIndex]) then
      Pins[bit].SetOn
   else
      Pins[bit].SetOff;
   ShowPinValues;
end;

procedure makeBitsChecker();
var
   ncolumns, i: integer;
   enabled:  boolean;
   thisPanel, thatPanel:    TPanel;

begin
   if BitsChecker <> nil then begin
      BitsChecker.Visible := false;
      BitsChecker.Destroy;
      BitsChecker := nil;
   end;

   ncolumns  := WiseBoards[Form1.BoardSelector.ItemIndex].BitsPerDaq[Form1.PortSelector.ItemIndex];
   thisPanel := Form1.EightBitsPanel;
   thatPanel := Form1.FourBitsPanel;
   if (ncolumns = 4) then begin
      thisPanel := Form1.FourBitsPanel;
      thatPanel := Form1.EightBitsPanel;
   end;

   enabled := true;
   if (Form1.DirectionSelector.ItemIndex = 1) then
      enabled := false;

   thatPanel.Visible  := false;

   BitsChecker                 := TCheckListBox.Create(thisPanel);
   BitsChecker.Parent          := thisPanel;
   BitsChecker.Width           := 14 * ncolumns;
   BitsChecker.Height          := 20;
   BitsChecker.Clear;
   for i := 0 to ncolumns - 1 do
       BitsChecker.Items.Add('');
   BitsChecker.Columns         := ncolumns;
   BitsChecker.ParentColor     := true;
   BitsChecker.Ctl3D           := false;
   BitsChecker.BorderStyle     := bsNone;
   BitsChecker.OnClickCheck    := Form1.OnClickCheck;
   BitsChecker.MultiSelect     := true;
   BitsChecker.Enabled         := enabled;
   BitsChecker.ItemIndex       := 0;
   thisPanel.Visible           := true;
end;

procedure TForm1.OnCreate(Sender: TObject);
var
   boardno, first, daqno: integer;
begin
   if initResult = '' then begin
     BoardSelector.Items.Clear;
     first := -1;
     for boardno := 0 to High(WiseBoards) do
       if (WiseBoards[boardno].model <> nil) then begin
          BoardSelector.Items.Add(Format('Board %d', [boardno]));
          if (first = -1) then
             first := boardno;
       end;
     BoardSelector.ItemIndex := 0;

     SetBoardDescription(first);
     PortSelector.Items.Clear;
     for daqno := 0 to WiseBoards[first].ndaqs - 1 do
       PortSelector.Items.Add(Format('%s', [WiseDaqPortNames[daqno + FIRSTPORTA]]));
       PortSelector.Text := Format('%s', [WiseDaqPortNames[FIRSTPORTA]]);
       PortSelector.ItemIndex := 0;

       RedefinePins(Form1);
   end else begin
     BoardSelector.Text := '';
     PortSelector.Text  := '';
     SetPortStatus(initResult + ' STOPPED!', 1000000000, clRed);
     exit;
   end;
end;

procedure TForm1.DestroyForm(Sender: TObject);
begin
  for i := 0 to WiseBoards[Form1.BoardSelector.ItemIndex].bitsPerDaq[Form1.PortSelector.ItemIndex] - 1 do
    Pins[i].SetOff;
end;

initialization
   initResult := InitDaqsInfo();

end.
