# Use the Strimzi Kafka base image
FROM confluentinc/cp-kafka-connect-base:latest

# Set the user to root
USER root

# Install Kafka Connect plugins
RUN confluent connect plugin install confluentinc/kafka-connect-mqtt:latest --force \
    && confluent connect plugin install confluentinc/kafka-connect-prometheus-metrics:latest --force \
    && confluent connect plugin install mongodb/kafka-connect-mongodb:latest --force
