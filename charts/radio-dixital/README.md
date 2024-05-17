## 🏗️ Installation

### Using Helm

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:
```bash
  helm repo add pvillaverde https://pvillaverde.github.io/helm-charts
```
If you had already added this repo earlier, run `helm repo update` to retrieve the latest versions of the packages.  You can then run `helm search repo pvillaverde` to see the charts.

For example, to install the radio-dixital chart:
```bash
    helm install radio-dixital pvillaverde/RadioDixital
```
To uninstall the chart:
```bash
    helm delete radio-dixital
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
Launch a HelmRelease, for example the RadioDixital chart:
```yaml
apiVersion: helm.toolkit.fluxcd.io/v2beta2
kind: HelmRelease
metadata:
  name: radio-dixital
  namespace: flux-system
spec:
  releaseName: radio-dixital
  targetNamespace: kirfed
  interval: 10m
  chart:
    spec:
      chart: radio-dixital
      version: 0.1.0
      sourceRef:
        kind: HelmRepository
        name: pvillaverde
        namespace: flux-system
  values:
    image:
      tag: 1.1.0
    cronJobs:
    - task: refreshYoutube
      schedule: "15,45 * * * *"
    - task: refreshPodcasts
      schedule: "0,30 * * * *"
    - task: refreshBlogs
      schedule: "5,55 * * * *"
    - task: refreshYoutubeStats
      schedule: "15 22 * * *"
    secretName: obradoirodixital-radio-dixital
```
