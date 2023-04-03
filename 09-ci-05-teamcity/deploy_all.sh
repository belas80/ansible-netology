#!/usr/bin/env bash

set -e

cd terraform
TF_IN_AUTOMATION=1 terraform init
TF_IN_AUTOMATION=1 terraform plan
TF_IN_AUTOMATION=1 terraform apply -auto-approve

bash gen_inventory.sh > ../ansible/inventory/cicd/hosts.yml

cd ../ansible
ansible-playbook -i inventory/cicd/hosts.yml wait-server-start.yml
ansible-playbook -i inventory/cicd/hosts.yml site.yml