#!/usr/bin/env bash
export PGPASSWORD=${ROOT_DB_PASSWORD}


psql -h${PTTG_DB_HOSTNAME} -Uroot -d${PTTG_DB_NAME} << EOF
CREATE SCHEMA IF NOT EXISTS pttg_ip_dummy2;

#ALTER SCHEMA pttg_ip OWNER TO postgres;

create user pttg2 with password '${IP_DB_PASSWORD}';

grant all privileges on SCHEMA pttg_ip_dummy2 to pttg2;
EOF

tail -f /dev/null

