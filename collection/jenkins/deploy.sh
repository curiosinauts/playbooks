#!/bin/bash -e

# set -x

usage() {
  echo -e "Usage   : deloy.sh [<setup_option>]"  
  echo
  echo -e 'Example : deloy.sh consul'
  echo
  echo -e "Enter jenkins hostname            : "
  echo
  echo -e "Enter ansible_user     [debian]   : "
  echo
  echo -e "Enter admin password   [admin]    : ****"
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
read -p "Enter admin password   [admin]    : " admin_password

ip_address=${ip_address:-192.168.0.108}
ansible_user=${ansible_user:-debian}
admin_password=${admin_password:-admin}

cp ~/.kube/config ~/src/github.com/curiosinauts/playbooks/collection/roles/kubectl/files/
cp ~/.platformctl.yaml ~/src/github.com/curiosinauts/playbooks/collection/roles/platformctl/files/ 

cat ../hosts.tpl > hosts
echo "${ip_address}" >> hosts

ansible-playbook -i hosts -e "setup_option=${1} ansible_user=${ansible_user} admin_password=${admin_password}" jenkins.yml    

rm -f hosts || true