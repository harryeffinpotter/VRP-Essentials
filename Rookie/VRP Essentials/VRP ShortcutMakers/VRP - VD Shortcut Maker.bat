@echo off
setlocal enableExtensions disableDelayedExpansion



@echo.
@echo.
@echo Virtual Desktop Shortcut Maker (By [VRP]HarryEffingPotter)
@ECHO. 
@echo.
pause
:choice1
set /P z=Would you like to launch with custom arguments(in addition to -Steam and -VR)[Y/N]?
if /I "%z%" EQU "Y" goto :custom
if /I "%z%" EQU "N" goto :standard
goto :choice1



:standard

:choice2
set /P tt=Would you like to launch with Standard arguments?(-steam and -VR)[Y/N]?
if /I "%tt%" EQU "Y" goto :withsteamvr
if /I "%tt%" EQU "N" goto :standardwo
goto :choice2

:standardwo
cd "%~dp1"
echo "C:\Program Files\Virtual Desktop Streamer\VirtualDesktop.Streamer.exe" "%~nx1" > "_VD_Plain.bat"
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%HOMEDRIVE%%HOMEPATH%\Desktop\%~n1(Virtual Desktop no arguments).lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%~dp1\_VD_Plain.bat" >> CreateShortcut.vbs
echo oLink.WorkingDirectory = "%~dp1" >> CreateShortcut.vbs
echo oLink.IconLocation = "%~1" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs

cscript CreateShortcut.vbs
del CreateShortcut.vbs
goto :end

:withsteamvr
cd "%~dp1"
echo "C:\Program Files\Virtual Desktop Streamer\VirtualDesktop.Streamer.exe" "%~nx1" -Steam -VR > "_VDSteam_VR.bat"
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%HOMEDRIVE%%HOMEPATH%\Desktop\%~n1(Virtual Desktop).lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%~dp1\_VDSteam_VR.bat" >> CreateShortcut.vbs
echo oLink.WorkingDirectory = "%~dp1" >> CreateShortcut.vbs
echo oLink.IconLocation = "%~1" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs

cscript CreateShortcut.vbs
del CreateShortcut.vbs
goto :end

:Custom
echo.
echo.
set /p cstm=Enter arguments(EG:"-Steam -VR -Windowed", no quotes): 
echo.
echo.
echo Arguments set as %cstm%
echo.
echo.
TIMEOUT /T 3
cd "%~dp1"
echo "C:\Program Files\Virtual Desktop Streamer\VirtualDesktop.Streamer.exe" "%~nx1" -Steam -VR ^%cstm% > "_VD_Custom.bat"

echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%HOMEDRIVE%%HOMEPATH%\Desktop\%~n1(Virtual Desktop and custom arguments).lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%~dp1\_VD_Custom.bat" >> CreateShortcut.vbs
echo oLink.WorkingDirectory = "%dp1" >> CreateShortcut.vbs
echo oLink.IconLocation = "%~1" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs

cscript CreateShortcut.vbs
del CreateShortcut.vbs
goto :end

:end
endlocal
