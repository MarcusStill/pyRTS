-- Пример запроса на вставку 10 строк в таблицу rtk.script_logs.
INSERT INTO rtk.script_logs (`timestamp`,`level`,sys,mrf,`user`,script_id,script_name,script_key,script_version,script_process,`action`,action_entity,action_id,action_data,message,script_step_id,script_step_name,current_script_name,current_script_key,current_script_version,block_type,parameters,timezone,communication_id,communication_number,integration_service_id,duration,client_mrf,`session`,script_owner,current_script_owner,script_responsible,current_script_responsible,crm_departament) VALUES
	 (1712696407.6343,'INFO','CRM_B2C_PROD','Волга','user_03','7e3cfde7-53a7-40a9-b814-c373df9d8d04','Проблема с интернетом','internet_problem',413.0,'ba280239-bbab-4718-9b6c-b30a924b6cf0','INTEGRATION_RESPONSE_FROM_SERVICE','CHECK','HAS_IN_CATALOG','6b8d1a51-5929-4fec-a21d-c9626ae82f3f','Получен ответ от сервиса интеграционной функции','CheckBlock_05zh86j','Есть в справочнике Переключать ЕКЦ','Проверка заведенного оборудования в Axiros','check_hardware_availability_axiros',72.0,'Проверка','{"HAS_IN_CATALOG": true, "GET_CATALOG_RECORDS_QUANTITY": 1}','+03:00',53150993,344175369,'has_in_catalog',0.094414,'Волга','','owner_03','current_script_owner_06','script_responsible_03','current_script_responsible_04','ЦОО'),
	 (1712696407.725838,'INFO','CRM_B2C_PROD','Волга','user_03','7e3cfde7-53a7-40a9-b814-c373df9d8d04','Проблема с интернетом','internet_problem',413.0,'ba280239-bbab-4718-9b6c-b30a924b6cf0','VARIABLE_VALUE','CHECK','EMPLOYEE_MRF','ca2ffe02-1675-49a1-9d94-9d45c8400cfe','Проверка значения переменной EMPLOYEE_MRF по условию "Волга" => "Иначе"','CheckBlock_1grcp6w','МРФ сотрудника и МРФ клиента','Проверка заведенного оборудования в Axiros','check_hardware_availability_axiros',72.0,'Проверка','','+03:00',53150993,344175369,'',0.000262,'Волга','','owner_03','current_script_owner_06','script_responsible_03','current_script_responsible_04','ЦОО'),
	 (1712696407.8139071,'INFO','CRM_B2C_PROD','Волга','user_03','7e3cfde7-53a7-40a9-b814-c373df9d8d04','Проблема с интернетом','internet_problem',413.0,'ba280239-bbab-4718-9b6c-b30a924b6cf0','INTEGRATION_CALL_SYNC','CHECK','MRF','0ec2b620-f497-4abf-a359-78d288b44842','Синхронный вызов интеграционной функции','CheckBlock_14oafqg','МРФ','Проверка заведенного оборудования в Axiros','check_hardware_availability_axiros',72.0,'Проверка','{"CLIENT_ID": "55477190", "ACCOUNT_NUMBER": "account_number_0", "$$$taskId": "0ec2b620-f497-4abf-a359-78d288b44842", "$$$system": "CRM_B2C_PROD", "BUSINESS_KEY": "17424b97-bf0a-45f9-9ce2-062eb39f3c37", "NO_CACHE": false}','+03:00',53150993,344175369,'getAffiliateInfo',0.0,'Волга','','owner_03','current_script_owner_06','script_responsible_03','current_script_responsible_04','ЦОО'),
	 (1712696407.859034,'INFO','CRM_B2C_PROD','Волга','user_03','7e3cfde7-53a7-40a9-b814-c373df9d8d04','Проблема с интернетом','internet_problem',413.0,'ba280239-bbab-4718-9b6c-b30a924b6cf0','FUNCTION_VALUE','CHECK','MRF','d3c6c5b3-01a1-4362-a5b5-2656c3116b03','Проверка результата ИФ MRF по условию "Волга" = "Волга"','CheckBlock_14oafqg','МРФ','Проверка заведенного оборудования в Axiros','check_hardware_availability_axiros',72.0,'Проверка','','+03:00',53150993,344175369,'',0.046362,'Волга','','owner_03','current_script_owner_06','script_responsible_03','current_script_responsible_04','ЦОО'),
	 (1712696408.093592,'INFO','CRM_B2C_PROD','Волга','user_03','7e3cfde7-53a7-40a9-b814-c373df9d8d04','Проблема с интернетом','internet_problem',413.0,'ba280239-bbab-4718-9b6c-b30a924b6cf0','END_SCRIPT','NESTED_SCRIPT','','','Завершение вложенного скрипта','ScriptBlock_02wucku','Проверка заведенного оборудования в Axiros','Проблема с интернетом. Проверка схемы подключения портов','internet_problem_check_scheme_connection_ports',46.0,'Скрипт','{"HARDWARE_AVAILABILITY_AXIROS": "Нет"}','+03:00',53150993,344175369,'',1.322591,'Волга','','owner_03','current_script_owner_06','script_responsible_03','current_script_responsible_04','ЦОО'),
	 (1712696406.344947,'INFO','CRM_B2C_PROD','Волга','user_03','17424b97-bf0a-45f9-9ce2-062eb39f3c37','Проблема с интернетом','internet_problem',413.0,'ad58f737-acb2-47f7-89c3-e1100c8f60a3','START_SCRIPT','NESTED_SCRIPT','','','Запуск вложенного скрипта','ScriptBlock_0cmaksl','Проблема с интернетом. Проверка схемы подключения портов','Проблема с интернетом. Не открываются страницы. Подключение по LAN','internet_problem_connected_by_lan',154.0,'Скрипт','{}','+03:00',53150993,344175369,'',0.0,'Волга','','owner_03','current_script_owner_06','script_responsible_03','current_script_responsible_04','ЦОО'),
	 (1712696406.614381,'INFO','CRM_B2C_PROD','Волга','user_03','17424b97-bf0a-45f9-9ce2-062eb39f3c37','Проблема с интернетом','internet_problem',413.0,'ad58f737-acb2-47f7-89c3-e1100c8f60a3','VARIABLE_VALUE','CHECK','SYSTEM_SOURCE','551ffda9-7fc5-41cd-b43a-88f791210fb2','Проверка значения переменной SYSTEM_SOURCE по условию "CRM_B2C_PROD" => "Иначе"','CheckBlock_0su0ux7','Система запуска','Проблема с интернетом. Проверка схемы подключения портов','internet_problem_check_scheme_connection_ports',46.0,'Проверка','','+03:00',53150993,344175369,'',0.000237,'Волга','','owner_03','current_script_owner_06','script_responsible_03','current_script_responsible_04','ЦОО'),
	 (1712696406.77195,'INFO','CRM_B2C_PROD','Волга','user_03','17424b97-bf0a-45f9-9ce2-062eb39f3c37','Проблема с интернетом','internet_problem',413.0,'ba280239-bbab-4718-9b6c-b30a924b6cf0','START_SCRIPT','NESTED_SCRIPT','','','Запуск вложенного скрипта','ScriptBlock_02wucku','Проверка заведенного оборудования в Axiros','Проблема с интернетом. Проверка схемы подключения портов','internet_problem_check_scheme_connection_ports',46.0,'Скрипт','{"TYPE_EQUIPMENT": ""}','+03:00',53150993,344175369,'',0.0,'Волга','','owner_03','current_script_owner_06','script_responsible_03','current_script_responsible_04','ЦОО'),
	 (1712696407.057447,'INFO','CRM_B2C_PROD','Волга','user_03','17424b97-bf0a-45f9-9ce2-062eb39f3c37','Проблема с интернетом','internet_problem',413.0,'ba280239-bbab-4718-9b6c-b30a924b6cf0','VARIABLE_VALUE','CHECK','SERVICE_ID','6638f605-cd02-4cd9-8ca1-adf067c31c65','Проверка значения переменной SERVICE_ID по условию "2955505489" => "Иначе"','CheckBlock_1gqej68','ID услуги','Проверка заведенного оборудования в Axiros','check_hardware_availability_axiros',72.0,'Проверка','','+03:00',53150993,344175369,'',0.000165,'Волга','','owner_03','current_script_owner_06','script_responsible_03','current_script_responsible_04','ЦОО'),
	 (1712696407.411633,'INFO','CRM_B2C_PROD','Волга','user_03','17424b97-bf0a-45f9-9ce2-062eb39f3c37','Проблема с интернетом','internet_problem',413.0,'ba280239-bbab-4718-9b6c-b30a924b6cf0','SET_VARIABLES_VALUES','','','','Изменение значений переменных','VariableBlock_1xbu7ni','Тип оборудования','Проверка заведенного оборудования в Axiros','check_hardware_availability_axiros',72.0,'Переменная','{"TYPE_EQUIPMENT": "оборудованием"}','+03:00',53150993,344175369,'',0.003701,'Волга','','owner_03','current_script_owner_06','script_responsible_03','current_script_responsible_04','ЦОО'),
	 (1712696407.5405252,'INFO','CRM_B2C_PROD','Волга','user_03','17424b97-bf0a-45f9-9ce2-062eb39f3c37','Проблема с интернетом','internet_problem',413.0,'ba280239-bbab-4718-9b6c-b30a924b6cf0','INTEGRATION_CALL_SYNC','CHECK','HAS_IN_CATALOG','6b8d1a51-5929-4fec-a21d-c9626ae82f3f','Синхронный вызов интеграционной функции','CheckBlock_05zh86j','Есть в справочнике Переключать ЕКЦ','Проверка заведенного оборудования в Axiros','check_hardware_availability_axiros',72.0,'Проверка','{"CATALOG": {"catalogSlug": "perekliuchatel-edinyi-kontaktnyi-tsentr"}, "CATALOG_FILTER": {"filters": [{"slug": "mrf", "criterion": "OR", "type": "String", "templates": [{"operator": "eq", "template": "Волга", "kind": "VARIABLE"}]}, {"slug": "obsluzhivaet-ekts", "criterion": "OR", "type": "String", "templates": [{"operator": "eq", "template": "Да", "kind": "CONST"}]}]}, "$$$taskId": "6b8d1a51-5929-4fec-a21d-c9626ae82f3f", "$$$system": "CRM_B2C_PROD", "BUSINESS_KEY": "17424b97-bf0a-45f9-9ce2-062eb39f3c37", "NO_CACHE": false}','+03:00',53150993,344175369,'has_in_catalog',0.0,'Волга','','owner_03','current_script_owner_06','script_responsible_03','current_script_responsible_04','ЦОО');
