1. Подготовка Docker-окружения (если контейнеры ещё не запущены или нужно обновить)

docker build -t ubuntu-ansible ./ubuntu
docker run -d --name ubuntu ubuntu-ansible

docker build -t centos7-ansible ./centos
docker run -d --name centos7 centos7-ansible

docker ps

mkdir -p .vault
echo "netology" > .vault/pass
chmod 600 .vault/pass

ansible-vault decrypt group_vars/el/examp.yml --vault-password-file .vault/pass 2>/dev/null
ansible-vault decrypt group_vars/deb/examp.yml --vault-password-file .vault/pass 2>/dev/null

echo '---' > group_vars/el/examp.yml
echo 'some_fact: "el"' >> group_vars/el/examp.yml
echo '---' > group_vars/deb/examp.yml
echo 'some_fact: "deb"' >> group_vars/deb/examp.yml

ansible -i inventory/test.yml localhost -m debug -a "var=some_fact"   # должно быть 12
echo '---' > group_vars/all/examp.yml
echo 'some_fact: "all default fact"' >> group_vars/all/examp.yml
ansible -i inventory/test.yml localhost -m debug -a "var=some_fact"   # теперь "all default fact"

ansible-playbook -i inventory/prod.yml site.yml

echo '---' > group_vars/el/examp.yml
echo 'some_fact: "el default fact"' >> group_vars/el/examp.yml
echo '---' > group_vars/deb/examp.yml
echo 'some_fact: "deb default fact"' >> group_vars/deb/examp.yml

ansible-playbook -i inventory/prod.yml site.yml

ansible-vault encrypt group_vars/el/examp.yml --vault-password-file .vault/pass
ansible-vault encrypt group_vars/deb/examp.yml --vault-password-file .vault/pass

ansible-playbook -i inventory/prod.yml site.yml --vault-password-file .vault/pass


mkdir -p group_vars/local
echo '---' > group_vars/local/examp.yml
echo 'some_fact: "local default fact"' >> group_vars/local/examp.yml

ansible-playbook -i inventory/prod.yml site.yml --vault-password-file .vault/pass
