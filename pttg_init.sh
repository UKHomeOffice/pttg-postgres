#!/usr/bin/env bash

if [ "$MODE" == "bootstrap" ] ; then

    export PGPASSWORD=${ROOT_DB_PASSWORD}

    psql -h${PTTG_DB_HOSTNAME} -Uroot -d${PTTG_DB_NAME} << EOFA

        CREATE SCHEMA IF NOT EXISTS pttg_schema;
        CREATE USER pttg_user WITH PASSWORD '${IP_DB_PASSWORD}';
        GRANT ALL PRIVILEGES ON SCHEMA pttg_schema TO pttg_user;

        CREATE USER ${IP_DB_QUERY_USERNAME} WITH PASSWORD '${IP_DB_QUERY_PASSWORD}';

        GRANT USAGE ON SCHEMA ${IP_SCHEMA_NAME} TO ${IP_DB_QUERY_USERNAME};
EOFA


    export PGPASSWORD=${IP_DB_PASSWORD}

    psql -h${PTTG_DB_HOSTNAME} -U${IP_DB_USERNAME} -d${PTTG_DB_NAME} << EOFB

        GRANT SELECT ON ALL TABLES IN SCHEMA ${IP_SCHEMA_NAME} TO ${IP_DB_QUERY_USERNAME};
        GRANT SELECT ON ALL SEQUENCES IN SCHEMA ${IP_SCHEMA_NAME} TO ${IP_DB_QUERY_USERNAME};
        GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA ${IP_SCHEMA_NAME} TO ${IP_DB_QUERY_USERNAME};

        ALTER DEFAULT PRIVILEGES IN SCHEMA ${IP_SCHEMA_NAME} GRANT SELECT ON TABLES TO ${IP_DB_QUERY_USERNAME};
        ALTER DEFAULT PRIVILEGES IN SCHEMA ${IP_SCHEMA_NAME} GRANT SELECT ON SEQUENCES TO ${IP_DB_QUERY_USERNAME};
        ALTER DEFAULT PRIVILEGES IN SCHEMA ${IP_SCHEMA_NAME} GRANT EXECUTE ON FUNCTIONS TO ${IP_DB_QUERY_USERNAME};
EOFB

else
    tail -f /dev/null
fi
