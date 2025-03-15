# Use the Strimzi Kafka base image
FROM quay.io/strimzi/kafka:0.45.0-kafka-3.9.0

# Set the user to root
USER root

# Install required tools using microdnf
RUN microdnf install -y gnupg wget \
    && rpm --import https://packages.confluent.io/confluent-cli/rpm/archive.key \
    && wget https://packages.confluent.io/confluent-cli/rpm/latest/confluent-cli.rpm -O /tmp/confluent-cli.rpm \
    && rpm -ivh /tmp/confluent-cli.rpm \
    && rm -f /tmp/confluent-cli.rpm \
    && microdnf clean all

# Install Kafka Connect plugins
RUN confluent connect plugin install confluentinc/kafka-connect-mqtt:latest --force \
    && confluent connect plugin install confluentinc/kafka-connect-prometheus-metrics:latest --force \
    && confluent connect plugin install mongodb/kafka-connect-mongodb:latest --force
