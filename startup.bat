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
    SET env=tripmonkey-dev
    SET target=0.development
) ELSE IF /I "%~1"=="staging" (
    SET env=tripmonkey-stage
    SET target=1.staging
) ELSE IF /I "%~1"=="prod" (
    SET env=tripmonkey-prod
    SET target=2.production
) ELSE (
    SET env=tripmonkey-dev
    SET target=0.development
)


minikube start --profile tripmonkey
minikube addons enable metrics-server
minikube addons enable ingress
ECHO "Installing dependencies (Kafka and Mongo Operators) for environment: %env%"
CALL install-ingress.bat
skaffold dev
