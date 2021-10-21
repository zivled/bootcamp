#!/bin/bash

######################################### delete me #########################33

# Variable Declaration
KUBERNETES_VERSION="1.19.15-00"

# install docker
sudo apt update
sudo apt install docker.io -y
docker -v
sudo systemctl enable docker
sudo systemctl status docker

# sudo apt-get install curl

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && \
  echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list && \
  sudo apt-get update -q && \
  sudo apt-get install -qy kubelet=$KUBERNETES_VERSION kubectl=$KUBERNETES_VERSION kubeadm=$KUBERNETES_VERSION

# # Since you are downloading Kubernetes from a non-standard repository, it is essential to ensure that the software is authentic. This is done by adding a signing key.
# curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add

# # Kubernetes is not included in the default repositories. To add them, enter the following
# sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

# # Install Kubernetes tools with the command
# sudo apt-get install -qy kubelet=$KUBERNETES_VERSION kubectl=$KUBERNETES_VERSION kubeadm=$KUBERNETES_VERSION

kubeadm version

# disable swap 
sudo swapoff -a

# keeps the swaf off during reboot
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab