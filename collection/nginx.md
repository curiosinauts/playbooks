apt-get install git

git clone https://github.com/leev/ngx_http_geoip2_module.git

curl -L -O http://nginx.org/download/nginx-1.14.2.tar.gz


tar zxvf nginx-1.14.2.tar.gz 

apt-get install gcc

apt-get install libpcre3-dev

apt-get install zlib1g-dev


./configure --with-compat --add-dynamic-module=../ngx_http_geoip2_module


apt-get install make


make modules


added the following to /etc/network/interfaces
```
iface ens19 inet static
    address 192.168.4.120/32
    netmask 255.255.255.0
```


