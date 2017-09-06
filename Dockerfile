FROM postgres

WORKDIR /app

RUN mkdir -p /app

COPY pttg_init.sh /app

ENTRYPOINT /app/pttg_init.sh
