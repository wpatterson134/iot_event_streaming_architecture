###############################
# Stage 1: Builder
###############################
FROM registry.access.redhat.com/ubi8/ubi as builder
USER root

# Install necessary tools on UBI8 (which has a working yum)
RUN yum install -y wget tar curl && yum clean all

# Download and extract the Confluent Hub CLI with the correct version
RUN wget https://github.com/confluentinc/confluent-hub-client/releases/download/7.1.1/confluent-hub-client-7.1.1.tar.gz -O /tmp/confluent-hub-client.tar.gz && \
    tar -xvzf /tmp/confluent-hub-client.tar.gz -C /tmp && \
    mv /tmp/confluent-hub-client-7.1.1/confluent-hub /usr/local/bin/ && \
    chmod +x /usr/local/bin/confluent-hub

# Use the confluent-hub CLI to install the plugins
RUN confluent-hub install --no-prompt mongodb/kafka-connect-mongodb:latest && \
    confluent-hub install --no-prompt prometheus/kafka-connect-prometheus:latest && \
    confluent-hub install --no-prompt beekeeper/kafka-connect-mqtt:latest

# Archive the plugin installation directory (default is /usr/share/confluent-hub-components)
RUN tar -czvf /tmp/plugins.tar.gz /usr/share/confluent-hub-components

###############################
# Stage 2: Final Image
###############################
FROM strimzi/kafka-connect:latest
USER root

# Copy the confluent-hub binary from the builder stage
COPY --from=builder /usr/local/bin/confluent-hub /usr/local/bin/confluent-hub
RUN chmod +x /usr/local/bin/confluent-hub

# Copy the preinstalled plugins archive and extract it
COPY --from=builder /tmp/plugins.tar.gz /tmp/plugins.tar.gz
RUN tar -xzvf /tmp/plugins.tar.gz -C / && rm /tmp/plugins.tar.gz

# Switch back to the kafka user
USER kafka

CMD ["bash"]
