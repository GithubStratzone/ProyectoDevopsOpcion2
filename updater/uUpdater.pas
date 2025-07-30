unit uUpdater;

interface

uses
  Winapi.Windows,Winapi.ShellAPI, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.IOUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Net.HttpClient, System.Net.URLClient, System.Net.HttpClientComponent, System.JSON, TlHelp32;

const
  REMOTE_VERSION_URL = 'https://githubstratzone.github.io/ProyectoDevopsOpcion2/updates/version.json';
  MAIN_APP_NAME = 'Tateti.exe';
  LOCAL_EXE = 'Tateti.exe';
  LOCAL_VERSION = '1.0.0'; // hardcoded local versión
  VERSION_URL = 'https://githubstratzone.github.io/ProyectoDevopsOpcion2/updates/version.json';

type
  TfrmUpdater = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpdater: TfrmUpdater;

procedure CloseRunningApp(const ExeName: string);
procedure CheckAndUpdate;

implementation

{$R *.dfm}

procedure TfrmUpdater.FormCreate(Sender: TObject);
begin
  CheckAndUpdate;
end;

procedure CloseRunningApp(const ExeName: string);
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

procedure DownloadFile(const URL, DestFile: string);
var
  http: TNetHTTPClient;
  fs: TFileStream;
begin
  http := TNetHTTPClient.Create(nil);
  try
    fs := TFileStream.Create(DestFile, fmCreate);
    try
      http.Get(URL, fs);
    finally
      fs.Free;
    end;
  finally
    http.Free;
  end;
end;

procedure CheckAndUpdate;
var
  http: TNetHTTPClient;
  response: string;
  json: TJSONObject;
  remoteVersion, fileName, downloadURL: string;
  tmpFile: string;
begin
  http := TNetHTTPClient.Create(nil);
  try
    response := http.Get(VERSION_URL).ContentAsString(TEncoding.UTF8);
    json := TJSONObject.ParseJSONValue(response) as TJSONObject;

    remoteVersion := json.GetValue<string>('version');
    fileName := json.GetValue<string>('filename');
    downloadURL := json.GetValue<string>('url');

    if remoteVersion <> LOCAL_VERSION then
    begin
      ShowMessage('Nueva versión encontrada: ' + remoteVersion);

      // 1. Descargar el nuevo exe
      tmpFile := TPath.Combine(TPath.GetTempPath, fileName);
      DownloadFile(downloadURL, tmpFile);

      // 2. Cerrar app si está abierta
      CloseRunningApp(LOCAL_EXE);
      Sleep(1000); // Espera 1s para liberar el archivo

      // 3. Reemplazar
      DeleteFile(LOCAL_EXE);
      RenameFile(tmpFile, LOCAL_EXE);

      // 4. Relanzar
      ShellExecute(0, 'open', PChar(LOCAL_EXE), nil, nil, SW_SHOWNORMAL);

      Application.Terminate;
    end;
  finally
    http.Free;
  end;
end;

end.
