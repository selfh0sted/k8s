#!/bin/bash
cd terraform
terraform apply --auto-approve
cd ../ansible
ansible all -m ping
ansible-playbook playbook.yaml
