; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "VRP Essentials"
#define MyAppVersion "1.0.4"
#define MyAppPublisher "@HarryEffinPotter"
#define MyAppURL "https://t.me/VRPirates"
#define MyAppExeName "VRP Essentials.exe"

#define MyAppName3 "Rookie's Sideloader"
#define MyAppVersion3 "1.17VU-HF"
#define MyAppPublisher3 "Rookie and friends (Pmow/HFP/VRP)"
#define MyAppURL3 "https://t.me/VRPirates"
#define MyAppExeName3 "Sideloader Launcher.exe"

#define MyAppName2 "VDL1.1(drag+drop game exe on this)"
#define MyAppVersion2"1.1"
#define MyAppPublisher2 "VRP"
#define MyAppURL2 "https://t.me/VRPirates"
#define MyAppExeName2 "VDL.bat"

#define MyAppName4 "QuestUnderground settings(90hz,customres,q2patched games)"
#define MyAppVersion4 "1.3"
#define MyAppPublisher4 "Steam Underground"
#define MyAppURL4 "https://cs.rin.ru"
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
AppId={{1541B406-91F7-415D-8A44-9246CEC239B6}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={%USERPROFILE}\Documents\{#MyAppName}
DisableProgramGroupPage=yes
LicenseFile=C:\Rookie\RookieInstaller\License.txt
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=C:\Rookie
OutputBaseFilename=VRP Essentials(NO AV EXCL)
SetupIconFile=C:\Rookie\RookieInstaller\Icons\Essentials.ico
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
Name: "desktopicon"; Description: "Create a Rookie's Sideloader shortcut.(Download+Install Quest Games)"; GroupDescription: "Required"
Name: "GUI"; Description: "Create a VRP - Rclone GUI shortcut(used to download PCVR and Quest games)."; GroupDescription: "Required"
Name: "QU"; Description: "Create a QUsettings 1.3 shortcut(username, resolution, hz) for QU/VRP releases(QU, VRP, q2patched, 90hz, customres)."; GroupDescription: "Recommended"
Name: "TUTRC"; Description: "-VRP - Rclone GUI tutorial"; GroupDescription: "Recommended";   Flags: unchecked
Name: "BM"; Description: "VRP - Batmakers (Recommended if you are playing any PCVR, this will help you "; GroupDescription: "PCVR"; Flags: unchecked
Name: "TUTBM"; Description: "-VRP - Batmakers tutorial."; GroupDescription: "PCVR"; Flags: unchecked
Name: "VDL"; Description: "Create a VDL shortcut(I.E.: a temporary version of Batmakers that can be used on the fly.)"; GroupDescription: "PCVR"; Flags: unchecked
Name: "ID"; Description: "Directory shortcut for the main Install Directory."; GroupDescription: "Folder Shortcuts"; Flags: unchecked
Name: "BD"; Description: "Directory shortcut for the useful tools/bat scripts directory."; GroupDescription: "Folder Shortcuts"; Flags: unchecked


[Files]
Source: "C:\Rookie\RookieInstaller\Sideloader Launcher.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Rookie\RookieInstaller\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
 
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autodesktop}\{#MyAppName3}"; Filename: "{app}\{#MyAppExeName3}"; IconFilename: "{app}\Icons\launcher.ico"; Tasks: desktopicon
Name: "{autodesktop}\{#MyAppName2}"; Filename: "{app}\bats\{#MyAppExeName2}"; IconFilename: "{app}\Icons\VDL.ico"; Tasks: VDL
Name: "{autodesktop}\{#MyAppName4}"; Filename: "{app}\bats\{#MyAppExeName4}"; IconFilename: "{app}\Icons\QU.ico"; Tasks: QU
Name: "{autodesktop}\VRP - Rclone Tutorial"; Filename: "{app}\VRP - Rclone Tutorial.url"; IconFilename: "{app}\Icons\YT.ico"; Tasks: TUTRC
Name: "{autodesktop}\Installation Folder"; Filename: "{app}\"; Tasks: ID
Name: "{autodesktop}\Bat Folder"; Filename: "{app}\bats\"; Tasks: BD
Name: "{autodesktop}\VRP - Bat Makers"; Filename: "{app}\VRP Batmaker"; Tasks: BM
Name: "{autodesktop}\VRP - Bat Makers\VRP - Batmaker Tutorial"; Filename: "{app}\VRP Batmaker Tutorial.url"; IconFilename: "{app}\Icons\YT.ico"; Tasks: TUTBM
