#!/usr/bin/env bash
export PGPASSWORD=${ROOT_DB_PASSWORD}


psql -h${PTTG_DB_HOSTNAME} -Uroot -d${PTTG_DB_NAME} << EOF
CREATE SCHEMA IF NOT EXISTS pttg_schema;

create user pttg_user with password '${IP_DB_PASSWORD}';

grant all privileges on SCHEMA pttg_schema to pttg_user;
EOF

tail -f /dev/null

