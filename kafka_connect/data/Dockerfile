# Use the Strimzi Kafka base image
FROM confluentinc/cp-kafka-connect:7.1.0-1-ubi8

# Set the user to root
USER root

# Install Kafka Connect plugins
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-mqtt:latest \