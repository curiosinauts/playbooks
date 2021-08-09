# Run the playbook with deploy.sh
```
$ ./deploy.sh 

Enter node ip address       :

Enter ansible_user [debian] :

Enter email                 :

Enter api_key               : xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 

PLAY [certbot] **********************************************************************************************************************************************************************************************************************************************

...
```

# Install certs
```
certbot certonly \
  --dns-cloudflare \
  --dns-cloudflare-credentials ~/.secrets/certbot/cloudflare.ini \
  --dns-cloudflare-propagation-seconds 60 \
  -d example.com
  -d *.example.com
```