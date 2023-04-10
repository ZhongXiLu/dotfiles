#!/bin/bash

set -e

podman machine init || true
sudo podman-mac-helper install

echo "If necessary, you can install your custom certificate by:"
echo -e "
    \033[33mpodman machine start
    podman machine ssh
    [core@localhost ~]$ sudo su -
    [root@localhost ~]# cd /etc/pki/ca-trust/source/anchors
    [root@localhost ~]# vi zscaler.pem
    # Copy certificate contents in here, before continuing
    [root@localhost anchors]# update-ca-trust
    [root@localhost anchors]# exit
    [core@localhost ~]$ exit\033[0m
"

echo "podman ✅"
