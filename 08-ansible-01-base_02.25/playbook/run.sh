#!/bin/bash
set -e
docker build -t centos7-ansible ./centos
docker build -t ubuntu-ansible ./ubuntu
docker build -t fedora-ansible ./fedora
docker stop centos7 ubuntu fedora
docker rm centos7 ubuntu fedora
docker run -d --name centos7 centos7-ansible
docker run -d --name ubuntu ubuntu-ansible
docker run -d --name fedora fedora-ansible
echo "=== containers to start ==="
sleep 5
ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass
echo "=== stopping containers ==="
docker stop centos7 ubuntu fedora

