@echo off
title Install Rail-LCA Add-in
color 0B

echo.
echo =====================================================
echo   Rail-LCA Add-in — Register manifest with Excel
echo =====================================================
echo.
echo IMPORTANT: Edit manifest.xml FIRST and replace
echo   YOUR-USERNAME  with your GitHub username
echo   YOUR-REPO      with your GitHub repository name
echo.
echo Press any key to continue with registration, or
echo close this window to cancel and edit manifest.xml first.
echo.
pause

:: Path to this folder (where manifest.xml lives)
set ADDIN_DIR=%~dp0
set MANIFEST=%ADDIN_DIR%manifest.xml

if not exist "%MANIFEST%" (
    echo ERROR: manifest.xml not found in %ADDIN_DIR%
    pause
    exit /b 1
)

echo Registering: %MANIFEST%
echo.

:: Register in Excel developer manifest catalog
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\WEF\Developer" /v "RailLCAAddin" /t REG_SZ /d "%MANIFEST%" /f

if %errorlevel% equ 0 (
    echo.
    echo ============================================
    echo  SUCCESS! Add-in registered with Excel.
    echo ============================================
    echo.
    echo Next steps:
    echo  1. Open Rail-LCA.xlsx in Excel
    echo  2. If prompted "This add-in is not verified"
    echo     click "Trust this add-in"
    echo  3. Look for the "Rail-LCA" tab in the ribbon
    echo  4. Click any of the 3 buttons to open a pane
    echo.
    echo NOTE: You do NOT need to run a local server.
    echo       The add-in loads directly from GitHub Pages.
    echo.
) else (
    echo.
    echo FAILED. Try right-clicking and "Run as administrator".
    echo.
)
pause
