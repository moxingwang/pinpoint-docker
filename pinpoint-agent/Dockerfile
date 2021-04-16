FROM openjdk:8-jre

LABEL maintainer="Roy Kim <roy.kim@navercorp.com>"

#ARG PINPOINT_VERSION=${PINPOINT_VERSION:-2.2.2}
#ARG INSTALL_URL=https://github.com/naver/pinpoint/releases/download/v${PINPOINT_VERSION}/pinpoint-agent-${PINPOINT_VERSION}.tar.gz

COPY /build/scripts/configure-agent.sh /usr/local/bin/
COPY /build/pinpoint-agent-2.2.2.tar.gz /usr/local/

RUN  chmod a+x /usr/local/bin/configure-agent.sh \
    && mkdir  /pinpoint \
    && chmod -R o+x /pinpoint \
    && gunzip /usr/local/pinpoint-agent-2.2.2.tar.gz \
    && tar -xf /usr/local/pinpoint-agent-2.2.2.tar  -C /pinpoint \
    && mv /pinpoint/pinpoint-agent-2.2.2 /pinpoint/agent \
    && rm /usr/local/pinpoint-agent-2.2.2.tar \
    && sed -i "/profiler.collector.ip=/ s/=.*/=127.1.11.1/" /pinpoint/agent/profiles/release/pinpoint.config \
    && sed -i "/profiler.transport.grpc.collector.ip=/ s/=.*/=127.1.11.1/" /pinpoint/agent/profiles/release/pinpoint.config \
    && sed -i "/Root level=/ s/=.*/=\"INFO\">/g" /pinpoint/agent/profiles/release/log4j2.xml \
    && rm -rf /var/cache/apt/*


ENTRYPOINT ["/usr/local/bin/configure-agent.sh"]
CMD ["tail", "-f", "/dev/null"]