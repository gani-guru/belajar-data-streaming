-- models/asset_types.sql
{{
  config(
    materialized = "table",
    sql_header = "-- dbt-risingwave streaming source",
    risingwave = {
      connector = "kafka",
      topic = "mysqlcdc.staging_smile5_20260212.asset_types",
      format = "json"
    }
  )
}}

SELECT
  CAST(payload->>'id' AS BIGINT) AS id,
  payload->>'type' AS asset_type,
  CAST(payload->>'created_at' AS TIMESTAMP) AS created_at,
  CAST(payload->>'updated_at' AS TIMESTAMP) AS updated_at
FROM {{ source('kafka', 'mysqlcdc.staging_smile5_20260212.asset_types') }};
