# **Virtualization server set up notes**


## **Host server set up**
---
I use ubuntu 18.04 as host server. 

### **step 0 - set up apt-cacher-ng server
https://fabianlee.org/2018/02/11/ubuntu-a-centralized-apt-package-cache-using-apt-cacher-ng/

https://blog.packagecloud.io/eng/2015/05/05/using-apt-cacher-ng-with-ssl-tls/

### **step 1 - no password for current user**
use visudo change the line sudo
```
%sudo  ALL=(ALL) NOPASSWD: ALL
```

### **step 2 - change to static ip by updating /etc/netplan/*.yml**

https://linuxconfig.org/how-to-configure-static-ip-address-on-ubuntu-18-04-bionic-beaver-linux


### **step 3 - update the apt packages**
```
sudo apt-get update
sudo apt-get upgrade
```

optional
```
sudo apt-get dist-upgrade  <===??? distro upgrade means kernel upgrade?
```

### **step 4 - virtualbox install using cli**

https://vitux.com/how-to-install-virtualbox-on-ubuntu/

we dont need extension pack 

### **step 5 - create generate.sh for quickly generating Vagrantfile**
```
vagrant@dell:~$ vi generate.sh
#!/bin/sh
set +x

IP=$1
MEM=$2
VM_NAME=$3

cat Vagrantfile.tpl | sed "s/__ip__/${IP}/g" | sed "s/__mem__/${MEM}/g" > Vagrantfile

mkdir -p ${VM_NAME}
mv Vagrantfile ${VM_NAME}/

cd ${VM_NAME}

vagrant up
```

### **step 6 - create Vagrantfile template file**
```
vagrant@dell:~$ vi Vagrantfile.tpl
Vagrant.configure("2") do |config|

  config.vm.box = "hashicorp/bionic64"

  config.vm.network "public_network", ip: "__ip__", bridge: "enp0s25"

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "__mem__"
  end

  config.ssh.insert_key = false # 1
  config.ssh.private_key_path = ['~/.vagrant.d/insecure_private_key', '~/.ssh/id_rsa'] # 2
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys" # 3

end
```


## **Guest virtualbox instance setup**
---
I use ubuntu 18.04 from Hashcorp


### playbook oh-my-zsh

### playbook initialize


done - redis 4 512 of ram?


laptop
  postgres 1 - laptop

nomad
  number of app 2
  nubmer of fabio 2


consul
  vm1
  vm2
  vm3

nomad
  vm4
  vm5
  vm6

consul-client, nomad-client, fabio, python-pip, python redis, updated consul to allow local shell execution for health check
  vm7
  vm8

redis
  vm9
  vm10
  vm11
  vm12

http://apt-cache.7onetella.net:3142/acng-report.html?doCount=Count+Data#stats  


tmt-vm1.7onetella.net doens't say much


ker vagrant info vm1  apt-get, consul
  * host   : tmt-vm1.7onetella.net
  * alias  : consul-cluster
  * memory : 1024
  * ip     : 192.168.0.1

base:
  * os     : ubuntu 19
  * python : 3.7
  * shell  : oh-my-zsh, vim-go, init

build-server:
  * go, java, python

neo4j-server:
  
spark-server:

graphite

grafana

promethius

redis

fabio



ker vagrant up 7onetella/consul

ker vagrant halt

ker vagrant list

ker consul service list


