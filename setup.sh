#!/bin/bash

echo "  ______ ______ ______ ______ ______ ______ ______ ______ ______ ______
 |______|______|______|______|______|______|______|______|______|______|
       |__   __| (_)                           | |
          | |_ __ _ _ __  _ __ ___   ___  _ __ | | _____ _   _
          | | '__| | '_ \| '_ \` _ \ / _ \| '_ \| |/ / _ | | | |
          | | |  | | |_) | | | | | | (_) | | | |   |  __| |_| |
          |_|_|  |_| .__/|_| |_| |_|\___/|_| |_|_|\_\___|\__, |
                   | |                                    __/ |
  ______ ______ ___|_| ______ ______ ______ ______ ______|___/__ ______
 |______|______|______|______|______|______|______|______|______|______|
                                                                        "

case "${env_arg,,}" in
  dev)
    env="tripmonkey-dev"
    target="0.development"
    ;;
  staging)
    env="tripmonkey-stage"
    target="1.staging"
    ;;
  prod)
    env="tripmonkey-prod"
    target="2.production"
    ;;
  *)
    env="tripmonkey-dev"
    target="0.development"
    ;;
esac

minikube start --profile tripmonkey
minikube addons enable metrics-server
minikube addons enable ingress
echo "Installing dependencies (Kafka and Mongo Operators) for environment: $env"
kubectl apply -f https://strimzi.io/install/latest?namespace=default -n default
kubectl apply -f build/mongodb-kubernetes-operator/config/crd/bases/mongodbcommunity.mongodb.com_mongodbcommunity.yaml
kubectl apply -f build/mongodb-kubernetes-operator/deploy/clusterwide
kubectl apply -k build/mongodb-kubernetes-operator/config/rbac/ --namespace default
kubectl create -f build/mongodb-kubernetes-operator/config/manager/manager.yaml --namespace default
kubectl apply -f k8s/environments/$target/pre-deploy
