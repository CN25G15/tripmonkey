# Tripmonkey makes use of skaffold to deploy pods locally and in the cloud.

Required dependencies: [Skaffold](https://skaffold.dev/docs/install/) (on windows it's recommended to install to PATH)

Note: as of yet skaffold seems to be unable to parse and deploy configmaps and secrets nor can it install the required project dependencies in the desired order.
ConfigMaps, Secrets and the required dependencies should then be installed via CLI commands or the provided scripts.

Theres 2 modes of deployment:
- Manually with scripts and then running skaffold
- running deploy.bat/deploy.sh

Note: deploy.bat/deploy.sh assumes you have skaffold installed and in your system path.

