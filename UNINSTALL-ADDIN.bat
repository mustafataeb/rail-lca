@echo off
title Uninstall Rail-LCA Add-in
color 0C
echo Removing Rail-LCA add-in from Excel...
reg delete "HKCU\SOFTWARE\Microsoft\Office\16.0\WEF\Developer" /v "RailLCAAddin" /f
if %errorlevel% equ 0 (echo ✓ Removed. Restart Excel.) else (echo Not found — already removed.)
pause
