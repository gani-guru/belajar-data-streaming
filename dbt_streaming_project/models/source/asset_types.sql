{{ config(
    pre_hook="SET streaming_parallelism = 2"
) }}

CREATE TABLE {{ this }} (
  id BIGINT,
  name STRING,
  description STRING,
  min_temperature DOUBLE,
  max_temperature DOUBLE,
  created_by BIGINT,
  updated_by BIGINT,
  created_at TIMESTAMPTZ,
  updated_at TIMESTAMPTZ,
  deleted_by BIGINT,
  deleted_at TIMESTAMPTZ,
  __deleted STRING,
  PRIMARY KEY (id)
)
INCLUDE timestamp AS kafka_timestamp
WITH (
    connector = 'kafka',
    topic = 'staging_smile5_20260212.asset_types',
    properties.bootstrap.server = 'kafka:29092',
    scan.startup.mode = 'earliest',
    source_rate_limit = 7000
) FORMAT PLAIN ENCODE JSON
