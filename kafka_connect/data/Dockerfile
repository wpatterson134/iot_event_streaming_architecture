# Use the Strimzi Kafka base image
FROM quay.io/strimzi/kafka:0.45.0-kafka-3.9.0

# Set the user to root
USER root

RUN microdnf install yum -y

RUN rpm --import https://packages.confluent.io/confluent-cli/rpm/archive.key \
    && yum install -y yum-utils \
    && yum-config-manager --add-repo https://packages.confluent.io/confluent-cli/rpm/confluent-cli.repo \
    && yum clean all -y \
    && yum install -y confluent-cli
# Install Kafka Connect plugins
RUN confluent connect plugin install confluentinc/kafka-connect-mqtt:latest --force \
    && confluent connect plugin install confluentinc/kafka-connect-prometheus-metrics:latest --force \
    && confluent connect plugin install mongodb/kafka-connect-mongodb:latest --force


