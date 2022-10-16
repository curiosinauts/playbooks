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

helm install metallb metallb/metallb --wait --namespace metallb-system

cat <<EOF | kubectl apply -f -
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: internal-addresses
  namespace: metallb-system
spec:
  addresses:
  - 192.168.56.101-192.168.56.200
---
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: l2
  namespace: metallb-system
EOF

```