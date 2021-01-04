@echo off
cd ..
cd adb

echo.
echo.
echo.
echo ========================
echo ==Connect your Quest 2==
echo ========================
TIMEOUT /T 10
echo.
echo.
echo.
echo ========================
echo ==Starting ADB server.==
echo ========================
echo.
echo.
echo.
@echo off
adb start-server
TIMEOUT /T 5
adb shell setprop debug.oculus.refreshRate 90
echo.
echo.
echo.
echo ========================
echo ======90HZ Enabled======
echo ========================
echo.
echo.
echo.
TIMEOUT /T 3

exit