#!/bin/bash -e

# set -x

usage() {
  echo -e "Usage   : deloy.sh <playbook> [<host>] [<user>] [<args>]"  
  echo
  echo -e 'Example : deloy.sh redis "tmt-vms[9:12].7onetella.net"'
  echo
}

deploy() {
    playbook=${1}
    target=${2:-tmt-vm13.7onetella.net}
    user=${3:-vagrant}
    args=${4:-}

    export ANSIBLE_STDOUT_CALLBACK=debug

    ansible-playbook --extra-vars "target=${target} user=${user} ${args}" playbooks/"${playbook}".yml    
}

if [[ ${1} = "" ]]; then
  usage
  exit 1
fi

deploy "${1}" "${2}" "${3}" "${4}"