#!/bin/bash

curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" \
http://localhost:8083/connectors/ -d '{
  "name": "mysql-asset-types",
  "config": {
    "connector.class": "io.debezium.connector.mysql.MySqlConnector",
    "tasks.max": "1",
    "database.hostname": "app-smile5-uat.cxeycqoo6axz.ap-southeast-3.rds.amazonaws.com",
    "database.port": "3306",
    "database.user": "smile5_app_usr",
    "database.password": "u9UCmGYVa3QZPfb2DShAxE",
    "database.server.id": "184054",
    "topic.prefix": "mysqlcdc",
    "database.include.list": "staging_smile5_20260212",
    "table.include.list": "staging_smile5_20260212.asset_types",
    "schema.history.internal.kafka.bootstrap.servers": "kafka:29092",
    "schema.history.internal.kafka.topic": "schema-changes.mysql",
    "include.schema.changes": "true"
  }
}'
