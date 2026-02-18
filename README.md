1. Подготовка Docker-окружения (если контейнеры ещё не запущены или нужно обновить)
<img width="1573" height="638" alt="1 facts_test-1" src="https://github.com/user-attachments/assets/5b1799e4-2caa-4cea-a242-42012adf4714" />
<img width="1371" height="662" alt="2  file_with_variabels" src="https://github.com/user-attachments/assets/1c90180e-497e-49cd-b05b-b496ea3bd95a" />
<img width="1371" height="662" alt="2  inventory" src="https://github.com/user-attachments/assets/83ea82a3-fb23-46e8-a848-0729e5021646" />
<img width="1573" height="638" alt="2 some_facts_test-1" src="https://github.com/user-attachments/assets/c7365bef-cb46-4148-bc43-b45d77e9ea3b" />

docker build -t ubuntu-ansible ./ubuntu
docker run -d --name ubuntu ubuntu-ansible
<img width="1600" height="900" alt="3  ubuntu build" src="https://github.com/user-attachments/assets/f6e21a19-c2f7-4fd1-88b2-878c1e7dd04c" />

docker build -t centos7-ansible ./centos
docker run -d --name centos7 centos7-ansible
<img width="1600" height="900" alt="3  centos build" src="https://github.com/user-attachments/assets/87be0c44-0a6f-4dd7-af42-9a491a014439" />

docker ps
<img width="1600" height="900" alt="4  контейнеры стартовали" src="https://github.com/user-attachments/assets/39bec767-0b2a-48f7-850f-3630d4626eb3" />

mkdir -p .vault
echo "netology" > .vault/pass
chmod 600 .vault/pass

ansible-vault decrypt group_vars/el/examp.yml --vault-password-file .vault/pass 2>/dev/null
ansible-vault decrypt group_vars/deb/examp.yml --vault-password-file .vault/pass 2>/dev/null

echo '---' > group_vars/el/examp.yml
echo 'some_fact: "el"' >> group_vars/el/examp.yml
echo '---' > group_vars/deb/examp.yml
echo 'some_fact: "deb"' >> group_vars/deb/examp.yml
<img width="1600" height="900" alt="5  facts" src="https://github.com/user-attachments/assets/6c97b9c6-7a9c-4e89-af1c-3dbb6cb89e26" />

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
<img width="1600" height="900" alt="7  шифрование" src="https://github.com/user-attachments/assets/a0124079-d4d0-49de-8381-c1e1cd5f6f13" />

ansible-playbook -i inventory/prod.yml site.yml --vault-password-file .vault/pass
<img width="1600" height="900" alt="8  расшифровка " src="https://github.com/user-attachments/assets/cd0ca20b-e906-4a1e-a0f4-3a6c31428e49" />


mkdir -p group_vars/local
echo '---' > group_vars/local/examp.yml
echo 'some_fact: "local default fact"' >> group_vars/local/examp.yml

<img width="1418" height="808" alt="9  connections" src="https://github.com/user-attachments/assets/1d54be21-5ce1-43e3-ab1c-65d6939f9563" />
<img width="1418" height="808" alt="10  добавляем группу в prod yaml" src="https://github.com/user-attachments/assets/a1f7b8b3-3e37-43a1-9c61-35f670163698" />
<img width="1418" height="808" alt="11  Some_facts_examp_yaml" src="https://github.com/user-attachments/assets/eb4227b8-2ddd-4bec-bd38-c4a60a95f9be" />

Дополнительное задание:
Расшифровка
<img width="1183" height="401" alt="1 расшифровка" src="https://github.com/user-attachments/assets/473bd271-f45d-42db-ac8d-907a36324612" />
Указание ключа шифрования
<img width="1417" height="797" alt="2 указание ключа шифрования" src="https://github.com/user-attachments/assets/428e858d-e191-4d10-b2c4-b263e76390e0" />
Выполнение:
<img width="1417" height="797" alt="3 запуск -  1" src="https://github.com/user-attachments/assets/2cc581f1-3bea-4539-8b2e-5e8e739d06ce" />
<img width="1417" height="797" alt="3 запуск -  2" src="https://github.com/user-attachments/assets/736a1b06-3785-4ca1-a6a9-49f1fe9047d8" />
Добавление образа fedora
<img width="1461" height="541" alt="4 fedora" src="https://github.com/user-attachments/assets/d33a01ad-e8ac-4c61-b646-b6af784ab90f" />

Создание скрипта
<img width="1461" height="659" alt="5  script to run -1 " src="https://github.com/user-attachments/assets/00accf29-d9df-443d-b3e5-8e36d5659245" />
<img width="1461" height="659" alt="5  script to run -2 " src="https://github.com/user-attachments/assets/2b3ae368-c7e2-44cf-a83c-4d74eadf6383" />
Запуск скрипта
<img width="1461" height="241" alt="5  script to run " src="https://github.com/user-attachments/assets/00c82486-2310-44a5-a7c6-a4cc312b779c" />
Все готово!





ansible-playbook -i inventory/prod.yml site.yml --vault-password-file .vault/pass
