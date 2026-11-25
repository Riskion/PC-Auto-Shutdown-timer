
@echo off
setlocal
title One-Time PC Shutdown
color 0A

echo ========================================
echo          ONE-TIME PC SHUTDOWN
echo ========================================
echo.
echo Enter shutdown time in 24-hour format.
echo Example: 23:30
echo.

set /p SHUTTIME=Shutdown time (HH:MM): 

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
 "$t=[datetime]::Today.Add([timespan]::Parse('%SHUTTIME%')); if($t -le (Get-Date)){$t=$t.AddDays(1)}; $s=[int]($t-(Get-Date)).TotalSeconds; Write-Host ('Shutdown scheduled for '+$t.ToString('HH:mm')); Write-Host 'Press Ctrl+C to cancel this script.'; shutdown.exe /s /t $s"

if errorlevel 1 (
    echo.
    echo Could not schedule shutdown.
    pause
)
