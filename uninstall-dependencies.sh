#!/bin/bash

env_arg="$1"

case "${env_arg,,}" in
  dev)
    env="tripmonkey-dev"
    ;;
  staging)
    env="tripmonkey-stage"
    ;;
  prod)
    env="tripmonkey-prod"
    ;;
  *)
    env="tripmonkey-dev"
    ;;
esac

echo "Installing dependencies (Kafka and Mongo Operators) for environment: $env"
kubectl delete -f https://strimzi.io/install/latest?namespace=$env -n $env
kubectl delete -f build/mongodb-kubernetes-operator/config/crd/bases/mongodbcommunity.mongodb.com_mongodbcommunity.yaml
kubectl delete -f build/mongodb-kubernetes-operator/deploy/clusterwide
kubectl delete -k build/mongodb-kubernetes-operator/config/rbac/ --namespace $env
kubectl delete -f build/mongodb-kubernetes-operator/config/manager/manager.yaml --namespace $env