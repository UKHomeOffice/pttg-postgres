FROM postgres

ENV USER pttg
ENV USER_ID 1000
ENV GROUP pttg

WORKDIR /app

RUN groupadd -r ${GROUP} && \
    useradd -u ${USER_ID} -g ${GROUP} ${USER} -d /app && \
    mkdir -p /app && \
    chown -R ${USER}:${GROUP} /app

COPY pttg_init.sh /app

USER ${USER_ID}

ENTRYPOINT /app/pttg_init.sh
