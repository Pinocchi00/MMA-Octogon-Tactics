@echo off
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 (
 echo Node.js est necessaire. Demande a Codex de preparer Node.js puis relance ce fichier.
 pause
 exit /b 1
)
node scripts/serve.mjs
pause
