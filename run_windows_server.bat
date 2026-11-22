@echo off
title NetPulse - Realtime Network Packet Router Simulator
echo ===============================================================
echo   NetPulse - Realtime Packet Router ^& Smart City Simulator
echo ===============================================================
echo.
where python >nul 2>nul
if %errorlevel%==0 (
    echo Starting Python Backend Server on http://localhost:8080 ...
    start "" "http://localhost:8080"
    python "%~dp0backend\app.py"
) else (
    echo Python not detected in PATH. Opening standalone Web App directly in browser...
    start "" "%~dp0frontend\index.html"
)
pause
