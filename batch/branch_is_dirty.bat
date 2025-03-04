@echo off
setlocal enabledelayedexpansion

:: Check if inside a Git repository
git rev-parse --is-inside-work-tree >nul 2>&1
if %errorlevel% neq 0 (
    echo Not inside a Git repository.
    exit /b 1
)

:: Check for uncommitted changes
git status --porcelain | findstr /r "^." >nul
if %errorlevel% neq 0 (
    echo Branch is clean.
    exit /b 0
)

echo Branch is dirty (uncommitted changes exist).
exit /b 1
