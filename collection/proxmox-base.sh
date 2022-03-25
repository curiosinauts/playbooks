#!/bin/bash -e

# set -x

usage() {
  echo -e "Usage   : deloy.sh <hosts>"  
  echo
  echo -e 'Example : deloy.sh 192.168.69.244'
  echo
}

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles:../roles

# if [ "${1}" = "" ]; then
#     usage
#     exit 0
# fi

echo
read -p "Enter node ip address  [192.168.69.244] : " ip_address

echo
read -p "Enter ansible_user     [temp]          : " ansible_user

ip_address=${ip_address:-192.168.69.244}
ansible_user=${ansible_user:-temp}

cat ./hosts.tpl > hosts
echo "${ip_address}" >> hosts 

ansible-playbook -i hosts -e "ansible_user=${ansible_user}" proxmox-base.yml    

rm -rf hosts || true