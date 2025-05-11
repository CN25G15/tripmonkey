@ECHO OFF

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

ECHO "Installing configs for environment %env%"
kubectl apply -f k8s/environments/%target%/0.configs