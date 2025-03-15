# Use the Confluent Kafka Connect base image
FROM quay.io/strimzi/kafka:0.45.0-kafka-3.9.0

USER root

# Install dependencies
RUN microdnf install -y gnupg wget && \
    rpm --import https://packages.confluent.io/confluent-cli/rpm/archive.key && \
    wget https://packages.confluent.io/confluent-cli/rpm/latest/confluent-cli-archive.tar.gz -O /tmp/confluent-cli.tar.gz && \
    tar -xzf /tmp/confluent-cli.tar.gz -C /usr/local/bin && \
    rm -f /tmp/confluent-cli.tar.gz && \
    microdnf clean all

# Verify installation
RUN confluent --version




# Install Kafka Connect plugins
RUN confluent connect plugin install confluentinc/kafka-connect-mqtt:latest --force \
    && confluent connect plugin install confluentinc/kafka-connect-prometheus-metrics:latest --force \
    && confluent connect plugin install mongodb/kafka-connect-mongodb:latest --force
