#!/bin/bash
# hard coded - change me
vagrant up
sshpass -f password.txt ssh-copy-id vagrant@172.28.128.201
sshpass -f password.txt ssh-copy-id vagrant@172.28.128.202
sshpass -f password.txt ssh-copy-id vagrant@172.28.128.203
ansible-galaxy install -r requirements.yml
ansible-playbook k8s_pre.yml -i inventory.yml -b