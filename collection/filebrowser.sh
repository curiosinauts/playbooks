#!/bin/bash -e

# set -x

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles:../roles:~/.ansible/roles

echo
read -p "Enter vm instance ip address  [192.168.69.106]                      : " ip_address
echo
read -p "Enter NFS server host ip      [192.168.99.33]                       : " nfs_host
echo
read -p "Enter ansible_user            [debian]                              : " ansible_user
echo
read -p "Enter root dir                [/mnt/data/foo/bar]                   : " root_dir
echo
read -p "Enter admin password          [admin]                               : " admin_password
echo

ip_address=${ip_address:-192.168.69.106}

nfs_host=${nfs_host:-192.168.99.33}

ansible_user=${ansible_user:-debian}

root_dir=${root_dir:-/mnt/data/foo}

admin_password=${admin_password:-admin}

cat ./hosts.tpl > hosts
echo ${ip_address} >> hosts 

ansible-playbook -i hosts -e "ansible_user=${ansible_user} nfs_host=${nfs_host} root_dir=${root_dir} admin_password=${admin_password}" filebrowser.yml    

rm -f hosts

