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


## ⚖️ License

Copyright 2024 Pablo Villaverde Castro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
