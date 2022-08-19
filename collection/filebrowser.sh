#!/bin/bash -e

# set -x

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles:../roles:~/.ansible/roles

echo
read -p "Enter vm instance ip address  [192.168.4.106]                       : " ip_address
echo
read -p "Enter ansible_user            [debian]                              : " ansible_user
echo
read -p "Enter root dir                [/mnt/data/xxx/yyy]                   : " root_dir
echo
read -p "Enter admin password          [admin]                               : " admin_password
echo

ip_address=${ip_address:-192.168.4.106}

ansible_user=${ansible_user:-debian}

root_dir=${root_dir:-/mnt/data}

admin_password=${admin_password:-admin}

cat ./hosts.tpl > hosts
echo ${ip_address} >> hosts 

ansible-playbook -i hosts -e "ansible_user=${ansible_user} root_dir=${root_dir} admin_password=${admin_password}" filebrowser.yml    

rm -f hosts

