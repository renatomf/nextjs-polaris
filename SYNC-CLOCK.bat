@echo off
echo ========================================
echo   Syncing System Clock for Clerk
echo ========================================
echo.
echo This requires Administrator privileges.
echo.
pause

REM Try to sync the clock
w32tm /resync

if %ERRORLEVEL% EQU 0 (
    echo.
    echo SUCCESS: Clock synced!
    echo.
    echo Next steps:
    echo 1. Clear browser cookies for localhost:3000
    echo 2. Restart your dev server (npm run dev)
) else (
    echo.
    echo ERROR: Could not sync clock.
    echo.
    echo Please run this file as Administrator:
    echo Right-click this file ^> Run as administrator
    echo.
)

echo.
pause
