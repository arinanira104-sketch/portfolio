@echo off
chcp 65001 >nul
cd /d "%~dp0"

rem === Find git and add to PATH ===
if exist "C:\Program Files\Git\cmd\git.exe" (
    set "PATH=C:\Program Files\Git\cmd;%PATH%"
    goto :git_found
)
if exist "C:\Program Files (x86)\Git\cmd\git.exe" (
    set "PATH=C:\Program Files (x86)\Git\cmd;%PATH%"
    goto :git_found
)
if exist "%LOCALAPPDATA%\Programs\Git\cmd\git.exe" (
    set "PATH=%LOCALAPPDATA%\Programs\Git\cmd;%PATH%"
    goto :git_found
)
if exist "%USERPROFILE%\AppData\Local\Programs\Git\cmd\git.exe" (
    set "PATH=%USERPROFILE%\AppData\Local\Programs\Git\cmd;%PATH%"
    goto :git_found
)
echo Git not found! Please install Git from https://git-scm.com
pause
exit /b 1

:git_found
echo Git found: 
git --version

echo === Init git ===
git init
git branch -M main

echo === Adding files ===
git add .

echo === Creating commit ===
git commit -m "Portfolio update"

echo === Setting remote ===
git remote remove origin 2>nul
git remote add origin https://github.com/arinanira104-sketch/portfolio.git

echo === Pushing to GitHub (may take a few minutes) ===
git push -f origin main

echo.
echo === Done! ===
echo Site: https://arinanira104-sketch.github.io/portfolio/
pause
