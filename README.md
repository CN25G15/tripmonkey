# Tripmonkey makes use of skaffold to deploy pods locally and in the cloud.

Required dependencies: [Skaffold](https://skaffold.dev/docs/install/) (on windows it's recommended to install to PATH)

Note: as of yet skaffold seems to be unable to parse and deploy configmaps and secrets nor can it install the required project dependencies in the desired order.
ConfigMaps, Secrets and the required dependencies should then be installed via CLI commands or the provided scripts.

Current mode of running:
- skaffold dev --profile <profile>
- if running locally, be sure to run ```kubect apply -f k8s/misc/kafka/```

