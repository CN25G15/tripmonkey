@ECHO OFF
kubectl create secret generic tripmonkey-secrets --from-env-file=.env