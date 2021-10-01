#!/bin/bash -e

# set -x

usage() {
  echo -e "Usage   : deloy.sh"  
  echo
}

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles:../roles:~/.ansible/roles

if [ "${1}" = "-h" ]; then
    usage
    exit 0
fi

echo
read -p "Enter node ip address             : " ip_address
echo
read -p "Enter ansible user     [debian]   : " ansible_user

ip_address=${ip_address:-192.168.0.118}
ansible_user=${ansible_user:-debian}

cat ./hosts.tpl > hosts
echo "${ip_address}" >> hosts

ansible-playbook -i hosts -e "ansible_user=${ansible_user}" uploader.yml    

rm -f hosts || true