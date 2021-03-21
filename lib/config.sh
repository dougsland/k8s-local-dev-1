#!/usr/bin/env bash
#
# Copyright 2021 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# this utility prints out the golang install dir, even if go is not installed
# IE it prints the directory where `go install ...` would theoretically place
# binaries
#
############## GENERAL ###################################
# Use docker or podman
CONTAINER_CMD_INTERFACE="docker"
HELM_CMD="helm"

export CONTAINER_CMD_INTERFACE \
       HELM_CMD	

############## BIN FILES LOCATION ########################
# root dir of project
BIN_PATH="$(dirname "$(pwd)")/bin"
export BIN_PATH

############## CNI INFO ########################
CLUSTER_NAME=$(tr -dc a-z0-9 </dev/urandom | head -c 6 ; echo '')

FLANNEL_CLUSTER_NAME="netpol-flannel-$(date '+%F')-${CLUSTER_NAME}"
FLANNEL_VERSION="v0.13.0"
FLANNEL_GIT_TREE="https://github.com/containernetworking/plugins.git"
FLANNEL_DIR_PLUGINS="plugins"
FLANNEL_MANIFESTS=(https://raw.githubusercontent.com/flannel-io/flannel/"${FLANNEL_VERSION}"/Documentation/kube-flannel.yml)

ANTREA_CLUSTER_NAME="netpol-antrea-$(date '+%F')-${CLUSTER_NAME}"
ANTREA_VERSION="v0.12.2"
ANTREA_DIR="antrea"

CILIUM_CLUSTER_NAME="netpol-cilium-$(date '+%F')-${CLUSTER_NAME}"
CILIUM_VERSION="v1.9.5"
CILIUM_IMAGE="quay.io/cilium/cilium:${CILIUM_VERSION}"
CILIUM_HELM_REPO_URL="https://helm.cilium.io/"
CILIUM_HELM_REPO_NAME="cilium"
CILIUM_HELM_NAMESPACE="kube-system"
CILIUM_HELM_NODEINIT_ENABLED="true"
CILIUM_HELM_KUBEPROXY_REPLACEMENT="partial"
CILIUM_HELM_HOSTSERVICES_ENABLED="false"
CILIUM_HELM_EXTERNALIPS_ENABLED="true"
CILIUM_NODEPORT_ENABLED="true"
CILIUM_HOSTPORT_ENABLED="true"
CILIUM_BPF_MASQUERADE="false"
CILIUM_IMAGE_PULLPOLICY="IfNotPresent"
CILIUM_IPAM_MODE="kubernetes"


CALICO_CLUSTER_NAME="netpol-calico-$(date '+%F')-${CLUSTER_NAME}"
CALICO_CLIENT_NAME="calicoctl"
CALICO_CLIENT_VERSION="v3.18.1"
CALICO_CLIENT_DOWNLOAD_URL="https://github.com/projectcalico/calicoctl/releases/download/${CALICO_CLIENT_VERSION}/calicoctl"
CALICO_NODE_OPTIONS=(FELIX_IGNORELOOSERPF=true FELIX_XDPENABLED=false)
CALICO_MANIFESTS=(https://docs.projectcalico.org/manifests/calico.yaml)
CALICO_DAEMONSET_ENV="daemonset/calico-node"

OVN_KUBERNETES_GIT_TREE="https://github.com/ovn-org/ovn-kubernetes"
OVN_KUBERNETES_DIR="ovn-kubernetes"
OVN_KUBERNETES_DISTRO="ubuntu"

WEAVENET_CLUSTER_NAME="netpol-weavenet-$(date '+%F')-${CLUSTER_NAME}"
WEAVENET_MANIFESTS=(https://raw.githubusercontent.com/weaveworks/weave/master/prog/weave-kube/weave-daemonset-k8s-1.9.yaml)

export	FLANNEL_CLUSTER_NAME \
	FLANNEL_VERSION \
	FLANNEL_GIT_TREE \
	FLANNEL_DIR_PLUGINS \
	FLANNEL_MANIFESTS \
	ANTREA_CLUSTER_NAME \
	ANTREA_VERSION \
	ANTREA_DIR \
	CILIUM_CLUSTER_NAME \
	CILIUM_VERSION \
	CILIUM_IMAGE \
	CILIUM_HELM_REPO_NAME \
	CILIUM_HELM_REPO_URL \
	CILIUM_HELM_NAMESPACE \
	CILIUM_HELM_NODEINIT_ENABLED \
	CILIUM_HELM_KUBEPROXY_REPLACEMENT \
	CILIUM_HELM_HOSTSERVICES_ENABLED \
	CILIUM_HELM_EXTERNALIPS_ENABLED \
	CILIUM_NODEPORT_ENABLED \
	CILIUM_HOSTPORT_ENABLED \
	CILIUM_BPF_MASQUERADE \
	CILIUM_IMAGE_PULLPOLICY \
	CILIUM_IPAM_MODE \
	CALICO_CLUSTER_NAME \
	CALICO_CLIENT_NAME \
	CALICO_CLIENT_VERSION \
	CALICO_CLIENT_DOWNLOAD_URL \
	CALICO_NODE_OPTIONS \
	CALICO_MANIFESTS \
	CALICO_DAEMONSET_ENV \
	OVN_KUBERNETES_GIT_TREE \
	OVN_KUBERNETES_DIR \
	OVN_KUBERNETES_DISTRO \
	WEAVENET_CLUSTER_NAME \
	WEAVENET_MANIFESTS

############### KIND/KUBECTL SETTINGS ##########################

KIND_VERSION="v0.10.0"
KIND_CMD="${BIN_PATH}"/kind

KUBECTL_VERSION="$(curl -L -s https://dl.k8s.io/release/stable.txt)"
KUBECTL_CMD="${BIN_PATH}"/kubectl
KUBECTL_PLATFORM="amd64"

WAIT_CLUSTER_GET_READY_SEC=2
WAIT_PODS_TO_BECAME_RUNNING_SEC=5

export	KIND_VERSION \
	KIND_CMD \
	KUBECTL_VERSION \
	KUBECTL_CMD \
	KUBECTL_PLATFORM \
	WAIT_CLUSTER_GET_READY_SEC \
	WAIT_PODS_TO_BECAME_RUNNING_SEC
