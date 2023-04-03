#!/usr/bin/env bash

set -e

cat << EOF
---
all:
  hosts:
    nexus-01:
      ansible_host: $(terraform output external_ip_nexus | jq -j)
  children:
    nexus:
      hosts:
        nexus-01:
  vars:
    ansible_connection_type: paramiko
    ansible_user: centos
EOF