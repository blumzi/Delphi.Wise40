unit WiseLogger;

interface

uses SysUtils, DateUtils;

type TWiseLogger = class

private
  name:     string;      // The name of the logger, e.g. 'dome-agent'
  path:     string;      // The name of the log-file
  f:        TextFile;    // Handle to the file
  function makeFullPath: string;

public
  procedure   log(s: string);
  constructor Create(name: string);
end;

implementation

(*
  We use lazy opening of the log-file, only when a log-line is actually written.
  Every time a log line is written we check if the date changed in the meanwhile and
    update the fullpath accordingly.
*)

const topLogDir: string = 'c:\Logs';

function TWiseLogger.makeFullPath;
var
  x: TdateTime;
  day, month, year: integer;
begin
  x := Now;
  if HourOfTheDay(x) >= 12 then
    x := IncDay(x, 1);
    
  day   := DayOfTheMonth(x);
  month := MonthOfTheYear(x);
  year  := YearOf(x);

  Result := topLogDir + '\' + Format('%d-%02d-%02d', [year, month, day]) + '\' + Self.name + '.txt';
end;

constructor TWiseLogger.Create(name: string);
begin
  Self.name := name;
  Self.path := '';
end;

procedure TWiseLogger.log(s: string);
var
  currpath: string;
begin
  currpath := makeFullPath;
  if (currpath <> Self.path) then begin
    Self.path := currpath;
    if not ForceDirectories(ExtractFileDir(Self.path)) then
      exit;

    AssignFile(Self.f, Self.path);
    if FileExists(Self.path) then
      Append(Self.f)
    else
      Rewrite(Self.f);
  end;

  Writeln(Self.f, FormatDateTime('ddddd hh:nn:ss.zzz', Now) + ': ' + s);
  Flush(Self.f);
end;

end.
