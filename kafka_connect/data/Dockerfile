# Use the Confluent Kafka Connect base image
FROM quay.io/strimzi/kafka:0.45.0-kafka-3.9.0

USER root

RUN microdnf install -y gnupg && \
    rpm --import https://packages.confluent.io/confluent-cli/rpm/archive.key && \
    microdnf install -y confluent-cli && \
    microdnf clean all



# Install Kafka Connect plugins
RUN confluent connect plugin install confluentinc/kafka-connect-mqtt:latest --force \
    && confluent connect plugin install confluentinc/kafka-connect-prometheus-metrics:latest --force \
    && confluent connect plugin install mongodb/kafka-connect-mongodb:latest --force
