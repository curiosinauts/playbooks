#!/bin/bash -e

# set -x

usage() {
  echo -e "Usage   : deloy.sh"  
  echo
  echo -e 'Example : deloy.sh"'
  echo
  echo -e "Enter jenkins hostname [tmt-vm17] : "
  echo -e "Enter ansible_user     [vagrant]  : "
  echo -e "Enter admin password   [admin]    : ****"
}

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles:../roles:~/.ansible/roles

if [ "${1}" = "-h" ]; then
    usage
    exit 0
fi

echo
read -p "Enter jenkins hostname [tmt-vm17] : " jenkins_host
read -p "Enter ansible user     [vagrant]  : " ansible_user
read -p "Enter admin password   [admin]    : " admin_password

jenkins_host=${jenkins_host:-tmt-vm17.7onetella.net}
ansible_user=${ansible_user:-vagrant}
admin_password=${admin_password:-admin}

ansible-playbook -e "target=${jenkins_host} jenkins_host=${jenkins_host} ansible_user=${ansible_user} admin_password=${admin_password}" jenkins.yml    