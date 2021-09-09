#/bin/bash -e

ip=${1}


shopt -s expand_aliases
alias ssh='ssh -o LogLevel=error -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no debian@${ip}'


update_resolve_conf() {
    CMDS=$(cat <<EOF

sudo su -c "cat > /etc/resolv.conf <<EOF2
nameserver 192.168.0.110
nameserver 1.1.1.1
nameserver 8.8.8.8
EOF2
"

EOF
)
    ssh -t "${CMDS}"
}


update_resolve_conf
