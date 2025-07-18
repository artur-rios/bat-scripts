@echo off

REM Get the first parameter or use empty string if not provided
set "PROJECT_TEXT=%~1"

FOR /D %%t in (*) do (
    cd %%t

    REM If parameter is provided, write it to the file; otherwise create empty file
    if defined PROJECT_TEXT (
        echo %PROJECT_TEXT% > .wakatime-project
    ) else (
        echo. > .wakatime-project
        REM Remove the empty line created by echo.
        type nul > .wakatime-project
    )

    cd..
)
