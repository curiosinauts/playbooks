#!/bin/bash -e

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles

echo
read -p "Enter username                                  : " username
extra_option="-u ${username} -K"

echo
read -p "Enter instance ip address  [192.168.10.101]     : " ip_address

ip_address=${ip_address:-192.168.10.101}

cat ./hosts.tpl > hosts
echo ${ip_address} >> hosts

ansible-playbook -i hosts ${extra_option} -e "username=${username}" postgresql-proxy.yml
# ansible-playbook -i hosts -e "username=foo ansible_sudo_pass=bar" postgresql-proxy.yml
