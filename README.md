<p align="center">
    <img width="300px" height=auto src="https://avatars.githubusercontent.com/u/15859888?v=4" />
</p>

<p align="center">
    <a href="https://github.com/pvillaverde/helm-charts"><img src="https://badgen.net/github/stars/pvillaverde/helm-charts?icon=github" /></a>
    <a href="https://github.com/pvillaverde/helm-charts"><img src="https://badgen.net/github/forks/pvillaverde/helm-charts?icon=github" /></a>
    <a href="https://artifacthub.io/packages/search?repo=pvillaverde"><img src="https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/pvillaverde" /></a>
</p>

# ☸️ Helm Charts for Kubernetes by pvillaverde

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
    helm install radio-dixital pvillaverde/radio-dixital
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
Launch a HelmRelease, for example the radio-dixital chart:
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
      version: 1.2.3
      sourceRef:
        kind: HelmRepository
        name: pvillaverde
        namespace: flux-system
  values:
    image:
      tag: 1.2.3
    cronJobs:
    - task: refreshYoutube
      schedule: "15,45 * * * *"
    - task: refreshPodcasts
      schedule: "0,30 * * * *"
    - task: refreshBlogs
      schedule: "5,55 * * * *"
    - task: refreshYoutubeStats
      schedule: "20 1 1,9,17,25 * *"
    - task: refreshTwitchChannels
      schedule: "13 4 * * *"
    - task: refreshTwitchGames
      schedule: "*/15 * * * *"
    - task: refreshTwitchClips
      schedule: "0 5 * * 5" # Every Friday
    - task: refreshTwitchStreams
      schedule: "* * * * *" # Every Minute
    secretName: obradoirodixital-radio-dixital
```
## 🧩 Development Notes

Generate manifests: 
```bash
helm install --debug --dry-run  chart ./charts/chart/
```
Generate Schemas: 
```bash
helm schema-gen values.yaml > values.schema.json
```


## 🙏 Acknowledgements

- [helm-schema-gen](https://github.com/karuppiah7890/helm-schema-gen)

## ⚖️ License

Copyright 2024 Pablo Villaverde Castro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
