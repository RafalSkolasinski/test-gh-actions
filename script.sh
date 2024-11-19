#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

LIMA_NAME="${LIMA_NAME:-k3s}"

set +e +x
lima_list=$(limactl ls $LIMA_NAME --format json)
set -e

if [[ -n "$lima_list" ]]; then
    set -x
    echo "Using exist ${LIMA_NAME} VM."
else
    set -x
    limactl start --name ${LIMA_NAME} --vm-type=vz --network vzNAT template://ubuntu-lts
fi

limactl shell ${LIMA_NAME} sudo apt-get update
limactl shell ${LIMA_NAME} sudo apt-get install avahi-daemon --yes
limactl shell ${LIMA_NAME} sudo systemctl enable --now avahi-daemon

limactl shell ${LIMA_NAME} sh -c "curl -sfL https://get.k3s.io |  sh -s - $@ --tls-san lima-${LIMA_NAME}.local"

SSH_FILE=$(limactl ls --format='{{.SSHConfigFile}}' ${LIMA_NAME})

ssh -F ${SSH_FILE} lima-${LIMA_NAME} sudo cat /etc/rancher/k3s/k3s.yaml | kube-config-merge --name lima-${LIMA_NAME} --server https://lima-${LIMA_NAME}.local:6443 --override
