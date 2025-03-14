# Use the Confluent base image for Kafka Connect
FROM confluentinc/cp-server-connect-base:latest

# Install Confluent CLI
RUN apt-get update && \
    apt-get install -y curl gnupg lsb-release && \
    echo "deb [arch=amd64] https://packages.confluent.io/deb/7.0 stable main" > /etc/apt/sources.list.d/confluent.list && \
    curl -fsSL https://packages.confluent.io/deb/7.0/archive.key | tee /etc/apt/trusted.gpg.d/confluent.asc && \
    apt-get update && \
    apt-get install -y confluent-cli && \
    rm -rf /var/lib/apt/lists/*

# Install Kafka Connect plugins
RUN confluent connect plugin install confluentinc/kafka-connect-mqtt:latest \
    && confluent connect plugin install confluentinc/kafka-connect-prometheus-metrics:latest
