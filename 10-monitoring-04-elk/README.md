# 10.04. ELK  

## Задача 1  

Необходимо поднять в докере:

* elasticsearch(hot и warm ноды)
* logstash
* kibana
* filebeat

и связать их между собой.  

![](img/startELK.png)  

Интерфейс кибаны:
![](img/kibana.png)  

## Задача 2  

Создание index-patterns в kibana:  
![](img/createIndex.png)  
Просмотр логов в kibana (Discover):  
![](img/discoverLog.png)  
Выборка логов контейнера с run.py:  
![](img/discoverLogRun_py.png)  

Исходники [здесь](help)