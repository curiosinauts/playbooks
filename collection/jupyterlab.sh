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
echo
read -p "Enter user             [debian]   : " user

ip_address=${ip_address:-192.168.0.121}
ansible_user=${ansible_user:-debian}
user=${user:-debian}
setup_option=$1

cat ./hosts.tpl > hosts
echo "${ip_address}" >> hosts

ansible-playbook -i hosts -e "ansible_user=${ansible_user} user=${user} bind_addr=${ip_address} setup_option=${setup_option}" jupyterlab.yml    

rm -f hosts || true