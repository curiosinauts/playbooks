#!/bin/bash -e

# set -x

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles:../roles:~/.ansible/roles

echo
read -p "Enter vm instance ip address  [192.168.0.100]       : " ip_address
echo
read -p "Enter ansible_user            [debian]              : " ansible_user
echo
read -p "Enter loki host               [192.168.0.130]       : " loki_host
echo
read -p "Enter job label               [nginxlogs]           : " job_label
echo
read -p "Enter log files path          [e.g. /var/log/nginx] : " log_path

ip_address=${ip_address:-192.168.0.100}

ansible_user=${ansible_user:-debian}

loki_host=${loki_host:-192.168.0.130}

job_label=${job_label:-nginxlogs}

log_path=${log_path:-/var/log/nginx}

cat ./hosts.tpl > hosts
echo ${ip_address} >> hosts 

ansible-playbook -i hosts -e "loki_host=${loki_host} job_label=${job_label} log_path=${log_path}" promtail.yml    

rm -f hosts

