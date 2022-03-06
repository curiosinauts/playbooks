# Installing and executing cerbots
Run the `cerbot.sh` to install certbot and all of its dependencies

Install certs using certbot
```
    certbot certonly \
      --dns-cloudflare \
      --dns-cloudflare-credentials ~/.secrets/certbot/cloudflare.ini \
      --dns-cloudflare-propagation-seconds 60 \
      -d curiosityworks.org \
      -d "*.curiosityworks.org" \
      -d "*.int.curiosityworks.org"
```