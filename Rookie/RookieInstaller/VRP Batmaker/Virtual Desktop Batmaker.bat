@echo off
setlocal enableExtensions disableDelayedExpansion

:choice1
set /P z=Would you like to launch with additional custom arguments(-Steam and -VR included by default)[Y/N]?
if /I "%z%" EQU "Y" goto :custom
if /I "%z%" EQU "N" goto :standard
goto :choice1

:standard

echo "C:\Program Files\Virtual Desktop Streamer\VirtualDesktop.Streamer.exe" "%~1" -Steam -VR ^%cstm% > _VDStandard.bat
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

echo "C:\Program Files\Virtual Desktop Streamer\VirtualDesktop.Streamer.exe" "%~1" -Steam -VR ^%cstm% > _VDCustom.bat

goto :end

:end
endlocal
