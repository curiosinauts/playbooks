# What
This repo is a collection of Ansible playbooks I have accumulated over the years. My playbooks are designed to automate deployment of various servers that run in my homelab.

Things that are interesting about my **homelab** are 

* Multiple sites and applications are running behind nginx with LetsEnrypt TLS cert.
* I monitor hacking attempts from all over the world by leveraging logging infrastructure set up with nginx logs, fluentd, and elasticsearch.
* Basic alerts are setup for CPU, memory and hard disk.
* Full online coding platform runs with vscode in a browser(aka code server from coder.com).
* Postgres databases run with TLS cert.
* k3s runs docker instances.
* I manage my own internal docker registry behind nginx with TLS cert.
* Slackbot is used for receiving alerts, Jenkins build automation, management of docker registry, service deployment, gitea user management, database user management, etc.


# Why
Having a personal R&D environment accelerates learning. Therefore, being able to automate server deployment or config change is crucial.


# List of Ansible playbooks
I have extracted most of what would be hard coded names and values as variables as much as I can but there are remaining configs that still need to be variablized. If you want to improve reusability fill free to create PRs.

- ApacheDS
- Cerbot
- Consul server & agent
- Docker
- Docker registry
- Elasticsearch
- Fabio
- Fluentd
- Gitea
- Go install
- Grafana
- Graphite
- Java8 install
- Java11 install
- Jenkins
- Jupyterlab
- Kibana
- K3S
- Neo4j
- Node Exporter
- Nomad cluster & agent
- Nutcracker aka twemproxy
- Pihole
- Postgres
- Jetbrains Projector
- PgAdmin
- Prometheus
- Proxmox Base Image
- Redis
- Vim-go

