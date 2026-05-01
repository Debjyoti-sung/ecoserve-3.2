@echo off
REM EcoServe Platform - Quick Setup Script (Windows)
REM This script validates and sets up your development environment

setlocal enabledelayedexpansion

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║           EcoServe Platform - Setup Validator             ║
echo ║         AI-Powered Food Sustainability Network            ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

set ERRORS=0

REM Check Node.js
echo 🔍 Checking Node.js installation...
where node >nul 2>nul
if %ERRORLEVEL% equ 0 (
    for /f "tokens=*" %%i in ('node -v') do set NODE_VERSION=%%i
    echo ✓ Node.js installed: %NODE_VERSION%
) else (
    echo ✗ Node.js not found. Install from https://nodejs.org/
    set /a ERRORS+=1
)

REM Check npm
echo 🔍 Checking npm installation...
where npm >nul 2>nul
if %ERRORLEVEL% equ 0 (
    for /f "tokens=*" %%i in ('npm -v') do set NPM_VERSION=%%i
    echo ✓ npm installed: %NPM_VERSION%
) else (
    echo ✗ npm not found. Please install Node.js
    set /a ERRORS+=1
)

REM Check node_modules
echo 🔍 Checking dependencies...
if exist "node_modules" (
    echo ✓ Dependencies installed
) else (
    echo ⚠ Dependencies not found. Run: npm install
)

REM Check .env.local
echo 🔍 Checking environment configuration...
if exist ".env.local" (
    echo ✓ .env.local file exists
    
    REM Check for Firebase key
    findstr /M "VITE_FIREBASE_API_KEY" .env.local >nul
    if %ERRORLEVEL% equ 0 (
        echo ✓ Firebase configuration found
    ) else (
        echo ⚠ Firebase API key not configured
    )
) else (
    echo ✗ .env.local file not found. Creating template...
    (
        echo # Firebase Configuration
        echo VITE_FIREBASE_API_KEY=
        echo # See .env.local for all required variables
    ) > .env.local
)

REM Check project structure
echo 🔍 Checking project structure...
if exist "src" (
    echo ✓ src\ directory found
) else (
    echo ✗ src\ directory not found
    set /a ERRORS+=1
)

if exist "server.js" (
    echo ✓ server.js found
) else (
    echo ✗ server.js not found
    set /a ERRORS+=1
)

if exist "index.html" (
    echo ✓ index.html found
) else (
    echo ✗ index.html not found
    set /a ERRORS+=1
)

REM Summary
echo.
echo ╔════════════════════════════════════════════════════════════╗
if %ERRORS% equ 0 (
    echo ✓ All checks passed!
    echo ╚════════════════════════════════════════════════════════════╝
    echo.
    echo 🚀 Ready to start development!
    echo.
    echo Next steps:
    echo 1. Configure .env.local with your API keys
    echo 2. Run: npm install
    echo 3. Run: npm run dev
    echo.
    echo Frontend: http://localhost:5173
    echo Backend:  http://localhost:5000
) else (
    echo ✗ Setup incomplete. Fix errors above.
    echo ╚════════════════════════════════════════════════════════════╝
)

exit /b %ERRORS%
