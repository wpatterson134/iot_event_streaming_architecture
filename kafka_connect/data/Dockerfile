FROM quay.io/strimzi/kafka:0.45.0-kafka-3.9.0

USER root:root

ENV CONNECT_PLUGIN_PATH="/usr/share/java,/usr/share/confluent-hub-components,/opt/kafka/custom-config/,/opt/kafka,/opt/kafka/plugins"

# Add Confluent dependencies if needed (Schema Registry, Avro, etc.)
ADD https://packages.confluent.io/maven/io/confluent/kafka-connect-avro-converter/7.4.0/kafka-connect-avro-converter-7.4.0.jar /opt/kafka/plugins/

ENV CLASSPATH="/opt/kafka/plugins/*"

COPY ./my-plugins/ /opt/kafka/plugins/


USER 1001
