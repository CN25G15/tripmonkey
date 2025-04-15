@ECHO OFF

ECHO "  ______ ______ ______ ______ ______ ______ ______ ______ ______ ______  " 
ECHO " |______|______|______|______|______|______|______|______|______|______| "
ECHO "       |__   __| (_)                           | |                       "
ECHO "          | |_ __ _ _ __  _ __ ___   ___  _ __ | | _____ _   _           "
ECHO "          | | '__| | '_ \| '_ ` _ \ / _ \| '_ \| |/ / _ | | | |          "
ECHO "          | | |  | | |_) | | | | | | (_) | | | |   |  __| |_| |          "
ECHO "          |_|_|  |_| .__/|_| |_| |_|\___/|_| |_|_|\_\___|\__, |          "
ECHO "                   | |                                    __/ |          "
ECHO "  ______ ______ ___|_| ______ ______ ______ ______ ______|___/__ ______  "
ECHO " |______|______|______|______|______|______|______|______|______|______| "


ECHO.
ECHO ---------------------------------------
ECHO Building images for local docker repo
ECHO ---------------------------------------
ECHO.

FOR /D %%D IN (*) DO (

    IF EXIST "%%~D\Dockerfile" (
        ECHO.
        echo found Dockerfile @ %%~D
        docker build -t "tripmonkey/%%~D" "%%~D"
    ) ELSE IF EXIST "%%~D\build-image.bat" (
        ECHO.
        echo found build-image.bat @ %%~D
        CALL %cd%\%%~D\build-image.bat
    ) ELSE (
        ECHO.
        ECHO No Dockerfile or build-image.sh found @ %%~D
    )
)

EXIT /B 0