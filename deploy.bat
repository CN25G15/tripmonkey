@ECHO OFF

IF /I "%~1"=="dev" (
    SET enviro=dev
) ELSE IF /I "%~1"=="staging" (
    SET enviro=stage
) ELSE IF /I "%~1"=="prod" (
    SET enviro=prod
) ELSE (
    SET enviro=dev
)

CALL setup %enviro%
skaffold.exe %enviro%