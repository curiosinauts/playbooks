#!/bin/bash -e

# set -x

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles:../roles:~/.ansible/roles

echo
read -p "Enter vm instance ip address  [192.168.69.100]                      : " ip_address
echo
read -p "Enter ansible_user            [debian]                              : " ansible_user
echo
read -p "Enter loki host               [192.168.69.130]                      : " loki_host
echo
read -p "Enter job label               [nginx_access_log]                    : " job_label
echo
read -p "Enter log files path          [e.g. /var/log/nginx/access.log]      : " log_path_expression

ip_address=${ip_address:-192.168.69.100}

ansible_user=${ansible_user:-debian}

loki_host=${loki_host:-192.168.69.130}

job_label=${job_label:-nginx_access_log}

log_path_expression=${log_path_expression:-/var/log/nginx/access.log}

cat ./hosts.tpl > hosts
echo ${ip_address} >> hosts 

ansible-playbook -i hosts -e "loki_host=${loki_host} job_label=${job_label} log_path_expression=${log_path_expression}" promtail.yml    

rm -f hosts

