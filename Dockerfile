FROM postgres

ENV USER pttg
ENV GROUP pttg

WORKDIR /app

RUN groupadd -r ${GROUP} && \
    useradd -r -g ${USER} ${GROUP} -d /app && \
    mkdir -p /app && \
    chown -R ${USER}:${GROUP} /app

COPY run.sh /app
COPY pttg_init.sh /app

RUN chmod a+x /app/run.sh

RUN /app/pttg_init.sh

ENTRYPOINT /app/pttg_init.sh
