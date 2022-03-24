#!/bin/bash -e

# set -x

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles:../roles

echo
read -p "Enter node ip address  [192.168.0.100]            : " ip_address
ip_address=${ip_address:-192.168.0.100}

echo
read -p "Enter ansible_user     [debian]                  : " ansible_user
ansible_user=${ansible_user:-debian}

echo
read -p "Enter email            [cloudflare email]        : " email
email=${email:-admin@curiosityworks.org}

echo
read -p "Enter cloudflare api_key                          : " api_key

cat ./hosts.tpl > hosts
echo "${ip_address}" >> hosts 

ansible-playbook -i hosts -e "ansible_user=${ansible_user} email=${email} api_key=${api_key}" certbot.yml    

rm -f hosts || true
