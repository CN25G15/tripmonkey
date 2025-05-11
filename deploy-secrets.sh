#!/bin/bash

env_arg="$1"

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

echo "Installing secrets for environment $env"
kubectl apply -f k8s/environments/$target/1.secrets