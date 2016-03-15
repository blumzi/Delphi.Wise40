unit PortUnitTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WiseHardware, WiseDaq, WisePort, WiseStatusLine, ExtCtrls, DateUtils,
  CheckLst, cbw, ComCtrls;

type
  TForm1 = class(TForm)
    MainTimer:          TTimer;
    PortGroupBox:       TGroupBox;
    PortSelector:       TComboBox;
    DirectionSelector:  TRadioGroup;
    PortValueHex:       TLabeledEdit;
    PortStatusTimer:    TTimer;
    BoardSelector:      TComboBox;
    ValueBox:           TGroupBox;
    StatusBar:          TLabel;
    BoardDescription:   TLabel;
    PortValueBin:       TLabel;

    procedure MainTimerTick(Sender: TObject);
    procedure OnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PortStatusTimerTick(Sender: TObject);
    procedure ChangeBoard(Sender: TObject);
    procedure RedefinePort(Sender: TObject);
    procedure ShowPortValue();
    procedure OnCreate(Sender: TObject);

  private
    { Private declarations }
  public
    procedure SetPortStatus(s: string; millis: integer); overload;
    procedure SetPortStatus(s: string; millis: integer; color: TColor); overload;
    { Public declarations }
  end;

var
  Form1:                TForm1;
  PortStatusExpiration: TDateTime;
  PortStatusLine:       TWiseStatusLine;
  Port:                 TWisePort;
  DirectionType:        (Output = 0, Input = 1);
  i:                    integer;

  okboard, okport:      integer;

  initResult:           string;

implementation

{$R *.dfm}

procedure TForm1.MainTimerTick(Sender: TObject);
begin
     if DirectionSelector.ItemIndex = 1 then
        ShowPortValue;
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

procedure TForm1.OnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
   val, maxval: integer;
begin
   if (Key <> 13) then
      exit;

   maxval := $FF;
   case WiseBoards[BoardSelector.ItemIndex].bitsPerDaq[PortSelector.ItemIndex] of
   8:  maxval := $FF;
   4:  maxval := $F;
   end;

   val := -1;
   try
      val := StrToInt(PortValueHex.Text);
   except
      on EConvertError do begin
         SetPortStatus(Format('Bad HEX value: %s', [PortValueHex.Text]), 1500, clRed);
         PortValueHex.Text := '';
         exit;
      end;
   end;

   if (val < 0) or (val > maxval) then begin
       SetPortStatus(Format('Only positive values upto $%X', [maxval]), 1500, clRed);
       exit;
   end;

   Port.Value := val;
   ShowPortValue;
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

procedure TForm1.RedefinePort(Sender: TObject);
var
   boardno, portno, dir:   integer;
   newport:                TWisePort;
   dId:                    TDaqId;
begin
   boardno := BoardSelector.ItemIndex;
   portno  := PortSelector.ItemIndex + FIRSTPORTA;

   case DirectionSelector.ItemIndex of
    0: dir := DIGITALOUT;
    1: dir := DIGITALIN;
   end;

   if ((Port <> nil) and (dir = DIGITALOUT)) then  // when switching to an Out port, zero it out
      Port.Value := 0;

   dId := daqId(boardno, portno, dir);

   try
      newport := TWisePort.Create(WiseDaqPortNames[portno], dId);
   except begin
      SetPortStatus(Format('Board%d:%s NOT SUPPORTED!',
             [BoardSelector.ItemIndex, PortSelector.Items[PortSelector.ItemIndex]]), 2000, clRed);
      BoardSelector.ItemIndex := okboard;
      PortSelector.ItemIndex  := okport - FIRSTPORTA;

      exit;
      end;
   end;

   okboard := boardno;
   okport  := okport;

   {
      At this point the new port was successfully created, we can update the display.
      daq contains either the new values or the restored values
   }

   if (Port <> nil) then
      Port.Destroy();
   Port := newport;

   if (DirectionSelector.ItemIndex = 0) then   // output
      PortValueHex.Enabled := true
   else
      PortValueHex.Enabled := false;

   ShowPortValue;
end;

procedure TForm1.ShowPortValue();
var
   bit, nbits, val: integer;
   binVal:          String;
begin
   val   := Port.Value;
   nbits := WiseBoards[BoardSelector.ItemIndex].bitsPerDaq[PortSelector.ItemIndex];

   // make the binary display
   binVal := '';
   for bit := 0 to nbits - 1 do
       if (val AND (1 SHL bit)) <> 0 then
           binVal := '1' + binVal
       else
           binVal := '0' + binVal;
   PortValueBin.Caption := binVal;

   // show the hex dislay
   if (nbits = 8) then
      PortValueHex.Text := Format('$%2.2x', [val])
   else
      PortValueHex.Text := Format('$%1.1x', [val]);
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

       RedefinePort(Form1);
   end else begin
       BoardSelector.Text := '';
       PortSelector.Text  := '';
       SetPortStatus(initResult + ' STOPPED!', 1000000000, clRed);
       exit;
   end;
end;

initialization
   initResult := InitDaqsInfo();

finalization
  Port.Value := 0;

end.
