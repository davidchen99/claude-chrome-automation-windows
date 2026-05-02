@echo off
setlocal

set "ROOT=%~dp0"
call "%ROOT%scripts\start-chrome-debug-9222.bat"
timeout /t 3 /nobreak >nul

start "Claude Code" cmd /k "cd /d %USERPROFILE% && claude --mcp-config ""%ROOT%config\chrome-devtools.mcp.json"" --settings ""%ROOT%config\limited-settings.json"""

endlocal
