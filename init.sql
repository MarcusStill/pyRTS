-- Пример создания базы данных и двух таблиц. Предполагается читать данные из таблицы transformed_table_name по партициям
DROP DATABASE IF EXISTS rtk;

CREATE DATABASE IF NOT EXISTS rtk;

CREATE TABLE IF NOT EXISTS rtk.script_logs (
    timestamp Float64,
    level String,
    sys String,
    mrf String,
    user String,
    script_id UUID,
    script_name String,
    script_key String,
    script_version Float64,
    script_process UUID,
    action String,
    action_entity String,
    action_id String,
    action_data String,
    message String,
    script_step_id String,
    script_step_name String,
    current_script_name String,
    current_script_key String,
    current_script_version Float64,
    block_type String,
    parameters String,
    timezone String,
    communication_id Float64,
    communication_number Int64,
    integration_service_id String,
    duration Float64,
    client_mrf String,
    session String,
    script_owner String,
    current_script_owner String,
    script_responsible String,
    current_script_responsible String,
    crm_departament String
) ENGINE = MergeTree()
ORDER BY (timestamp);

CREATE TABLE if not exists rtk.transformed_table_name (
    timestamp Float64,
	user String,
    communication_number Int64,
    communication_id Float64,
    script_id String,
    script_name String,
    mrf String,
    client_mrf String,
    script_owner String,
    current_script_owner String,
    script_responsible String,
    current_script_responsible String,
    crm_departament String,
    ACCOUNT_NUMBER Nullable(String),
    CALLER_ID Nullable(String),
    COMMUNICATION_THEME Nullable(String),
    COMMUNICATION_DETAIL Nullable(String),
    COMMUNICATION_RESULT Nullable(String)
) ENGINE = MergeTree()
PARTITION BY script_id
ORDER BY (timestamp, script_id);
