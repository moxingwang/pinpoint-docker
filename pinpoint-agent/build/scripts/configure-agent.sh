#!/bin/bash
set -e
set -x

#sed -i "/profiler.transport.module=/ s/=.*/=${PROFILER_TRANSPORT_MODULE}/" /pinpoint/agent/pinpoint.config
sed -i "/profiler.collector.ip=/ s/=.*/=127.1.11.1/" /pinpoint/agent/profiles/${SPRING_PROFILES}/pinpoint.config

#sed -i "/profiler.transport.grpc.collector.ip=/ s/=.*/=${COLLECTOR_IP}/" /pinpoint/agent/pinpoint.config
sed -i "/profiler.transport.grpc.collector.ip=/ s/=.*/=127.1.11.1/" /pinpoint/agent/profiles/${SPRING_PROFILES}/pinpoint.config

sed -i "/Root level=/ s/=.*/=\"INFO\">/g" /pinpoint/agent/profiles/${SPRING_PROFILES}/log4j2.xml

exec "$@"
