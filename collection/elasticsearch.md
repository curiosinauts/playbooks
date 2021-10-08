# Prerequisite
```
ansible-galaxy install elastic.elasticsearch,v7.14.0
```

# Run the playbook with deploy.sh
```
$ ./deploy.sh

Enter node ip address         : 

Enter ansible_user [debian]   : 

PLAY [consul cluster] *************************************************

TASK [Gathering Facts ]************************************************
...
```

# Edit /etc/elasticsearch/elasticsearch.yml
add the following
```
xpack.security.enabled: false
```

# Create built-in users
https://www.elastic.co/guide/en/elasticsearch/reference/7.14/security-minimal-setup.html#security-create-builtin-users

use the `kibana_system` for kibana

use the user `logstash` from playbook in fluentd
