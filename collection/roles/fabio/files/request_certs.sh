#!/bin/bash

sudo certbot certonly --manual --preferred-challenges=dns --email 7onetella@gmail.com \
-d 7onetella.net -d '*.7onetella.net'