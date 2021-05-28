

# Prerequisite
This script assumes you have you have your inventory defined in /etc/ansible/hosts
```
[gitea]
node.example.com

[all:vars]
ansible_connection=ssh
ansible_user=vagrant
ansible_port=22
ansible_private_key_file=~/.ssh/id_rsa
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
```

# Run the playbook with deploy.sh
`gitea.yml` 
```
$ ./deploy.sh gitea_node

Enter server domain : git.example.com
Enter secret key    : changeme_secret_key

Enter node1 hostname: node1.example.com
Enter node2 hostname: node2.example.com
Enter node3 hostname: node3.example.com

Enter ansible_user [vagrant]: 

PLAY [consul cluster] *************************************************

TASK [Gathering Facts ]************************************************
...
```