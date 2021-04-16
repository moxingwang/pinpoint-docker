FROM openjdk:8-jre

LABEL maintainer="Roy Kim <roy.kim@navercorp.com>"

#ARG PINPOINT_VERSION=${PINPOINT_VERSION:-2.2.2}
#ARG INSTALL_URL=https://github.com/naver/pinpoint/releases/download/v${PINPOINT_VERSION}/pinpoint-agent-${PINPOINT_VERSION}.tar.gz

COPY /build/scripts/configure-agent.sh /usr/local/bin/
COPY /build/pinpoint-agent.tar.gz /usr/local/


RUN  chmod a+x /usr/local/bin/configure-agent.sh \
    && mkdir  /usr/local/pinpoint \
    && chmod -R o+x /usr/local/pinpoint \
    && gunzip /usr/local/pinpoint-agent.tar.gz \
    && tar -xf /usr/local/pinpoint-agent.tar  -C /usr/local/pinpoint \
    && mv /usr/local/pinpoint/pinpoint-agent-2.2.2 /usr/local/pinpoint/pinpoint-agent \
    && rm /usr/local/pinpoint-agent.tar \
    && rm -rf /var/cache/apt/*


ENTRYPOINT ["/usr/local/bin/configure-agent.sh"]
CMD ["tail", "-f", "/dev/null"]