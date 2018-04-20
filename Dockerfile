FROM postgres

WORKDIR /app

RUN mkdir -p /app

COPY pttg_init.sh /app

USER pttg

ENTRYPOINT /app/pttg_init.sh
