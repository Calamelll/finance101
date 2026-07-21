@echo off
chcp 65001 >nul
cd /d "%~dp0"

if not exist ".git" (
  echo [setup] initializing repo...
  git init -b main
  git remote add origin https://github.com/Calamelll/finance101.git
  git fetch origin main
  git reset --soft origin/main
)

git add -A
git diff --cached --quiet && (
  echo Nothing to push - already up to date.
  pause
  exit /b 0
)

for /f "tokens=*" %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"') do set TODAY=%%i
git commit -m "Finance101 update %TODAY%"
git push origin main

echo.
echo Done. https://calamelll.github.io/finance101
pause
