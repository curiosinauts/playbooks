# Playbooks used and tested against Ubuntu 18.04 

## How to use
Usage: deploy.sh <name of playbook without .yml extension in playbooks subfolder>

Example:
```
$ ./deploy.sh jenkins
```

## Aminator Ansible Provisioner
https://github.com/aminator-plugins/ansible-provisioner

## How to install from ansible galaxy
ansible-galaxy install geerlingguy.jenkins -p ./roles 

