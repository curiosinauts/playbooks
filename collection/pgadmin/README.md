# Run the playbook with deploy.sh
```
$ ./deploy.sh gitea_node

Enter node ip address         : 

Enter ansible_user [debian]   : 

PLAY [consul cluster] *************************************************

TASK [Gathering Facts ]************************************************
...
```

# Once apt install is done execute the following manually
```
sudo /usr/pgadmin4/bin/setup-web.sh
```