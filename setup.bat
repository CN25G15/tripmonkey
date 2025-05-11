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

IF /I "%~1"=="dev" (
    SET env=dev
) ELSE IF /I "%~1"=="staging" (
    SET env=stage
) ELSE IF /I "%~1"=="prod" (
    SET env=prod
) ELSE (
    SET env=dev
)


minikube addons enable metrics-server
minikube addons enable ingress
minikube start
CALL deploy-configs.bat %env%
CALL deploy-secrets.bat %env%
CALL install-dependencies.bat %env%