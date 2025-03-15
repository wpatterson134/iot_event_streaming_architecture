FROM quay.io/strimzi/kafka:0.45.0-kafka-3.9.0

USER root:root
ENV CONNECT_PLUGIN_PATH="/usr/share/java,/usr/share/confluent-hub-components,/opt/kafka/custom-config/,/opt/kafka,/opt/kafka/plugins"

COPY ./my-plugins/ /opt/kafka/plugins/


USER 1001
