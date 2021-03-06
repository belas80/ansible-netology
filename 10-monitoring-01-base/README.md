# 10.01. Зачем и что нужно мониторить  

## Задача 1  

Вас пригласили настроить мониторинг на проект. На онбординге вам рассказали, что проект представляет из себя платформу 
для вычислений с выдачей текстовых отчетов, которые сохраняются на диск. Взаимодействие с платформой осуществляется по 
протоколу http. Также вам отметили, что вычисления загружают ЦПУ. Какой минимальный набор метрик вы выведите в 
мониторинг и почему?  
  
**Ответ:** Так как речь о платформе для вычислений c нагрузкой на ЦПУ, минимум Load Average CPU 1, 5, 15 минут. 
Текстовые отчеты будут занимать место на диске, так что свободное место на диске и его состояние. Ну и если идет работа 
с диском, то можно добавить метрики для inodes и iops. Еще добавил бы количество запросов http (величина трафика), 
успешных/неуспешных ответов http-сервера (уровень ошибок) и время отклика запроса http, так как взаимодействие с 
платформой осуществляется по протоколу http.

## Задача 2  

Менеджер продукта посмотрев на ваши метрики сказал, что ему непонятно что такое RAM/inodes/CPUla. Также он сказал, что 
хочет понимать, насколько мы выполняем свои обязанности перед клиентами и какое качество обслуживания. Что вы можете 
ему предложить?  
  
**Ответ:** Метрики SLO/SLA/SLI, которые позволят связать технические значения с бизнес составляющей. По сути это 
обещания (SLA), данные пользователям, внутренние цели (SLO), которые помогают выполнять обещания, и отслеживаемые 
показатели (SLI), позволяющие понять, как мы справляемся. Например, обговариваем в соглашении что сервис доступен 99,9% 
времени, 0,1% - на тех обслуживание, а в случае нарушения несем материальную ответственность перед клиентами. Цель - 
достичь эти 99,9%, но по факту индикатор SLI может быть больше, например 99,95%, главное чтобы не меньше.  

## Задача 3  

Вашей DevOps команде в этом году не выделили финансирование на построение системы сбора логов. Разработчики в свою 
очередь хотят видеть все ошибки, которые выдают их приложения. Какое решение вы можете предпринять в этой ситуации, 
чтобы разработчики получали ошибки приложения?  
  
**Ответ:** Можно посмотреть в сторону облачных решений, например New Relic, DataDog, Loggly с бесплатными тарифами, 
ну либо более менее вменяемыми. Либо все же найти на существующей инфраструктуре место в минималке для Open Source, 
например Elastic или Graylog. Ну и как вариант, самостоятельно написать простой python скрипт, который будет грепать, 
парсить нужные данные в текстовом формате.  

## Задача 4  

Вы, как опытный SRE, сделали мониторинг, куда вывели отображения выполнения SLA=99% по http кодам ответов. Вычисляете 
этот параметр по следующей формуле: summ_2xx_requests/summ_all_requests. Данный параметр не поднимается выше 70%, но 
при этом в вашей системе нет кодов ответа 5xx и 4xx. Где у вас ошибка?  
  
**Ответ:** Думаю здесь не хватает кодов перенаправления 3хх, т.е. Формула будет:  
(summ_2xx_requests + summ_3xx_requests)/summ_all_requests  
