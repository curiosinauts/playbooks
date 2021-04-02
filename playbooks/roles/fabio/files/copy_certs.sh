#!/bin/bash

sudo cp /etc/letsencrypt/live/7onetella.net/fullchain.pem ./7onetella.net-cert.pem
sudo cp /etc/letsencrypt/live/7onetella.net/privkey.pem ./7onetella.net-key.pem
sudo chwon fabio:fabio ./7onetella.net-cert.pem
sudo chwon fabio:fabio ./7onetella.net-key.pem