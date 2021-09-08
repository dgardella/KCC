FROM ubuntu:20.04
RUN apt-get update \
    && apt install -y --no-install-recommends gpg gpg-agent wget curl\
    && rm -rf /var/lib/apt/lists/*
RUN groupadd -g 999 applitecoin && \
    useradd -r -u 999 -g applitecoin applitecoin
RUN mkdir -p /app/litecoin
RUN mkdir -p /home/applitecoin
RUN chown applitecoin /app/litecoin
RUN chown applitecoin /home/applitecoin
USER applitecoin
WORKDIR /app/litecoin
RUN curl "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xFE3348877809386C" > FE3348877809386C.key 
RUN gpg --import FE3348877809386C.key 
RUN gpg --fingerprint FE3348877809386C

RUN wget --no-check-certificate https://download.litecoin.org/litecoin-0.18.1/linux/litecoin-0.18.1-x86_64-linux-gnu.tar.gz \
    && wget --no-check-certificate https://download.litecoin.org/litecoin-0.18.1/linux/litecoin-0.18.1-linux-signatures.asc
RUN gpg --verify litecoin-0.18.1-linux-signatures.asc
RUN tar -zxvf litecoin-0.18.1-x86_64-linux-gnu.tar.gz
CMD [ "litecoin-0.18.1/bin/litecoind" ]
HEALTHCHECK CMD "ps -ef | grep litecoind" || exit 1

