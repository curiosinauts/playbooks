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
read -p "Enter node ip address [192.168.4.119]    : " ip_address
echo
read -p "Enter ansible user    [debian]           : " ansible_user
echo
read -p "Enter ide to install  [GoLand 2021.3]    : " ide
echo
read -p "Enter port            [9999]             : " port


ip_address=${ip_address:-192.168.4.119}
ansible_user=${ansible_user:-debian}
ide=${ide:-"GoLand 2021.3"}
config_name=$(echo ${ide} awk '{ print $1 }')
port=${port:-9999}

cat ./hosts.tpl > hosts
echo "${ip_address}" >> hosts

echo ${ide}

ansible-playbook -i hosts -e "ansible_user=${ansible_user} ide='${ide}' config_name=${config_name} port=${port}" projector.yml    

rm -f hosts || true