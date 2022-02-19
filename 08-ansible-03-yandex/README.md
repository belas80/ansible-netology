# 08.03 Использование Yandex Cloud  

Playbook устанавливает Elasticsearch, Kibana и Filebeat, на трех разных хостах. Filebeat используется для сбора 
системных логов с хоста `app-instance`. Для установки используются пакеты `rpm` с помощью пакетного менеджера `yum`, 
тестировалось на хостах с `centos7`, сервисы запускаются через `systemd`.  
Конфиги сервисов находятся в папке [playbook/templates](playbook/templates).  
Адреса хостов (ключи `ansible_host`) и имя пользователя для подключения по ssh (ключ `ansible_user`), указываются 
в [playbook/inventory/prod/hosts.yml](playbook/inventory/prod/hosts.yml).  
Версия устанавливаемых сервисов указывается в [playbook/inventory/prod/group_vars/all.yml](playbook/inventory/prod/group_vars/all.yml).  
Все такси имею теги. Для Elasticsearch тег `el`, Kibana - `ki`, Filebeat - `fb`.  
```
playbook: site.yml

  play #1 (elasticsearch): Install Elasticsearch        TAGS: []
      TASK TAGS: [el]

  play #2 (kibana): Install Kibana      TAGS: []
      TASK TAGS: [ki]

  play #3 (app): Install filebeat       TAGS: []
      TASK TAGS: [fb]
```
Команда для запуска плейбук:  
```
ansible-playbook site.yml -i inventory/prod
```