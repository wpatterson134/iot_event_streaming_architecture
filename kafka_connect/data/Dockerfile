# Use the Confluent Kafka Connect base image
FROM quay.io/strimzi/kafka:0.45.0-kafka-3.9.0

USER root
RUN dnf install -y curl gnupg yum-utils && \
    rpm --import https://packages.confluent.io/confluent-cli/rpm/archive.key && \
    dnf config-manager --add-repo https://packages.confluent.io/confluent-cli/rpm/confluent-cli.repo && \
    dnf clean all && \
    dnf install -y confluent-cli && \
    rm -rf /var/cache/dnf

# Install Kafka Connect plugins
RUN confluent connect plugin install confluentinc/kafka-connect-mqtt:latest --force \
    && confluent connect plugin install confluentinc/kafka-connect-prometheus-metrics:latest --force \
    && confluent connect plugin install mongodb/kafka-connect-mongodb:latest --force
