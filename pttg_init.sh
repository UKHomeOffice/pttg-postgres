#!/usr/bin/env bash
export PGPASSWORD=${ROOT_DB_PASSWORD}


psql -h${PTTG_DB_HOSTNAME} -Uroot -d${PTTG_DB_NAME} << EOF
CREATE SCHEMA IF NOT EXISTS pttg_ip_dummy;

#ALTER SCHEMA pttg_ip OWNER TO postgres;

create user pttg with password 'pttg';

grant all privileges on SCHEMA pttg_ip_dummy to pttg;
EOF

tail -f /dev/null

