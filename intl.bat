@echo off
REM Change Windows language to English (United States)

echo Installing English (United States) language pack...
dism /online /add-package /packagepath:C:\Windows\LanguagePack\en-us\lp.cab >nul 2>&1

REM Set language settings
echo Setting English (United States) as the default language...
powershell -Command "Set-WinUILanguageOverride -Language en-US"
powershell -Command "Set-WinUserLanguageList -LanguageList en-US -Force"
powershell -Command "Set-WinSystemLocale en-US"
powershell -Command "Set-Culture en-US"
powershell -Command "Set-WinHomeLocation -GeoId 244"

REM Copy settings to system accounts
echo Applying language settings to system accounts...
control intl.cpl

REM Notify user to restart the system
echo Language settings applied. Please restart your computer to apply changes.
pause
