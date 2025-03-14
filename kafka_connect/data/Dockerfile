# Use the Confluent base image for Kafka Connect (Alpine-based image)
FROM confluentinc/cp-server-connect-base:latest

# Try installing YUM-based dependencies (won't work as YUM is not available on Alpine)
RUN echo "Attempting YUM-based installation" \
    && rpm --import https://packages.confluent.io/confluent-cli/rpm/archive.key \
    && yum install yum-utils -y \
    && yum-config-manager --add-repo https://packages.confluent.io/confluent-cli/rpm/confluent-cli.repo \
    && yum clean all \
    && yum install confluent-cli -y \
    && rm -rf /var/cache/yum

# Install Kafka Connect plugins
RUN confluent connect plugin install confluentinc/kafka-connect-mqtt:latest \
    && confluent connect plugin install confluentinc/kafka-connect-prometheus-metrics:latest
