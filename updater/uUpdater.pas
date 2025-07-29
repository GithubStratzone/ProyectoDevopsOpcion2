unit uUpdater;

interface

uses
  Winapi.Windows,Winapi.ShellAPI, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Net.HttpClient, System.Net.URLClient, System.Net.HttpClientComponent, System.JSON, TlHelp32;

const
  LOCAL_VERSION_FILE = 'version.json';
  REMOTE_VERSION_URL = 'https://githubstratzone.github.io/ProyectoDevopsOpcion2/updates/version.json';
  REMOTE_INSTALLER_URL = 'https://githubstratzone.github.io/ProyectoDevopsOpcion2/updates/Tateti_Setup.exe';
  LOCAL_INSTALLER_FILE = 'Tateti_Setup.exe';
  MAIN_APP_NAME = 'Tateti.exe';

type
  TfrmUpdater = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    procedure CheckForUpdates;
    function GetLocalVersion: string;
    function GetRemoteVersion: string;
    procedure CloseRunningApp(const ExeName: string);
    procedure DownloadInstaller;
    procedure RunInstallerSilently;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpdater: TfrmUpdater;

implementation

{$R *.dfm}

procedure TfrmUpdater.FormCreate(Sender: TObject);
begin
  CheckForUpdates;
end;

procedure TfrmUpdater.CheckForUpdates;
var
  localVer, remoteVer: string;
begin
  try
    localVer := GetLocalVersion;
    remoteVer := GetRemoteVersion;

    if localVer <> remoteVer then
    begin
      CloseRunningApp(MAIN_APP_NAME);
      DownloadInstaller;
      RunInstallerSilently;
      Application.Terminate;
    end;
  except
    on E: Exception do
      ShowMessage('Error durante la actualización: ' + E.Message);
  end;
end;

function TfrmUpdater.GetLocalVersion: string;
var
  sl: TStringList;
  json: TJSONObject;
begin
  if not FileExists(LOCAL_VERSION_FILE) then Exit('');

  sl := TStringList.Create;
  try
    sl.LoadFromFile(LOCAL_VERSION_FILE);
    json := TJSONObject.ParseJSONValue(sl.Text) as TJSONObject;
    if Assigned(json) then
      Result := json.GetValue<string>('version')
    else
      Result := '';
  finally
    sl.Free;
  end;
end;

function TfrmUpdater.GetRemoteVersion: string;
var
  http: TNetHTTPClient;
  response: string;
  json: TJSONObject;
begin
  http := TNetHTTPClient.Create(nil);
  try
    response := http.Get(REMOTE_VERSION_URL).ContentAsString(TEncoding.UTF8);
    json := TJSONObject.ParseJSONValue(response) as TJSONObject;
    if Assigned(json) then
      Result := json.GetValue<string>('version')
    else
      Result := '';
  finally
    http.Free;
  end;
end;

procedure TfrmUpdater.CloseRunningApp(const ExeName: string);
var
  SnapShot: THandle;
  ProcEntry: TProcessEntry32;
begin
  SnapShot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  ProcEntry.dwSize := SizeOf(ProcEntry);

  if Process32First(SnapShot, ProcEntry) then
  begin
    repeat
      if SameText(ProcEntry.szExeFile, ExeName) then
      begin
        TerminateProcess(OpenProcess(PROCESS_TERMINATE, False, ProcEntry.th32ProcessID), 0);
        Break;
      end;
    until not Process32Next(SnapShot, ProcEntry);
  end;

  CloseHandle(SnapShot);
end;

procedure TfrmUpdater.DownloadInstaller;
var
  http: TNetHTTPClient;
  response: IHTTPResponse;
  fileStream: TFileStream;
begin
  http := TNetHTTPClient.Create(nil);
  try
    fileStream := TFileStream.Create(LOCAL_INSTALLER_FILE, fmCreate);
    try
      response := http.Get(REMOTE_INSTALLER_URL, fileStream);
    finally
      fileStream.Free;
    end;
  finally
    http.Free;
  end;
end;

procedure TfrmUpdater.RunInstallerSilently;
begin
  ShellExecute(0, 'open', PChar(LOCAL_INSTALLER_FILE),
    PChar('/verysilent /norestart'), nil, SW_SHOWNORMAL);
end;

end.
