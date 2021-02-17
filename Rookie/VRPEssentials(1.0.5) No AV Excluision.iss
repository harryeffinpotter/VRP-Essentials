; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "VRP Essentials"
#define MyAppVersion "1.0.5"
#define MyAppPublisher "VRP"
#define MyAppURL "https://t.me/VRPirates"
#define MyAppExeName "VRP Essentials.exe"

#define MyAppName3 "Rookie's Sideloader"
#define MyAppVersion3 "1.17VU-HF"
#define MyAppPublisher3 "VRP"
#define MyAppURL3 "https://t.me/VRPirates"
#define MyAppExeName3 "Sideloader Launcher.exe"

#define MyAppName2 "VDL1.1(drag+drop game exe on this)"
#define MyAppVersion2"1.1"
#define MyAppPublisher2 "VRP"
#define MyAppURL2 "https://t.me/VRPirates"
#define MyAppExeName2 "VDL.bat"

#define MyAppName4 "QuestUnderground settings(90hz,customres,q2patched games)"
#define MyAppVersion4 "1.3"
#define MyAppPublisher4 "VRP"
#define MyAppURL4 "https://t.me/VRPirates"
#define MyAppExeName4 "QUSettings.bat"

#define MyAppName5 "VRP Rclone Gui"
#define MyAppExeName5 "RcloneBrowser.exe"
#define MyAppVersion5 "1.0"
#define MyAppPublisher5 "VRP"
#define MyAppURL5 "https://t.me/VRPirates"

[code]
function PrepareToInstall(var NeedsRestart: Boolean): String;
var
   ResultCode: integer;
begin
   
  ExtractTemporaryFile('adb.exe') ;
  ExtractTemporaryFile('AdbWinApi.dll') ;
  ExtractTemporaryFile('killadb.bat') ;
  Exec(ExpandConstant('{tmp}\killadb.bat'), '', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
  end;
[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{68B92DCA-4E06-43B4-80DB-A4203D632CEE}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={%USERPROFILE}\Documents\{#MyAppName}
DisableProgramGroupPage=yes
LicenseFile=RookieInstaller\License.txt
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=CompiledSetupFiles
OutputBaseFilename=VRP Essentials
SetupIconFile=RookieInstaller\Icons\Essentials.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
Uninstallable=yes
PrivilegesRequired=admin

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"


[UninstallRun]
Filename: "{app}\killadb.bat"; Flags: runhidden runascurrentuser
 
[UninstallDelete]
;This works only if it is installed in default location
Type: filesandordirs; Name: "{%userprofile}\Documents\{#MyAppName}"


;This works if it is installed in custom location
Type: files; Name: "{app}\*"; 
Type: filesandordirs; Name: "{app}"

[Tasks]
Name: "desktopicon"; Description: "Rookie's Sideloader(download+install Quest games)."; GroupDescription: "Recommended shortcuts:"
Name: "GUI"; Description: "VRP RcloneBrowser GUI (used to download PCVR + Quest games for manual installation)."; GroupDescription: "Recommended shortcuts:"
Name: "QU"; Description: "QUSettings (used to change username and resolution for Quest Underground releases)."; GroupDescription: "Optional shortcut:"
Name: "BM"; Description: "VRP - BatMakers (permanently fixes issues with VD by helping user make custom batch files)."; GroupDescription: "PCVR ONLY shortcuts:"; Flags: unchecked
Name: "VDL"; Description: "Virtual Desktop Launcher (temporarily fixes issues with VD but doesn't create batch files)."; GroupDescription: "PCVR ONLY shortcuts:"; Flags: unchecked
Name: "ID"; Description: "Optional directory shortcut for the VRP Essentials install directory."; GroupDescription: "Folder shortcuts:"; Flags: unchecked
Name: "BD"; Description: "Optional directory shortcut for the useful tools/bat scripts directory."; GroupDescription: "Folder shortcuts:"; Flags: unchecked


[Files]
Source: "RookieInstaller\Sideloader Launcher.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "RookieInstaller\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
 
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autodesktop}\{#MyAppName3}"; Filename: "{app}\{#MyAppExeName3}"; IconFilename: "{app}\Icons\Rookie.ico"; Tasks: desktopicon
Name: "{autodesktop}\{#MyAppName2}"; Filename: "{app}\bats\{#MyAppExeName2}"; IconFilename: "{app}\Icons\VDL.ico"; Tasks: VDL
Name: "{autodesktop}\{#MyAppName4}"; Filename: "{app}\bats\{#MyAppExeName4}"; IconFilename: "{app}\Icons\QU.ico"; Tasks: QU
Name: "{autodesktop}\{#MyAppName5}"; Filename: "{app}\VRP GUI\{#MyAppExeName5}"; IconFilename: "{app}\Icons\RCLONE.ico"; Tasks: GUI
Name: "{autodesktop}\Installation Folder"; Filename: "{app}\"; Tasks: ID
Name: "{autodesktop}\Bat Folder"; Filename: "{app}\bats\"; Tasks: BD
Name: "{autodesktop}\VRP - Bat Makers"; Filename: "{app}\VRP Batmaker"; Tasks: BM
