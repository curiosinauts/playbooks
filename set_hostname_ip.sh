#/bin/bash -e

hostname=${1}
ip=${2}
new_ip=${3}


shopt -s expand_aliases
alias ssh='ssh -o LogLevel=error -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no debian@${ip}'


update_hostname_ip() {
    CMDS=$(cat <<EOF
sudo su -c "echo ${hostname} > /etc/hostname"

sudo su -c "cat > /etc/network/interfaces <<EOF2
source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
allow-hotplug ens18
iface ens18 inet static
 address ${new_ip}
 netmask 255.255.255.0
 gateway 192.168.0.1
 dns-search curiosityworks.org
 dns-nameservers 8.8.8.8 8.8.4.4
EOF2"

EOF
)
    ssh -t "${CMDS}"
}

update_hostname_ip

