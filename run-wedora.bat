@echo off
setlocal
cd /d "%~dp0"
echo ==============================================
echo   Wedora Wedding Management - Local Launcher
echo ==============================================
echo.
where node >nul 2>nul
if errorlevel 1 (
  echo Node.js was not found. Install Node.js LTS from https://nodejs.org/ and reopen this file.
  pause
  exit /b 1
)
if not exist node_modules (
  echo Installing required packages. This may take a few minutes...
  call npm install
  if errorlevel 1 (
    echo Package installation failed. Check your internet connection and try again.
    pause
    exit /b 1
  )
)
if not exist .env (
  copy .env.example .env >nul
  echo Created .env with demo admin credentials. Edit .env to change them before public deployment.
  echo Demo admin email: admin@example.com
  echo Demo admin password: ChangeThisPassword_123!
  echo.
)
echo Building website and starting backend...
call npm start
if errorlevel 1 (
  echo Startup failed. Read the error above and check README.md.
  pause
)
endlocal
