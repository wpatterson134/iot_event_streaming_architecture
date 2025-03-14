# Use the Confluent base image for Kafka Connect
FROM confluentinc/cp-server-connect-base:latest

# Install dependencies and Confluent CLI using Alpine's package manager
RUN apk add --no-cache \
    curl \
    gnupg \
    bash \
    && echo "https://packages.confluent.io/deb/7.0 stable main" > /etc/apt/sources.list.d/confluent.list \
    && curl -fsSL https://packages.confluent.io/deb/7.0/archive.key | tee /etc/apt/trusted.gpg.d/confluent.asc \
    && apk add confluent-cli \
    && rm -rf /var/cache/apk/*

# Install Kafka Connect plugins
RUN confluent connect plugin install confluentinc/kafka-connect-mqtt:latest \
    && confluent connect plugin install confluentinc/kafka-connect-prometheus-metrics:latest
