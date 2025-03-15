# Use the Strimzi Kafka base image
FROM strimzi/kafka-connect:latest

# Set the user to root
USER root

# Install Confluent Hub CLI
RUN curl -sL https://github.com/confluentinc/confluent-hub-client/releases/download/7.1.0/confluent-hub-client-7.1.0.tar.gz | tar xz -C /usr/local/bin

# Install the Kafka Connect plugins using Confluent Hub CLI
RUN confluent-hub install --no-prompt mongodb/kafka-connect-mongodb:latest && \
    confluent-hub install --no-prompt prometheus/kafka-connect-prometheus:latest && \
    confluent-hub install --no-prompt beekeeper/kafka-connect-mqtt:latest

# Set permissions (if needed)
RUN chown -R kafka:kafka /usr/local/bin

# Switch back to kafka user
USER kafka

# Default command to keep container running
CMD ["bash"]



