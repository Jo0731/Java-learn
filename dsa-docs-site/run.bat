@echo off
title DSA Learning Hub - Local Server
color 0A

echo.
echo  ====================================
echo   DSA Learning Hub - Local Server
echo  ====================================
echo.

REM --- Change to the directory where this .bat file lives ---
cd /d "%~dp0"

REM --- Try Python 3 first ---
python --version >nul 2>&1
if %errorlevel% == 0 (
    echo  [OK] Python found. Starting server...
    echo.
    echo  Open your browser at:  http://localhost:8000
    echo  Press Ctrl+C to stop the server.
    echo.
    python -m http.server 8000
    goto :end
)

REM --- Try python3 command ---
python3 --version >nul 2>&1
if %errorlevel% == 0 (
    echo  [OK] Python3 found. Starting server...
    echo.
    echo  Open your browser at:  http://localhost:8000
    echo  Press Ctrl+C to stop the server.
    echo.
    python3 -m http.server 8000
    goto :end
)

REM --- Try Node.js (npx serve) ---
node --version >nul 2>&1
if %errorlevel% == 0 (
    echo  [OK] Node.js found. Starting server with npx serve...
    echo.
    echo  Open your browser at:  http://localhost:3000
    echo  Press Ctrl+C to stop the server.
    echo.
    npx -y serve . -p 3000
    goto :end
)

REM --- Nothing found ---
echo  [ERROR] Could not find Python or Node.js on your system.
echo.
echo  Please install one of the following:
echo    - Python  : https://www.python.org/downloads/
echo    - Node.js : https://nodejs.org/
echo.
echo  After installing, re-run this file.
echo.
pause

:end
