#!/bin/sh

if [ -d /var/snap/network-manager/current/ ]; then
    mkdir -p /var/snap/network-manager/current/conf.d
    cat > /var/snap/network-manager/current/conf.d/disable-polkit.conf <<EOF
[main]
auth-polkit=false
EOF
fi

if [ -x /snap/bin/lxd ]; then
    #initalize lxd with zfs storage backend for sudo support
    /snap/bin/lxd init --storage-backend zfs --auto
fi
