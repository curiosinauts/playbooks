

# Prerequisite
This script assumes you have you have your inventory defined in /etc/ansible/hosts
```
[docker_registry]
node10.example.com

[all:vars]
ansible_connection=ssh
ansible_user=vagrant
ansible_port=22
ansible_private_key_file=~/.ssh/id_rsa
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
```

# Run the playbook with deploy.sh
`docker-registry.yml` playbook expects three consul node cluster. Enter FQDN node host names.
```
$ ./deploy.sh docker_registry

Enter host_url (e.g. https://docker-registry.example.com): https://docker-registry.example.com

Enter consul node1 hostname: node1.example.com
Enter consul node2 hostname: node2.example.com
Enter consul node3 hostname: node3.example.com

Enter ansible_user [vagrant]: 

PLAY [consul cluster] *************************************************

TASK [Gathering Facts ]************************************************
...
```