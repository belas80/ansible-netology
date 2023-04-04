#!/usr/bin/env bash

set -e

cd terraform
TF_IN_AUTOMATION=1 terraform init
TF_IN_AUTOMATION=1 terraform plan
TF_IN_AUTOMATION=1 terraform apply -auto-approve

TC_SERVER=$(terraform output external_ip_server | jq -j)
TC_AGENT=$(terraform output external_ip_agent | jq -j)
NEXUS_SERVER=$(terraform output external_ip_nexus | jq -j)

bash gen_inventory.sh > ../ansible/inventory/cicd/hosts.yml

cd ../ansible
ansible-playbook -i inventory/cicd/hosts.yml wait-server-start.yml
ansible-playbook -i inventory/cicd/hosts.yml site.yml

echo "Address teamcity server: http://"$TC_SERVER":8111"
echo "Address nexus: http://"$NEXUS_SERVER":8081"
echo "IP teamcity agent: "$TC_AGENT