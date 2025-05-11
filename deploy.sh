#!/bin/bash

env_arg="$1"

case "${env_arg,,}" in
  dev)
    enviro="dev"
    ;;
  staging)
    enviro="stage"
    ;;
  prod)
    enviro="prod"
    ;;
  *)
    enviro="dev"
    ;;
esac

./setup $enviro
skaffold $enviro