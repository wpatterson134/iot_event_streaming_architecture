#Kafka 3.8.0 is compatible with all Kakfa connect plugins
FROM quay.io/strimzi/kafka:0.45.0-kafka-3.8.0

USER root:root
# need to download confluent platform and extract before
# building this Dockerfile
#Run: "curl -O https://packages.confluent.io/archive/7.9/confluent-7.9.0.tar.gz"
# this will need to be extracted into confluent-7.9.0 directory
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