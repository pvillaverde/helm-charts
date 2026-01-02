## 🏗️ Installation

### Using Helm

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:
```bash
  helm repo add pvillaverde https://pvillaverde.github.io/helm-charts
```
If you had already added this repo earlier, run `helm repo update` to retrieve the latest versions of the packages.  You can then run `helm search repo pvillaverde` to see the charts.

For example, to install the game-server chart:
```bash
    helm install game-server pvillaverde/game-server
```
To uninstall the chart:
```bash
    helm delete game-server
```
### Using FluxCD
Install the Helm repository:
```yaml
apiVersion: source.toolkit.fluxcd.io/v1beta2
kind: HelmRepository
metadata:
  name: pvillaverde
  namespace: flux-system
spec:
  interval: 1h0m0s
  url: https://pvillaverde.github.io/helm-charts
```
Launch a HelmRelease, for example the game-server chart:
```yaml
apiVersion: helm.toolkit.fluxcd.io/v2beta2
kind: HelmRelease
metadata:
  name: game-server
  namespace: flux-system
spec:
  releaseName: game-server
  targetNamespace: kirfed
  interval: 10m
  chart:
    spec:
      chart: game-server
      version: 1.6.0
      sourceRef:
        kind: HelmRepository
        name: pvillaverde
        namespace: flux-system
  values:
   [...]
```
