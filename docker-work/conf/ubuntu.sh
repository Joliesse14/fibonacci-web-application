#!/bin/bash
cd ~ || exit 1
ssh-keygen  -f /home/ubuntu/.ssh/id_ed25519 -N ""
touch .ssh/authorized_keys
touch .hushlogin
