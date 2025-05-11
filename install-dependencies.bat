@ECHO OFF

IF /I "%~1"=="dev" (
    SET env=tripmonkey-dev
) ELSE IF /I "%~1"=="staging" (
    SET env=tripmonkey-stage
) ELSE IF /I "%~1"=="prod" (
    SET env=tripmonkey-prod
) ELSE (
    SET env=tripmonkey-dev
)

ECHO "Installing dependencies (Kafka and Mongo Operators) for environment: %env%"
kubectl apply -f https://strimzi.io/install/latest?namespace=%env% -n %env%
kubectl apply -f build/mongodb-kubernetes-operator/config/crd/bases/mongodbcommunity.mongodb.com_mongodbcommunity.yaml
kubectl apply -k build/mongodb-kubernetes-operator/config/rbac/ --namespace %env%
kubectl create -f build/mongodb-kubernetes-operator/config/manager/manager.yaml --namespace %env%