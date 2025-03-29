# Stage 1: Use the Strimzi image as a source for artifacts
FROM quay.io/strimzi/kafka:0.45.0-kafka-3.9.0 as strimzi


COPY --from=strimzi /opt/kafka/kafka_connect_run.sh /opt/kafka/


FROM confluentinc/cp-kafka-connect:7.1.0-1-ubi8

USER root:root

ENV CONNECT_PLUGIN_PATH="/usr/share/java,/usr/share/confluent-hub-components,/opt/kafka/custom-config/,/opt/kafka,/opt/kafka/plugins"

# # Add Confluent dependencies if needed (Schema Registry, Avro, etc.)
# ADD https://packages.confluent.io/maven/io/confluent/kafka-connect-avro-converter/7.4.0/kafka-connect-avro-converter-7.4.0.jar /opt/kafka/plugins/

# ENV CLASSPATH="/opt/kafka/plugins/*"

COPY ./my-plugins/ /opt/kafka/plugins/


USER 1001
