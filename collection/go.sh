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
read -p "Enter  user            [debian]   : " user
echo
read -p "Enter  go version      [1.16.7]   : " version

ip_address=${ip_address:-192.168.0.108}
ansible_user=${ansible_user:-debian}
user=${user:-debian}
version=${version:-1.16.7}

cat ./hosts.tpl > hosts
echo "${ip_address}" >> hosts

ansible-playbook -i hosts -e "ansible_user=${ansible_user} user=${user} version=${version}" go.yml    

rm -f hosts || true