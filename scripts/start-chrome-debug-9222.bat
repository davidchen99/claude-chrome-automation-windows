@echo off
setlocal

set "CHROME_EXE="
if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" set "CHROME_EXE=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if not defined CHROME_EXE if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" set "CHROME_EXE=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if not defined CHROME_EXE if exist "%LocalAppData%\Google\Chrome\Application\chrome.exe" set "CHROME_EXE=%LocalAppData%\Google\Chrome\Application\chrome.exe"

if not defined CHROME_EXE (
  echo Chrome executable not found.
  echo Expected one of:
  echo   %ProgramFiles%\Google\Chrome\Application\chrome.exe
  echo   %ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe
  echo   %LocalAppData%\Google\Chrome\Application\chrome.exe
  exit /b 1
)

set "PROFILE_DIR=%USERPROFILE%\.chrome-devtools-profile-claude-automation"
if not exist "%PROFILE_DIR%" mkdir "%PROFILE_DIR%"

start "" "%CHROME_EXE%" ^
  --remote-debugging-address=127.0.0.1 ^
  --remote-debugging-port=9222 ^
  --user-data-dir="%PROFILE_DIR%"

endlocal
