#!/bin/bash

ssh root@$1 "useradd ansible;passwd ansible;usermod -aG wheel  ansible;chmod 755 /etc/sudoers;sed -i '/\%wheel\tALL=(ALL)\tALL/s/^/#/1' /etc/sudoers;sed -i '/\%wheel\tALL=(ALL)\tNOPASSWD/s/# //1' /etc/sudoers;chmod 440 /etc/sudoers"

cat ~/.ssh/id_rsa.pub | ssh ansible@$1 "umask 077; mkdir -p .ssh ; cat >> .ssh/authorized_keys"
