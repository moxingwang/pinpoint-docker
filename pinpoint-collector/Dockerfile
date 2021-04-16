FROM openjdk:8-jdk-alpine

LABEL maintainer="Roy Kim <roy.kim@navercorp.com>"

#ARG PINPOINT_VERSION=${PINPOINT_VERSION:-2.2.2}
#ARG INSTALL_URL=https://github.com/naver/pinpoint/releases/download/v${PINPOINT_VERSION}/pinpoint-collector-boot-${PINPOINT_VERSION}.jar

RUN mkdir -p /pinpoint/config \
    && mkdir -p /pinpoint/scripts

COPY /build/config/pinpoint-collector.properties /pinpoint/config/
COPY /build/scripts/start-collector.sh /pinpoint/scripts/
COPY /pinpoint-collector-boot-2.2.2.jar /pinpoint/pinpoint-collector-boot.jar

RUN chmod a+x /pinpoint/scripts/start-collector.sh \
    && chmod a+x /pinpoint/config/pinpoint-collector.properties

ENTRYPOINT ["sh", "/pinpoint/scripts/start-collector.sh"]

