#!/bin/bash -e

# set -x

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles:../roles:~/.ansible/roles


echo

read -p "Enter node ip address        [192.168.69.122]              : " ip_address

read -p "Enter server domain          [git-web.curiosityworks.org] : " server_domain

read -p "Enter git-ssh server domain  [git-ssh.curiosityworks.org] : " git_ssh_server_domain

read -p "Enter ansible_user           [debian]                     : " ansible_user

read -p "Enter secret key                                          : " secret_key

ip_address=${ip_address:-192.168.69.122}
server_domain=${server_domain:-git-web.curiosityworks.org}
git_ssh_server_domain=${git_ssh_server_domain:-git-ssh.curiosityworks.org}
ansible_user=${ansible_user:-debian}

cat ./hosts.tpl > hosts
echo "${ip_address}" >> hosts


ansible-playbook -i hosts -e "ansible_user=${ansible_user} server_domain=${server_domain} git_ssh_server_domain=${git_ssh_server_domain} secret_key=${secret_key}" gitea.yml    