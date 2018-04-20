FROM postgres

ENV USER pttg
ENV GROUP pttg

WORKDIR /app

RUN groupadd -r ${GROUP} && \
    useradd -g ${GROUP} ${USER} -d /app && \
    mkdir -p /app && \
    chown -R ${USER}:${GROUP} /app

COPY pttg_init.sh /app

USER ${USER}

ENTRYPOINT /app/pttg_init.sh
