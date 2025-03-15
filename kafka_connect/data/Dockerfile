# Use the Strimzi Kafka base image
FROM quay.io/strimzi/kafka:0.45.0-kafka-3.9.0

# Set the user to root
USER root

# Install required tools using microdnf
RUN microdnf install -y gnupg wget \
    && wget https://packages.confluent.io/confluent-cli/archives/latest/confluent_linux_amd64.tar.gz -O /tmp/confluent-cli.tar.gz \
    && tar -xzf /tmp/confluent-cli.tar.gz -C /usr/local/bin \
    && rm -f /tmp/confluent-cli.tar.gz \
    && microdnf clean all

# Set the PATH for the shell to include /usr/local/bin
ENV PATH="/usr/local/bin:${PATH}"

# Install Kafka Connect plugins
RUN confluent connect plugin install confluentinc/kafka-connect-mqtt:latest --force \
    && confluent connect plugin install confluentinc/kafka-connect-prometheus-metrics:latest --force \
    && confluent connect plugin install mongodb/kafka-connect-mongodb:latest --force
