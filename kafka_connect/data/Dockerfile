FROM quay.io/strimzi/kafka:0.45.0-kafka-3.9.0 as strimzi


USER root:root

RUN yum install curl which && \
    rpm --import https://packages.confluent.io/rpm/7.9/archive.key && \
    update-crypto-policies --set DEFAULT:SHA1


ENV CONNECT_PLUGIN_PATH="/usr/share/java,/usr/share/confluent-hub-components,/opt/kafka/custom-config/,/opt/kafka,/opt/kafka/plugins"

# ENV CLASSPATH="/opt/kafka/plugins/*"

COPY ./my-plugins/ /opt/kafka/plugins/


USER 1001
