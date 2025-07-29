[Setup]
AppName=Tateti
AppVersion=1.0.0
DefaultDirName={pf}\Tateti
DefaultGroupName=Tateti
OutputDir=..\bin
OutputBaseFilename=Tateti_Setup
Compression=lzma
SolidCompression=yes

[Files]
Source: "..\bin\Tateti.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\bin\Updater.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\version.json"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\Tateti"; Filename: "{app}\Tateti.exe"
Name: "{group}\Updater"; Filename: "{app}\Updater.exe"
Name: "{commondesktop}\Tateti"; Filename: "{app}\Tateti.exe"

[Run]
Filename: "{app}\Tateti.exe"; Description: "Ejecutar Tateti"; Flags: postinstall nowait skipifsilent
