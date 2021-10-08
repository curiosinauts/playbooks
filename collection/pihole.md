# Install pihole manually 
```
curl -sSL https://install.pi-hole.net | bash
```

# Update the admin password
```
pihole -a -p
```

# Restart pihole
```
systemctl restart pihole-FTL
```

# Import Teleporter settings backup file
Settings > Teleporter > Restore

# Run the playbook with deploy.sh
```
$ ./deploy.sh 

Enter node ip address         : 

Enter ansible_user [debian]   : 

PLAY [consul cluster] *************************************************

TASK [Gathering Facts ]************************************************
...
```
