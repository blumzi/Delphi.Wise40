unit WiseStatusLine;

interface

uses Classes, Dialogs, StdCtrls, ExtCtrls, DateUtils, Graphics, SysUtils;

type TWiseStatusLine = class(TLabel)
 private
  timer:          TTimer;
  expiration:     TDateTime;

 public
  constructor Create(owner: TComponent); override;
  procedure   Show(msg: string; millis: integer = -1; color: TColor = clWindowText);
  procedure   Clear();

  procedure   OnTimer(Sender: TObject);
end;


implementation

procedure TWiseStatusLine.OnTimer(Sender: TObject);
begin
  if CompareTime(Now, Self.expiration) = 1 then
    Self.Clear;
end;

constructor TWiseStatusLine.Create(owner: TComponent);
begin
  inherited Create(owner);

  Self.timer          := TTimer.Create(nil);
  Self.timer.Interval := 100;
  Self.timer.OnTimer  := OnTimer;
end;

procedure TWiseStatusLine.Show(msg: string; millis: integer = -1; color: TColor = clWindowText);
begin
     Self.Font.Color := color;
     Self.Caption    := msg;
     if millis = -1 then
       Self.expiration := IncYear(Now, 1)
     else
       Self.expiration := IncMilliSecond(Time(), millis);
end;

procedure TWiseStatusLine.Clear();
begin
     Self.Caption := '';
end;

end.
