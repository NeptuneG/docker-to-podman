#! /bin/bash

# https://www.redhat.com/sysadmin/replace-docker-podman-macos

yum install -y podman

groupadd -f -r podman

#systemctl edit podman.socket
mkdir -p /etc/systemd/system/podman.socket.d
cat >/etc/systemd/system/podman.socket.d/override.conf <<EOF
[Socket]
SocketMode=0660
SocketUser=root
SocketGroup=podman
