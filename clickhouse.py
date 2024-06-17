import csv
import json

from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.utils.dates import days_ago
from airflow_clickhouse_plugin.hooks.clickhouse import ClickHouseHook


# Функция для загрузки данных из csv
def insert_data():
    ch_hook = ClickHouseHook(clickhouse_conn_id='clickhouse_default')  # Определяется var в .env AIRFLOW_CONN_CLICKHOUSE_DEFAULT

    with open('./dags/sm_test_data.csv', 'r', encoding='utf-8') as csvfile:
        reader = csv.reader(csvfile)
        next(reader)  # Пропуск заголовка
        data = [row[1:] for row in reader]  # Пропуск первого элемента в каждой строке

    # Генерируем строку с вставляемыми значениями для SQL-запроса INSERT
    values = ", ".join(
        "(" + ", ".join(f"'{x}'" if isinstance(x, str) else str(x) for x in row) + ")"
        for row in data
    )

    # Запрос для вставки данных в таблицу
    insert_query = """
        INSERT INTO script_logs (
            timestamp, level, sys, mrf, user, script_id, script_name, script_key, script_version,
            script_process, action, action_entity, action_id, action_data, message, script_step_id,
            script_step_name, current_script_name, current_script_key, current_script_version,
            block_type, parameters, timezone, communication_id, communication_number,
            integration_service_id, duration, client_mrf, session, script_owner,
            current_script_owner, script_responsible, current_script_responsible, crm_departament
        ) VALUES
        """

    # Вставка данных в таблицу
    ch_hook.execute(insert_query, values)


# Функция для выгрузки данных из таблицы
def extract_data():
    connection = ClickHouseHook(clickhouse_conn_id='clickhouse_default')
    data = connection.execute('SELECT * FROM rtk.script_logs')
    return data


# Функция для преобразования данных по script_id
def transform_data(**context):
    data = context['task_instance'].xcom_pull(task_ids='extract_data')
    transformed_data = []
    for row in data:
        transformed_row = [
            row[0],  # timestamp
            row[4],  # user
            row[24],  # communication_number
            row[23],  # communication_id
            row[5],  # script_id
            row[6],  # script_name
            row[3],  # mrf
            row[27],  # client_mrf
            row[29],  # script_owner
            row[30],  # current_script_owner
            row[31],  # script_responsible
            row[32],  # current_script_responsible
            row[33],  # crm_departament
            None,  # ACCOUNT_NUMBER
            None,  # CALLER_ID
            None,  # COMMUNICATION_THEME
            None,  # COMMUNICATION_DETAIL
            None  # COMMUNICATION_RESULT
        ]

        # Обработка столбца parameters
        parameters = row[21]
        if parameters:
            parameters_dict = json.loads(parameters)
            transformed_row[13] = parameters_dict.get('ACCOUNT_NUMBER')
            transformed_row[14] = parameters_dict.get('CALLER_ID')
            transformed_row[15] = parameters_dict.get('COMMUNICATION_THEME')
            transformed_row[16] = parameters_dict.get('COMMUNICATION_DETAIL')
            transformed_row[17] = parameters_dict.get('COMMUNICATION_RESULT')
        transformed_data.append(transformed_row)

    return transformed_data


# Функция для загрузки преобразованных данных в ClickHouse
def load_data(**context):
    ch_hook = ClickHouseHook(clickhouse_conn_id='clickhouse_default')
    script_id_dict = context['task_instance'].xcom_pull(task_ids='transform_data')
    # Преобразуем данные для вставки в таблицу ClickHouse с учетом NULL значений
    values = [
        tuple(f'{x}' if isinstance(x, str) else 'NULL' if x is None else str(x) for x in row)
        for row in script_id_dict
    ]
    for rows in values:
        ch_hook.execute('INSERT INTO rtk.transformed_table_name VALUES', rows)


with DAG(
        dag_id='clickhouse_rtk',
        start_date=days_ago(1),
        catchup=False,
        schedule_interval='0 1 * * *',
) as dag:
    operator = PythonOperator(
        task_id='insert_data_to_clickhouse',
        python_callable=insert_data,
        dag=dag
    )

    insert_data_task = PythonOperator(
        task_id='insert_data',
        python_callable=insert_data,
        dag=dag,
    )

    extract_data_task = PythonOperator(
        task_id='extract_data',
        python_callable=extract_data,
        provide_context=True,
        dag=dag,
    )

    transform_data_task = PythonOperator(
        task_id='transform_data',
        python_callable=transform_data,
        provide_context=True,
        dag=dag,
    )

    load_data_task = PythonOperator(
        task_id='load_data',
        python_callable=load_data,
        provide_context=True,
        dag=dag,
    )

insert_data_task >> extract_data_task >> transform_data_task >> load_data_task
