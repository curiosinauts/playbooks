#!/bin/bash

# CREDIT: https://gist.github.com/lkj4/5334042a0311784dbdacfad50907f463
# Status Work in Progress

set -x
nodes="$@"
rm ~/.ssh/known_hosts

install_k3s () {
  if [ $run -gt 2 ]; then
    role="agent"
  fi

  ssh-keyscan -H $1 >> ~/.ssh/known_hosts
  sleep .5

  ssh debian@$1 "sudo swapoff -a"
  ssh debian@$1 "curl -sfL https://get.k3s.io | \
    INSTALL_K3S_VERSION=v1.20.8+k3s1 \
    sh -s - \
    $role \
    $init_or_join \
    --node-external-ip $1"

  if [ $run -eq 0 ]; then
    sleep 3
    token=`ssh root@${nodes[0]} cat /var/lib/rancher/k3s/server/token`
    init_or_join=" --server https://${nodes[0]}:6443 --token $token"
  fi

  ((++run))
}

run=0
role="server"
# initializes new master
init_or_join=" --cluster-init"

for e in ${nodes[*]}; do
  install_k3s $e
done

ssh root@${nodes[0]} cat /etc/rancher/k3s/k3s.yaml | sed "s/127.*:/${nodes[0]}:/g" > kubeconfig.yaml
set +x