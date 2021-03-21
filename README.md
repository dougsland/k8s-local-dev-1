# k8s-local-dev

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
All **CNI** and **script configurations** in a [single file](https://github.com/dougsland/k8s-local-dev/blob/main/lib/config.sh)  

See also:  
- [Cyclonus - Tools for understanding, measuring, and applying network policies effectively in kubernetes](https://github.com/mattfenwick/cyclonus)
- [k8sprototypes from Jay - kind](https://github.com/jayunit100/k8sprototypes/tree/master/kind)
