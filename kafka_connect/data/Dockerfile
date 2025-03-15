# Use the Strimzi Kafka base image
FROM confluentinc/cp-kafka-connect:7.1.0-1-ubi8

# Set the user to root
USER root

ENV CONNECT_PLUGIN_PATH: "/usr/share/java,/usr/share/confluent-hub-components"

# Install Kafka Connect plugins
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-mqtt:latest \
    && confluent-hub install --no-prompt confluentinc/kafka-connect-prometheus-metrics:latest \
    && confluent-hub install --no-prompt mongodb/kafka-connect-mongodb:latest

