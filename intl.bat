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

REM Automatically copy settings to Welcome screen and System accounts
echo Applying language settings to Welcome screen and system accounts...
reg add "HKEY_CURRENT_USER\Control Panel\International\Geo" /v Nation /t REG_SZ /d 244 /f
reg add "HKEY_CURRENT_USER\Control Panel\International" /v Locale /t REG_SZ /d 00000409 /f
reg add "HKEY_USERS\.DEFAULT\Control Panel\International" /v Locale /t REG_SZ /d 00000409 /f

REM Notify user
echo Language settings applied. Please restart your computer to apply changes.
pause
