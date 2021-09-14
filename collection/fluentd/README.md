# Prerequisite
```
ansible-galaxy install geerlingguy.fluentd
```
Make sure /etc/logrotate.d/nginx.conf has 644 for file permission

# Run the playbook with deploy.sh
```
$ ./deploy.sh

Enter node ip address         : 

Enter ansible_user [debian]   : 

PLAY [consul cluster] *************************************************

TASK [Gathering Facts ]************************************************
...
```
