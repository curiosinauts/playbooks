[all:vars]
ansible_connection=ssh
ansible_port=22
ansible_private_key_file=~/.ssh/id_rsa
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
ansible_python_interpreter=/usr/bin/python3

[nodes]
