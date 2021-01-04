@ECHO OFF
cd ..
cd adb
echo.
echo.
echo Power on your quest and connect it now. 
echo.
echo Quest 1 cannot use 90hz settings.
echo.
echo Resolution settings will work for both but are experimental. Enter a resolution of 0 to reset to default.
echo.
echo Power cycle your device to reset global settings to default (90hz-off)
echo.
echo However, specific game settings will not reset after power cycle.
echo.
echo.
TIMEOUT /T 10
adb start-server
echo.
echo.
echo Would you like to change settings for a single QU game or all QU games? 
echo To change a single game you must know the exact package name. 
echo NOTE: Settings for ALL games do not persist after a reboot, however settings for a specific game/package DO persist. 
echo.
echo.
:choice1
set /P z=Change settings for a single game or all[1 = single game, 2 = all]?
if /I "%z%" EQU "1" goto :single
if /I "%z%" EQU "2" goto :all
goto :choice1

:all

:choice2
set /P c=Would you like to enable or disable 90hz on all games[1 = Enable/2 = Disable]?
if /I "%c%" EQU "1" goto :90hz
if /I "%c%" EQU "2" goto :skip90
goto :choice2

:90hz
adb shell settings put global 90hz_global 1
adb shell settings put global 90hzglobal 1
adb shell setprop debug.oculus.refreshRate 90
echo.
echo.
echo 90hz enabled for all patched games.
echo.
echo.
goto :choice3

:skip90
adb shell settings put global 90hz_global 0
adb shell settings put global 90hzglobal 0
adb shell setprop debug.oculus.refreshRate 72
echo.
echo.
echo 90hz disabled for all patched games.
echo.
echo.

:choice3
set /P d=Would you like to set a custom resolution for all games[Y/N]?
if /I "%d%" EQU "Y" goto :res
if /I "%d%" EQU "N" goto :skipres
goto :choice3

:res
set /p gWidth=Please enter your desired resolution WIDTH for all games(Resolution = WIDTH X HEIGHT. 2048x2048 is a good baseline.): 
adb shell setprop debug.oculus.textureWidth %gWidth%
echo.
echo.
echo Resolution width set to %gWidth%.
echo.
echo.
set /p gHeight=Please enter your desired resolution HEIGHT for all games(Resolution = WIDTH X HEIGHT.): 
adb shell setprop debug.oculus.textureHeight %gHeight%
echo.
echo.
echo Resolution Height set to %gHeight%.
echo.
echo %gWidth%x%gHeight% enabled for all games.
echo.
echo.

:skipres
:choice4
echo.
echo.
set /p e=Would you like to set your online Username for all games?[Y/N]?
if /I "%e%" EQU "Y" goto :user
if /I "%e%" EQU "N" goto :skipuser
goto :choice4

:user
set /p usrnm=Enter Username: 
echo %usrnm%
adb shell settings put global username %usrnm%
echo.
echo.
echo Username set as %usrnm%.
echo.
echo.
goto :skipuser




:single
echo.
echo.
set /p pckgnm=Enter Package Name(E.G.: com.SDI.TWD, com.downpourinteractive.onward, etc.):
echo.
echo.
echo Package Name set as: %pckgnm%
echo.
echo.
:choice5
set /P y=Would you like to enable or disable 90hz for %pckgnm%?[1=enable/2=disable?]
if /I "%y%" EQU "1" goto :90hzp
if /I "%y%" EQU "2" goto :90hzno
goto :choice5

:90hzp
adb shell settings put global 90hz_%pckgnm% 1
adb shell setprop debug.oculus.refreshRate 90
echo.
echo.
echo 90hz enabled for %pckgnm%.
echo.
echo.
goto :skip90p

:90hzno
adb shell settings put global 90hz_%pckgnm% 0
adb shell setprop debug.oculus.refreshRate 72
echo.
echo.
echo 90hz disabled for %pckgnm%.
echo.
echo.

:skip90p
:choice6
set /P v=Would you like to set a custom resolution for %pckgnm%? (Type "RESET" without the quotes to reset the resolution for this title to DEFAULT.) [Y/N/RESET]:
if /I "%v%" EQU "Y" goto :ress
if /I "%v%" EQU "N" goto :skipress
if /I "%v%" EQU "RESET" goto :CLEARRES
goto :choice6

:CLEARRES
adb shell settings delete global texture_size_%pckgnm%
echo.
echo.
echo Custom resolution for %pckgnm% has been cleared.
echo.
echo.
goto :choice6

:ress
set /p sres=Enter desired resolution per eye (0=reset to default):
adb shell settings put global texture_size_%pckgnm% %sres%
echo.
echo.
echo Resolution of %sres%x%sres% enabled for %pckgnm%.
echo.
echo.

:skipress
:choice7
echo.
echo.
set /P su=Would you like to set your online username for %pckgnm%?[Y/N]?
if /I "%su%" EQU "Y" goto :suser
if /I "%su%" EQU "N" goto :skipuser
goto :choice7
 
:suser
set /p susrnm=Enter Username: 
adb shell settings put global username_%pckgnm% %susrnm%
echo.
echo.
echo Username set as %susrnm% for %pckgnm%.
echo.
echo.


:skipuser
echo.
echo.
pause
exit


