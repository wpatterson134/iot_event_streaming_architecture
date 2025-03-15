# Use the Confluent Kafka Connect base image
# Use the Strimzi Kafka base image
FROM quay.io/strimzi/kafka:0.45.0-kafka-3.9.0

# Set the user to root
USER root

# Update microdnf to install yum package manager
RUN microdnf install -y dnf \
    && microdnf clean all

# Verify that yum/dnf is installed
RUN yum --version




# Install Kafka Connect plugins
RUN confluent connect plugin install confluentinc/kafka-connect-mqtt:latest --force \
    && confluent connect plugin install confluentinc/kafka-connect-prometheus-metrics:latest --force \
    && confluent connect plugin install mongodb/kafka-connect-mongodb:latest --force
