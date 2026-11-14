@echo off
setlocal
cd /d "%~dp0"
title Publish to GitHub

where git >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git was not found. Install Git or add it to PATH.
    goto :failed
)

git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
    echo ERROR: This file must be inside a Git repository.
    goto :failed
)

git remote get-url origin >nul 2>&1
if errorlevel 1 (
    echo ERROR: No Git remote named "origin" is configured.
    goto :failed
)

for /f "delims=" %%B in ('git branch --show-current 2^>nul') do set "BRANCH=%%B"
if not defined BRANCH (
    echo ERROR: Could not determine the current branch.
    goto :failed
)

echo Repository: %CD%
echo Branch: %BRANCH%
echo.

set "HAS_CHANGES="
for /f "delims=" %%S in ('git status --porcelain') do set "HAS_CHANGES=1"

if not defined HAS_CHANGES goto :push

echo Current changes:
git status --short
echo.
echo This will stage all changes in this repository, including untracked files.
set "COMMIT_MESSAGE="
set /p "COMMIT_MESSAGE=Enter a commit message: "
if not defined COMMIT_MESSAGE goto :cancelled

choice /C YN /N /M "Stage all changes? [Y/N] "
if errorlevel 2 goto :cancelled

git -c gc.auto=0 -c maintenance.auto=false add -A
if errorlevel 1 goto :failed

echo.
echo Review the staged files before continuing:
git status --short
git diff --cached --stat
echo.
choice /C YN /N /M "Commit these changes and push to GitHub? [Y/N] "
if errorlevel 2 goto :cancelled_staged

git -c gc.auto=0 -c maintenance.auto=false commit -m "%COMMIT_MESSAGE%"
if errorlevel 1 goto :failed

:push
echo.
echo Pushing %BRANCH% to origin...
git -c gc.auto=0 -c maintenance.auto=false push --set-upstream origin "%BRANCH%"
if errorlevel 1 goto :failed

echo.
echo Successfully pushed to GitHub.
goto :done

:cancelled
echo.
echo Cancelled. Nothing was committed or pushed.
goto :done

:cancelled_staged
echo.
echo Cancelled. Changes are staged locally, but nothing was committed or pushed.
goto :done

:failed
echo.
echo The operation failed. Check the message above. If the commit succeeded but push failed, run this file again to retry the push.
pause
endlocal
exit /b 1

:done
echo.
pause
endlocal
exit /b 0
