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
read -p "slack_hook_url                    : " slash_hook_url

ip_address=${ip_address:-192.168.0.119}
ansible_user=${ansible_user:-debian}
slash_hook_url=${slash_hook_url:-https://hooks.slack.com/services/xxxxxx}

cat ./hosts.tpl > hosts
echo "${ip_address}" >> hosts

ansible-playbook -i hosts -e "ansible_user=${ansible_user} slash_hook_url=${slash_hook_url}" sshrc.yml    

rm -f hosts || true