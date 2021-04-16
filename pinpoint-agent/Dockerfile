FROM openjdk:8-jre

LABEL maintainer="Roy Kim <roy.kim@navercorp.com>"

ARG PINPOINT_VERSION=${PINPOINT_VERSION:-2.2.2}
ARG INSTALL_URL=https://github.com/naver/pinpoint/releases/download/v${PINPOINT_VERSION}/pinpoint-agent-${PINPOINT_VERSION}.tar.gz

COPY /build/scripts/configure-agent.sh /usr/local/bin/

RUN apt-get update \
    && chmod a+x /usr/local/bin/configure-agent.sh \
    && mkdir -p /pinpoint-agent \
    && chmod -R o+x /pinpoint-agent \
    && curl -SL ${INSTALL_URL} -o pinpoint-agent.tar.gz \
    && gunzip pinpoint-agent.tar.gz \
    && tar -xf pinpoint-agent.tar --strip 1 -C /pinpoint-agent \
    && rm pinpoint-agent.tar \
    && apt-get remove curl \
    && rm /var/cache/apt/*

VOLUME ["/pinpoint-agent"]

ENTRYPOINT ["/usr/local/bin/configure-agent.sh"]
CMD ["tail", "-f", "/dev/null"]