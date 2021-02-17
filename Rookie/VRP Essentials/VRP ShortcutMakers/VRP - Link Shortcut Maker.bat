@echo off
setlocal enableExtensions disableDelayedExpansion

@echo.
@echo.
@echo Oculus Link Shortcut Maker (By [VRP]HarryEffingPotter)
@ECHO. 
@echo.
pause
:choice1
set /P z=Would you like to launch with custom arguments(in addition to -Steam and -VR)[Y/N]?
if /I "%z%" EQU "Y" goto :custom
if /I "%z%" EQU "N" goto :standard
goto :choice1



:standard

cd "%~dp1"
echo "%~nx1" -Steam -VR > _LinkSteamVR.bat
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%HOMEDRIVE%%HOMEPATH%\Desktop\%~n1.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%~dp1\_LinkSteamVR.bat" >> CreateShortcut.vbs
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
echo "%~nx1" -Steam -VR ^%cstm% > _LinkCustom.bat
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%HOMEDRIVE%%HOMEPATH%\Desktop\%~n1(custom args).lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%~dp1\_LinkCustom.bat" >> CreateShortcut.vbs
echo oLink.WorkingDirectory = "%~dp1" >> CreateShortcut.vbs
echo oLink.IconLocation = "%~1" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs

cscript CreateShortcut.vbs
del CreateShortcut.vbs

goto :end

:end
endlocal

