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

set -x

sudo systemctl stop -f postgresql-proxy.socket || true
sudo systemctl stop -f postgresql-proxy.service || true
sudo systemctl stop -f postgresql.service || true

ansible-playbook -i hosts ${extra_option} -e "username=${username}" postgresql-proxy.yml
# ansible-playbook -i hosts -e "username=foo ansible_sudo_pass=bar" postgresql-proxy.yml

sudo systemctl daemon-reload

sudo systemctl start postgresql-proxy.socket
sudo systemctl start postgresql.service
sudo systemctl start postgresql-proxy.service
