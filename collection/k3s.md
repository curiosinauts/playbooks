# Caution
k3s role is design for vagrant local environment. The metallb ip address range is set for vagrant private ip range. Therefore, this role is not suitable for any other environment.

## What's installed

* k3s
* kubectl
* helm

## Manual install of metallb
```
helm repo add metallb https://metallb.github.io/metallb
kubectl create namespace metallb-system
helm install metallb metallb/metallb --wait -f /tmp/k3s/metallb-values.yaml --namespace metallb-system
kubectl apply -f /tmp/k3s/l2-address-pool.yaml
kubectl apply -f /tmp/k3s/l2-advertisement.yaml
```