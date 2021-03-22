# k8s-local-dev

[![Antrea test](https://github.com/K8sbykeshed/k8s-local-dev/actions/workflows/antrea.yml/badge.svg)](https://github.com/K8sbykeshed/k8s-local-dev/actions/workflows/antrea.yml)
[![Calico test](https://github.com/K8sbykeshed/k8s-local-dev/actions/workflows/calico.yaml/badge.svg)](https://github.com/K8sbykeshed/k8s-local-dev/actions/workflows/calico.yaml)
[![Cilium test](https://github.com/K8sbykeshed/k8s-local-dev/actions/workflows/cilium.yml/badge.svg)](https://github.com/K8sbykeshed/k8s-local-dev/actions/workflows/cilium.yml)
[![Flannel test](https://github.com/K8sbykeshed/k8s-local-dev/actions/workflows/flannel.yml/badge.svg)](https://github.com/K8sbykeshed/k8s-local-dev/actions/workflows/flannel.yml)
[![OVN Kubernetes test](https://github.com/K8sbykeshed/k8s-local-dev/actions/workflows/ovn-kubernetes.yml/badge.svg)](https://github.com/K8sbykeshed/k8s-local-dev/actions/workflows/ovn-kubernetes.yml)
[![Weavenet test](https://github.com/K8sbykeshed/k8s-local-dev/actions/workflows/weavenet.yml/badge.svg)](https://github.com/K8sbykeshed/k8s-local-dev/actions/workflows/weavenet.yml)

**k8s-local-dev** creates Kubernetes local cluster for testing or development. It is based on [kind](https://kind.sigs.k8s.io/) and Container Network Interface (**CNI**) implementations.  

```
$ ./k8s-local-dev 
Usage: ./k8s-local-dev CNI_NAME

Example:
	./k8s-local-dev cni-foobar

Supported CNI: 
	antrea
	calico
	cilium
	flannel
	ovn-kubernetes
	weavenet

For more info use:
	./k8s-local-dev --help
```
All **CNI** and **script configurations** in a [single file](https://github.com/K8sbykeshed/k8s-local-dev/blob/main/lib/config.sh)  
However, users can overwrite the default value in the file manually or using dynamic approach, example:
```
$ ANTREA_VERSION=v0.12.0 ./k8s-local-dev
```
The command above will **overwrite the default version** from [config.sh](https://github.com/K8sbykeshed/k8s-local-dev/blob/main/lib/config.sh) and set the local cluster with ANTREA 0.12.0

Current variables that users can overwrite:
| ENV Variable            | Description                          |
|-------------------------|--------------------------------------|
| FLANNEL_VERSION         | Flannel version for deployment       |
| ANTREA_VERSION          | Antrea version for deployment        |
| CILIUM_VERSION          | Cilium version for deployment        |
| CALICO_CLIENT_VERSION   | Calico client version for deployment |
| CONTAINER_CMD_INTERFACE | [WIP] docker or podman               |


**See also**:  
- [Cyclonus - Tools for understanding, measuring, and applying network policies effectively in kubernetes](https://github.com/mattfenwick/cyclonus)
- [k8sprototypes from Jay - kind](https://github.com/jayunit100/k8sprototypes/tree/master/kind)
