# Ansible playbooks tested against Ubuntu 20.04 

## What
Bunch of Ansible playbooks for quickly standing up various services

## How to use
Usage: deploy.sh <name of playbook without .yml extension in playbooks subfolder>
```
deloy.sh <playbook> [<host>] [<user>] [<args>]
```

Example:
```
$ deploy.sh jenkins server1.example.com
```

## Why
I needed to set up a local lab environment. Following services are created using the playbooks in this repo.

- ApacheDS
- Consul server & agent
- Docker registry
- Fabio
- Go install
- Grafana
- Graphite
- Java8 install
- Java11 install
- Jenkins
- Jupyterlab
- Neo4j
- Nomad cluster & agent
- Nutcracker aka twemproxy
- Postgres
- Prometheus
- Redis
- Vim-go

## Extra
If you use vagrant, keep on reading. It is possible to create machine images by utilizing Hashicorp's [Packer](https://www.packer.io/) I personally use Packer to create Vagrant VirtualBox images. These vagrant images can be hosted behind nginx and served with vagrant registry metadata json. 

Here is an example of how an image is added
```
vagrant box add http://tmt.7onetella.net/7onetella/redis
```

The URL, http://tmt.7onetella.net/7onetella/redis/ should render json like this.
```json
{
    "description": "",
    "name": "7onetella/redis",
    "versions": [
        {
        "providers": [
            {
            "checksum": "a21fbba6a56eeb90c737d4e03e9bb59e3570257c",
            "checksum_type": "sha1",
            "name": "virtualbox",
            "url": "http://tmt.7onetella.net/boxes/7onetella/redis/package.box"
            }
        ],
        "version": "5.0.7"
        }
    ]
}
```

Executing `vagrant init 7onetella/redis` will create a Vagrantfile that looks like this
```
Vagrant.configure("2") do |config|

  config.vm.box = "7onetella/redis"

end
```

I typically use my own tool [vag](https://github.com/7onetella/vag) to generate the Vagrantfile like the following.

```
vag init 7onetella/nomad-redis vm21-redis 192.168.0.31 --memory 512 --interface enp6s0 --service redis
```

Vagrantfile looking like this
```
Vagrant.configure("2") do |config|

  config.vm.box = "7onetella/redis"
  config.vm.network "public_network", ip: "192.168.0.31", bridge: "enp6s0"

  config.vm.provision "shell",
    run: "always",
    inline: "sleep 60; systemctl start redis; systemctl start consul"

  config.vm.provider "virtualbox" do |vb|
    vb.name   = "redis"
    vb.memory = "512"
  end

  config.vm.hostname          = "redis"

  config.ssh.insert_key       = false
  config.ssh.private_key_path = ['~/.vagrant.d/insecure_private_key', '~/.ssh/id_rsa']
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"

end
```
