@echo off
setlocal EnableExtensions

rem === 1) CONFIG: your repo path ===
set "REPO=D:\Projects\Github\Configuration-Management-Ansible-Jenkins"

rem === 2) Sanity: Git available? ===
where git >nul 2>&1 || (
  echo [ERROR] Git not found in PATH. Install Git for Windows or add it to PATH.
  exit /b 1
)

rem === 3) Go to repo ===
pushd "%REPO%" || (echo [ERROR] Repo path not found: %REPO% & exit /b 1)

rem === 4) Stable ISO date (locale-proof) ===
for /f %%I in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"') do set "TODAY=%%I"

rem === 5) Create/overwrite the daily file ===
set "FILE=daily_%TODAY%.txt"
> "%FILE%" echo Auto commit for %DATE% %TIME%

rem === 6) Figure out the current branch automatically ===
for /f %%B in ('git rev-parse --abbrev-ref HEAD') do set "BRANCH=%%B"

rem (Optional) ensure user is set so commit works under Task Scheduler
git config user.name  >nul 2>&1 || git config user.name  "github-actions[bot]"
git config user.email >nul 2>&1 || git config user.email "github-actions[bot]@users.noreply.github.com"

rem === 7) Stage only the new file (safer) ===
git add "%FILE%"

rem === 8) Commit only if there are changes ===
set "CHANGED="
for /f %%S in ('git status --porcelain') do set "CHANGED=1"
if not defined CHANGED (
  echo Nothing to commit.
) else (
  git commit -m "Daily auto commit %TODAY% %TIME%"
)

rem === 9) Push to the current branch ===
git push origin %BRANCH%
set "ERR=%ERRORLEVEL%"

popd
exit /b %ERR%
