@echo off
setlocal

:: Check if a path is provided, otherwise use the current directory
set TargetPath=%~1
if "%TargetPath%"=="" set TargetPath=%cd%

:: Confirm the target path exists
if not exist "%TargetPath%" (
    echo Error: The specified path "%TargetPath%" does not exist.
    exit /b 1
)

echo Deleting all "bin" and "obj" folders in "%TargetPath%" and its subdirectories...

:: Delete all "bin" folders
for /d /r "%TargetPath%" %%i in (bin) do (
    ::echo Deleting "%%i"...
    rd /s /q "%%i"
)

:: Delete all "obj" folders
for /d /r "%TargetPath%" %%i in (obj) do (
    ::echo Deleting "%%i"...
    rd /s /q "%%i"
)

echo Deletion complete.
exit /b 0