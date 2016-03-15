unit WiseStr;
//******************************************************************************
// UNIT NAME         WiseStr
// USED BY PROJECTS  Remote, RemoteDome, RemoteTelescope
// AUTHOR            Yiftah Lipkin
// DESCRIPTION       Various String manipulation Routines
// LAST MODIFIED     2003 Jun 10
//******************************************************************************

interface
uses
//Take Off WiseConst!
  Windows, SysUtils, StrUtils,  Dialogs, Math, Classes, Grids, ClipBrd, TelePars;//WiseConst;

//------------------------------------------------------------------------------
//function Coord2Str(incoord:HrCoord):string;     OBSOLETE
//------------------------------------------------------------------------------
function Time2Str(intime:_SYSTEMTIME):string;
//------------------------------------------------------------------------------
function TimeF2Str(time:extended):string;
//------------------------------------------------------------------------------
function CoordR2Str(coord: extended):string;
//------------------------------------------------------------------------------
//Conv. TimeString: '[-+]HH:MM:SS[.SS]' to fraction of day. [-MaxExtended] on error
function Str2TimeF(timeStr:string):extended;
//------------------------------------------------------------------------------
//Conv. CoordString: "[-+]DD:MM:SS[.SS]" to a number [PI units]. [-MaxExtended] on error
function Str2CoordR(coordStr: string):extended;
//------------------------------------------------------------------------------
function ParseStr(S:string; out pars:Tstrings;delim:char):integer;
//------------------------------------------------------------------------------
function  AppendStr(pars:Tstrings;n:integer):string;
//------------------------------------------------------------------------------
function ValidateRA(RA:string; var RARad: extended):Boolean;
//------------------------------------------------------------------------------
function ValidateHA(HA:string; var HARad:extended):Boolean;
//------------------------------------------------------------------------------
function ValidateDec(Dec:string; var DecRad:extended):Boolean;
//------------------------------------------------------------------------------
function ValidateEpoch(Sepoch:string; LimitEpoch : Boolean; MinEpoch, MaxEpoch: real; out epoch: extended):Boolean;
//------------------------------------------------------------------------------
function ValidateObjName(obj:string):Boolean;
//------------------------------------------------------------------------------
function ValidateAMLimit(var StrAMLimit:string):Boolean;
//------------------------------------------------------------------------------
procedure Sortgrid(Grid : TStringGrid; SortCol:integer; Ascending, Singed: Boolean);
procedure GridCopy(Grid: TStringGrid);

//------------------------------------------------------------------------------
function IsInt(st:string):boolean;
//------------------------------------------------------------------------------
function IsNum(S: String):Boolean;
//------------------------------------------------------------------------------



implementation

const
  Pi2Deg : extended = 180/pi;
  Deg2Pi : extended = pi/180;
  Pi2    : extended = 2*pi;
  Pi05   : extended = 0.5*pi;
//******************************************************************************
function step_delimeters(S:string; pos,len:integer;delimeter:char):integer;
//******************************************************************************

