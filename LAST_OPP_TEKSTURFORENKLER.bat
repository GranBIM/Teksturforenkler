@echo off
cd /d "%~dp0"
powershell -ExecutionPolicy Bypass -File "%~dp0push-teksturforenkler.ps1"
if %errorlevel% neq 0 (
    echo.
    echo *** Det oppstod en feil. Se melding ovenfor. ***
    pause
) else (
    pause
)
