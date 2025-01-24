@echo off
REM Change Windows language to English (United States) for Windows 10/11

echo Installing English (United States) language pack...
dism /online /add-package /packagepath:C:\Windows\LanguagePack\en-us\lp.cab >nul 2>&1

REM Set English (United States) as the default language
echo Setting English (United States) as the default language...
powershell -Command "Set-WinUILanguageOverride -Language en-US"
powershell -Command "Set-WinUserLanguageList -LanguageList en-US -Force"
powershell -Command "Set-WinSystemLocale en-US"
powershell -Command "Set-Culture en-US"
powershell -Command "Set-WinHomeLocation -GeoId 244"

REM Copy language settings to Welcome screen and system accounts
echo Applying language settings to Welcome screen and system accounts...
control intl.cpl,, /f:"%~dp0intl.xml"

REM Notify user to restart
echo Language settings applied successfully. Please restart your computer to apply changes.
pause
