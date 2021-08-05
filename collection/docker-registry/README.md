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