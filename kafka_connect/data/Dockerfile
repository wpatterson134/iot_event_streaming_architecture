
# Notes of Kafka Connector, Kafka,  & Confluent Platform versions...
# Certain connectors only work with certain versions of aformentioned components
# Prometheus Sink connector is especially tempermental.
# Below are the recommmended versions for the Prometheus Sink Connector, 
# Version 1.2.4
# Connector Version | Recommended CP Version | Kafka Version
# 1.2.4 | 6.2.x – 7.2.x | 2.8.x – 3.2.x
# Latest | 7.5.x – 7.9.x | 3.5 – 3.8.x

FROM quay.io/strimzi/kafka:0.32.0-kafka-3.2.1

USER root:root
# need to download confluent platform and extract before
# building this Dockerfile
#Run: "curl -O https://packages.confluent.io/archive/7.2/confluent-7.2.0.tar.gz"
# this will need to be extracted into confluent-7.2.0 directory
COPY ./confluent-7.2.0 /opt/kafka/confluent-7.2.0

ENV CONFLUENT_HOME=/opt/kafka/confluent-7.2.0
ENV PATH=$PATH:$CONFLUENT_HOME/bin

RUN confluent --help

# ENV CONFLUENT_CLOUD_EMAIL=wpatterson134@gmail.com
# ENV CONFLUENT_CLOUD_PASSWORD=dir823rEg
ENV CONFLUENT_SUPPORT_METRICS_ENABLE=false

ENV CONNECT_PLUGIN_PATH="/usr/share/java,/usr/share/confluent-hub-components,/opt/kafka/custom-config/,/opt/kafka,/opt/kafka/plugins"

COPY ./my-plugins/ /opt/kafka/plugins/

USER 1001