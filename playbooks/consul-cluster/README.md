# How to use run this playbook

# deploy.sh
This script assumes you have you have your inventory defined in /etc/ansible/hosts
```
[consul_cluster]
node[1:3].example.com

[all:vars]
ansible_connection=ssh
ansible_user=vagrant
ansible_port=22
ansible_private_key_file=~/.ssh/id_rsa
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
```

`consul-cluster.yml` playbook expects three node cluster. Enter FQDN node host names.
```
$ ./deploy.sh consul_cluster

Enter node1 hostname: node1.example.com
Enter node2 hostname: node2.example.com
Enter node3 hostname: node3.example.com

Enter ansible_user [vagrant]: 
```