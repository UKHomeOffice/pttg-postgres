#!/usr/bin/env bash

if [ "$MODE" == "bootstrap" ] ; then

    export PGPASSWORD=${ROOT_DB_PASSWORD}

    psql -h${PTTG_DB_HOSTNAME} -Uroot -d${PTTG_DB_NAME} << EOF

        CREATE SCHEMA IF NOT EXISTS pttg_schema;
        CREATE USER pttg_user WITH PASSWORD '${IP_DB_PASSWORD}';
        GRANT ALL PRIVILEGES ON SCHEMA pttg_schema TO pttg_user;

# replace above lines with these ...
        # CREATE SCHEMA IF NOT EXISTS ${IP_SCHEMA_NAME};
        # CREATE USER ${IP_DB_USERNAME} WITH PASSWORD '${IP_DB_PASSWORD}';
        # GRANT ALL PRIVILEGES ON SCHEMA ${IP_SCHEMA_NAME} TO ${IP_DB_USERNAME};

        CREATE USER ${IP_DB_QUERY_USERNAME} WITH PASSWORD '${IP_DB_QUERY_PASSWORD}';
        GRANT SELECT ON ALL TABLES IN SCHEMA ${IP_SCHEMA_NAME} TO ${IP_DB_QUERY_USERNAME};

EOF

else
    tail -f /dev/null
fi

