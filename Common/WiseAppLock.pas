unit WiseAppLock;

interface

uses
  SysUtils, Windows, Dialogs;

const
  lockDir:  string = 'C:\Locks';
  crlf:     string = #10#13;

  (*
  ** Creates a 'single application instance' lock-file.
  ** The file's path is C:\Locks\<app-name>.lock, where <app-name>
  **  is provided at object Create time.
  ** If the application dies or is killed, the lock is removed by the Windows.
  *)
type TWiseAppLock = class
  private appName:    string;
  private fileName:   string;
  private fileHandle: THandle;
  private fileSize:   integer;

public
  function    tryLock: boolean;
  procedure   unlock;
  function    path: string;
  constructor Create(appName: string);
end;

implementation

constructor TWiseAppLock.Create(appName: string);

begin
  if not DirectoryExists(lockDir) then
     ForceDirectories(lockDir);

  Self.appName  := appName;
  Self.fileName := lockDir + '\' + appName + '.lock';

end;

function TWiseAppLock.tryLock: boolean;
begin
  Result := False;
  try
    Self.fileHandle := CreateFile(PChar(Self.fileName),GENERIC_READ, 0, nil, OPEN_ALWAYS,FILE_ATTRIBUTE_NORMAL,0);
    Self.fileSize   := GetFileSize(Self.fileHandle, nil);
    if LockFile(Self.fileHandle,0,0,Self.fileSize,0) then
      Result := True;
  except
    end;
  if Result = False then
    ShowMessage(
        crlf +
        'Cannot lock "' + Self.fileName + '"!' + crlf +
        crlf +
        'There may be another "' + Self.appName + '" running!  ' + crlf
    );
end;

procedure TWiseAppLock.unlock;
begin
  UnlockFile(Self.fileHandle,0,0,Self.fileSize,0);
  CloseHandle(Self.fileHandle);
end;

function TWiseAppLock.path: string;
begin
  Result := Self.fileName;
end;

end.
