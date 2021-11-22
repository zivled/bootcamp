#!/bin/bash

sudo apt-get install nfs-kernel-server
sudo mkdir -p /export/nfs
sudo chmod 777 /export/nfs
# /home/users    /export/users   none    bind  0  0     ------> to /etc/fstab

# /export       192.168.1.0/24(rw,fsid=0,insecure,no_subtree_check,async)
# /export/users 192.168.1.0/24(rw,nohide,insecure,no_subtree_check,async) ------------- > to /etc/exports

# $ sudo exportfs -a
# $ sudo systemctl restart nfs-kernel-server

# sudo ufw allow from 192.168.43.0/24 to any port nfs
# $ sudo ufw enable
# $ sudo ufw status



helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
    --set nfs.server=172.28.128.100 \
    --set nfs.path=/export/nfs


helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update
helm install my-release nginx-stable/nginx-ingress

