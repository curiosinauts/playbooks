#!/bin/sh

# deploy.sh initialize "tmt-vms[1:12]"
# deploy.sh oh-my-zsh  "tmt-vms[1:12]" root /root

# playbooks/consul/deploy.sh cluster "tmt-vms[1:3]"
# playbooks/consul/deploy.sh agent   "tmt-vms[4:12]"

# playbooks/nomad/deploy.sh cluster "tmt-vms[4:6]"
# playbooks/nomad/deploy.sh agent   "tmt-vms[7:8]"

# deploy.sh redis "tmt-vms[9:12]"

# deploy.sh nutcracker     "tmt-vms[7:8]"
# deploy.sh nutcracker-web "tmt-vms[7:8]"

playbook=${1}
target=${2:-tmt-vms}
user=${3:-vagrant}
args=${4:-}

export ANSIBLE_STDOUT_CALLBACK=debug

# ansible-playbook --extra-vars "target=${target} user=${user} home=${home} ${args}" playbooks/"${playbook}".yml
ansible-playbook --extra-vars "target=${target} user=${user} ${args}" playbooks/"${playbook}".yml