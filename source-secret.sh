#!/bin/bash
kubectl create secret generic tripmonkey-secrets --from-env-file=.env