begin
    if delimeter=' ' then
       while (pos<=len) and (S[pos] in [#32,#8,#13,#10,#9]) do
             inc(pos)
    else
       while (pos<=len) and (S[pos] =delimeter) do
            inc(pos);
    Result:=pos;
end;
//******************************************************************************
function step_substr(S:string; pos,len:integer;delimeter:char):integer;
//******************************************************************************
begin
    if delimeter=' ' then
//       while (pos<=len) and (S[pos] in [#$21..#$7e]) and not(S[pos] in [#32,#8,#13,#10,#9]) do
       while (pos<=len) and not(S[pos] in [#32,#8,#13,#10,#9]) do
             inc(pos)
    else
       while (pos<=len) and (S[pos]<> delimeter) do
             inc(pos);
    Result:=pos;
end;

//******************************************************************************
function ParseStr(S:string; out pars:Tstrings;delim:char):integer ;
//******************************************************************************
var
 pos,pos0,len:integer;
begin
   pos:=1;
   len:=length(S);
   pars.Clear;
   while (pos<len) do begin
      pos0:=step_delimeters(S,pos,len,delim);
      pos:=step_substr(S,pos0,len,delim);
      if pos>pos0 then
         pars.Append(copy(S,pos0,pos-pos0));
   end;
   Result := pars.Count;
end;

//******************************************************************************
function  AppendStr(pars:Tstrings;n:integer):string;
//******************************************************************************
begin
  if pars.Count=0 then
  begin
    Result:=' ';
    exit;
  end;
  Result:=pars.Strings[n];
  n:=n+1;
  while(n<pars.Count) do
  begin
    Result:=Result+' '+ pars.Strings[n];
    inc(n);
  end;
end;

{
//******************************************************************************
function Coord2Str(incoord:HrCoord):string;      OBSOLETE
//******************************************************************************
begin
  with incoord do
    Coord2Str:=Format('%0.2d:%0.2d:%0.2d.%1d',[H,M,floor(S),(floor(10*S) mod 10)]);
end;
}
//******************************************************************************
function TimeF2Str(time: extended):string;
//******************************************************************************
//Transforms time in fraction of a day format into a time-string in H:M:S format
var
 H, M, TimeSign: integer;
 S: extended;
begin
   TimeSign:=sign(time);
   time:=abs(time*24);
   H := floor(time);
   M := floor(60*(time-H));
   S := 60*(60*(time-H)-M);
   if (TimeSign=-1) then
      Result:=Format('-%0.2d:%0.2d:%0.2d.%1d',[H, M,floor(S),(floor(10*S) mod 10)])
   else
      Result:=Format('%0.2d:%0.2d:%0.2d.%1d',[H, M,floor(S),(floor(10*S) mod 10)])

end;
//******************************************************************************
function CoordR2Str(coord: extended):string;
//******************************************************************************
//Transforms coord in radians into a time-string in D:M:S format
var
 D, M, CoordSign: integer;
 S: extended;
begin
   CoordSign := sign(coord);
   coord :=abs(coord*Pi2Deg);
   D := floor(coord);
   M := floor(60*(coord-D));
   S := 60*(60*(coord-D)-M);
   if (CoordSign=-1) then
      Result:=Format('-%0.2d:%0.2d:%0.2d.%1d',[D, M,floor(S),(floor(10*S) mod 10)])
   else
      Result:=Format('%0.2d:%0.2d:%0.2d.%1d',[D, M,floor(S),(floor(10*S) mod 10)])
end;

//******************************************************************************
function Time2Str(intime:_SYSTEMTIME):string;
//******************************************************************************
begin
  with intime do
    Time2Str:=Format('%0.2d:%0.2d:%0.2d.%d',[wHour,wMinute, wSecond,
    wMilliseconds div 100]);
end;

//******************************************************************************
function Str2TimeF(TimeStr:string):extended;
//From a string: "[-+]HH:MM:SS[.SS]" 2 frac of day. Return [-MaxExtended] on error
//Delimeter may be [':',' ']
//******************************************************************************
var
   i, Sign, H, M : integer;
   S             : extended;
begin
    Result  := -MaxExtended;
    Sign    := 1;
    i       :=1;
    TimeStr := trim(TimeStr);
    if ( (Length(TimeStr)<8) OR AnsiContainsText(TimeStr,' ') OR
          ((TimeStr[1] in ['+','-']) AND (Length(TimeStr)<9)) ) then
       exit;

    if (TimeStr[1] in ['+','-']) then begin
       i := 2;
       if (TimeStr[1] = '-') then
          sign := -1;
    end;

    if ( (not(TimeStr[i+2] in [':',' '] )) OR (not(TimeStr[i+5] in [':',' '])) ) then
       exit;
    if ( (not(TimeStr[i+6] in ['0'..'9'])) OR (not(TimeStr[i+7] in ['0'..'9'])) ) then
       exit;

    H := StrToIntDef(copy(TimeStr,i, 2),-MaxInt);
    M := StrToIntDef(copy(TimeStr,i+3, 2),-MaxInt);
    S := StrToFloatDef(copy(TimeStr,i+6, length(TimeStr)-i-5),-MaxExtended);

    if ( (S<0.0) OR (S>=60.0) OR (M<0) OR (M>59) OR (H=-MaxInt) ) then
       exit;

    Result := Sign*(H/24+M/1440+S/86400);
end;

//******************************************************************************
function Str2CoordR(CoordStr: string):extended;
//Conv. CoordString: "[-+]DD:MM:SS[.SS]" to a number [PI units]. [-MaxExtended] on error
//******************************************************************************
var
   i, Sign, D, M : integer;
   S             : extended;
begin
    Result := -MaxExtended;
    Sign   := 1;
    i      := 1;
    CoordStr := trim(CoordStr);
    if ( (Length(CoordStr)<8) OR AnsiContainsText(CoordStr,' ') OR
          ((CoordStr[1] in ['+','-']) AND (Length(CoordStr)<9)) ) then
       exit;

    if (CoordStr[1] in ['+','-']) then begin
       i := 2;
       if (CoordStr[1] = '-') then
          sign := -1;
    end;

    if ( (not(CoordStr[i+2] in [':',' '] )) OR (not(CoordStr[i+5] in [':',' '])) ) then
       exit;
    if ( (not(CoordStr[i+6] in ['0'..'9'])) OR (not(CoordStr[i+7] in ['0'..'9'])) ) then
       exit;
    D := StrToIntDef(copy(CoordStr,i, 2),-MaxInt);
    M := StrToIntDef(copy(CoordStr,i+3, 2),-MaxInt);
    S := StrToFloatDef(copy(CoordStr,i+6, length(CoordStr)-i-5),-MaxExtended);

    if ( (S<0.0) OR (S>=60.0) OR (M<0) OR (M>59) OR (D=-MaxInt) ) then
       exit;

    Result:= Sign*(D+M/60+S/3600)*Deg2Pi;
end;

//******************************************************************************
function ValidateRA(ra:string; var RARad: extended):Boolean;
//******************************************************************************
begin
  Result := False;
  if (Length(ra)>=8) then begin
      RARad  := Str2TimeF(ra);
      if ( (RARad >= 0) and (RARad < 1) ) then begin
         RARad := RARad*Pi2;
         Result := TRUE;
      end;
  end;
end;

//******************************************************************************
function ValidateHA(ha:string; var HARad:extended):Boolean;
//******************************************************************************
begin
  Result := False;
  if (Length(ha)>=8) then begin
      HARad  := Str2TimeF(ha);
      if (Abs(HARad) <= 0.5) then begin
         HARad := HARad*Pi2;
         Result := TRUE;
      end;
  end;
end;

//******************************************************************************
function ValidateDec(dec:string; var DecRad:extended):Boolean;
//******************************************************************************
begin
  Result := False;
  if (Length(dec)>=8) then begin
      DecRad  := Str2CoordR(dec);
      if (Abs(DecRad) <= Pi05) then
         Result := TRUE;
  end;
end;

//******************************************************************************
function ValidateEpoch(Sepoch:string; LimitEpoch : Boolean; MinEpoch, MaxEpoch: real; out epoch: extended):Boolean;
//******************************************************************************
begin
  epoch      := StrTOFloatDef(Sepoch,-MaxExtended);
  Result := (epoch > -MaxExtended) AND (NOT(LimitEpoch) OR (LimitEpoch AND (epoch>=MinEpoch) AND (epoch<=MaxEpoch) ) );
end;

//******************************************************************************
function ValidateObjName(obj:string):Boolean;
//******************************************************************************
begin
   if (obj = '') OR  (LastDelimiter(' ',obj)>0) then
      result := FALSE
   else
      result := TRUE;
end;

//******************************************************************************
function ValidateAMLimit(var StrAMLimit:string):Boolean;
//******************************************************************************
var
  StrVal : extended;
begin
   result := TRUE;
   StrVal := StrToFloatDef(StrAMLimit, -1.0);
   if (StrVal < 1) then
    begin
      result := FALSE;
      StrAMLimit := FloatToStr(DefaultAMLimit);
    end;
   if (StrVal > AMLimit) then
    begin
      result := FALSE;
       StrAMLimit := FloatToStr(AMLimit);
    end;
end;


//******************************************************************************
procedure Sortgrid(Grid : TStringGrid; SortCol:integer; Ascending, Singed: Boolean );
//******************************************************************************
var
  SBuff,SbuffN : tstringlist;
  GBuff :tstringgrid;
  i:integer;
begin
 SBuff := tstringlist.Create;
 SBuffN := tstringlist.Create;
 GBuff := tstringgrid.Create(Nil);
 GBuff.RowCount := Grid.RowCount;
 GBuff.ColCount := Grid.ColCount;

  for i:=1 to Grid.RowCount-1 do
     if ( (Grid.Cells[SortCol,i]<>'') AND(Grid.Cells[SortCol,i][1]='-') and  Singed) then
        SBuffN.Add(AnsiReplaceText(Grid.Cells[SortCol,i]+'#'+inttostr(i),'-',' '))
     else
        SBuff.Add(AnsiReplaceText(Grid.Cells[SortCol,i]+'#'+inttostr(i),'-',' '));
     Sbuff.Sort;
     SbuffN.Sort;
  if SbuffN.Count>0 then
  for i := 0 to ((SbuffN.Count-1) div 2) do
      SbuffN.Exchange(i, SbuffN.Count-1-i );
  SBuffN.AddStrings(Sbuff);

  if Ascending then
     for i:=1 to Grid.RowCount-1 do
         GBuff.Rows[i]:= Grid.Rows[StrToInt(RightStr(SBuffN[i-1], Length(SBuffN[i-1])-LastDelimiter('#',SBuffN[i-1])))]
  else
     for i:=1 to Grid.RowCount-1 do
         GBuff.Rows[GBuff.RowCount-i]:= Grid.Rows[StrToInt(RightStr(SBuffN[i-1], Length(SBuffN[i-1])-LastDelimiter('#',SBuffN[i-1])))];

  GBuff.Rows[0] := Grid.Rows[0];
  if (not GBuff.Cols[SortCol].Equals(Grid.Cols[SortCol])) then
     for i := 1 to Grid.RowCount-1 do
         Grid.Rows[i] := GBuff.Rows[i];

  SBuff.Free;
  SBuffN.Free;
  GBuff.Free;
end;


procedure GridCopy(Grid: TStringGrid);
var
  S: string;
  C: Integer;
begin
    for C := 0 to Grid.ColCount do
      S := S + Grid.Cells[C, Grid.Row] + #9;
  ClipBoard.AsText := S;
end;

//------------------------------------------------------------------------------
function IsInt(st:string): boolean ;
var
a:integer;
begin
  result:=false;
  for a:=1 to length(st) do
         if not (st[a] in ['1','2','3','4','5','6','7','8','9','0']) then
            exit;
  result:=true;
end;
//------------------------------------------------------------------------------
function IsNum(S: String) : Boolean;
begin
  Result:=False;
  try
    StrToFloat(S);
    Result:=True;
  except
  end;
end;



// Paste  tstringlist
(*procedure TForm1.GridPaste(Grid: TStringGrid);
var
  Grect: TGridRect;
  S, CS, F: string;
  L, R, C: Byte;
begin
  GRect := StringGrid1.Selection;
  L := GRect.Left;
  R := GRect.Top;
  S := ClipBoard.AsText;
  R := R - 1;
  while Pos(#13, S) > 0 do
  begin
    R  := R + 1;
    C  := L - 1;
    CS := Copy(S, 1,Pos(#13, S));
    while Pos(#9, CS) > 0 do
    begin
      C := C + 1;
      if (C <= StringGrid1.ColCount - 1) and (R <= StringGrid1.RowCount - 1) then
        StringGrid1.Cells[C, R] := Copy(CS, 1,Pos(#9, CS) - 1);
      F := Copy(CS, 1,Pos(#9, CS) - 1);
      Delete(CS, 1,Pos(#9, CS));
    end;
    if (C <= StringGrid1.ColCount - 1) and (R <= StringGrid1.RowCount - 1) then
      StringGrid1.Cells[C + 1,R] := Copy(CS, 1,Pos(#13, CS) - 1);
    Delete(S, 1,Pos(#13, S));
    if Copy(S, 1,1) = #10 then
      Delete(S, 1,1);
  end;
end; 

   *)

end.
