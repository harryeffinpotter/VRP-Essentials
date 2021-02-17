@echo off
echo.
echo.
Taskkill /IM telegram.exe /F 
rmdir /s /q "%appdata%\Telegram Desktop\tdata\user_data\"
mkdir "%appdata%\Telegram Desktop\tdata\user_data\"
rmdir /s /q "%appdata%\Telegram Desktop\tdata\user_data#2\"
rmdir /s /q "%appdata%\Telegram Desktop\tdata\user_data#3\"
echo.
echo.
echo.
echo Telegram cache cleared.
echo.
echo.
echo.
