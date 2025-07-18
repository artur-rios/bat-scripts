@if (@CodeSection == @Batch) @then

@echo off

set SendKeys=CScript //nologo //E:JScript "%~F0"

REM Check for help parameter
if /i "%1"=="help" goto show_help
if /i "%1"=="/?" goto show_help
if /i "%1"=="-h" goto show_help

start "" /B cmd

color 0a

REM Get parameters
set timeout_value=%1

REM Validate timeout parameter
if "%timeout_value%"=="" set timeout_value=20
echo %timeout_value%| findstr /r "^[0-9][0-9]*$" >nul
if errorlevel 1 set timeout_value=20

REM Start the typing loop
set counter=1
timeout 15

:main_loop
timeout %timeout_value% >nul
call %SendKeys% "echo Hello World %counter%{ENTER}"
set /a counter+=1
goto main_loop

:show_help
echo Usage: ktype.bat [timeout]
echo.
echo Parameters:
echo   timeout  - delay in seconds between outputs (default: 20)
echo.
echo The script types "echo Hello World" commands with an incrementing counter.
echo The echo command will be executed, showing only the output text.
echo.
echo Examples:
echo   ktype.bat 5               - Type echo commands with 5 second intervals
echo   ktype.bat 10              - Type echo commands with 10 second intervals
echo   ktype.bat                 - Default 20 second intervals
echo.
echo Press any key to exit...
pause >nul
exit /b 0

@end

var WshShell = WScript.CreateObject("WScript.Shell");
WshShell.SendKeys(WScript.Arguments(0));
