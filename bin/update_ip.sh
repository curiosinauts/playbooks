#/bin/bash -e

ip="192.168.0.99"
new_ip=${1}


shopt -s expand_aliases
alias ssh='ssh -o LogLevel=error -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no debian@${ip}'


update_ip() {
    CMDS=$(cat <<EOF

sudo su -c "cat > /etc/network/interfaces.d/50-cloud-init <<EOF2
# This file is generated from information provided by the datasource.  Changes
# to it will not persist across an instance reboot.  To disable cloud-init's
# network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
auto lo
iface lo inet loopback
    dns-nameservers 192.168.0.110 1.1.1.1 8.8.8.8
    dns-search curiosityworks.org

auto eth0
iface eth0 inet static
    dns-nameservers 192.168.0.110 1.1.1.1 8.8.8.8
    dns-search curiosityworks.org
    address ${new_ip}/32
    gateway 192.168.0.1
EOF2
"

EOF
)
    ssh -t "${CMDS}"
}

update_resolve_conf() {
    CMDS=$(cat <<EOF

sudo su -c "cat > /etc/resolv.conf <<EOF2
nameserver 192.168.0.110
nameserver 1.1.1.1
nameserver 8.8.8.8
EOF2

reboot -f now
"

EOF
)
    ssh -t "${CMDS}"
}

update_ip

update_resolve_conf
