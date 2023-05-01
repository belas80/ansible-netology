#!/usr/bin/env bash

set -e

cat << EOF
---
all:
  hosts:
    nexus-01:
      ansible_host: $(terraform output external_ip_nexus | jq -j)
    tc-agent:
      ansible_host: $(terraform output external_ip_agent | jq -j)
      ansible_user: ubuntu
  children:
    nexus:
      hosts:
        nexus-01:
  vars:
    ansible_connection_type: paramiko
    ansible_user: centos
    ansible_ssh_common_args: "-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
EOF