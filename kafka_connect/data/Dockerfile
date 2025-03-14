# Use the Confluent Kafka Connect base image
FROM confluentinc/cp-server-connect-base:latest

# Install dependencies and Confluent CLI using YUM (for RHEL-based images)
RUN yum install -y curl gnupg yum-utils && \
    rpm --import https://packages.confluent.io/confluent-cli/rpm/archive.key && \
    yum-config-manager --add-repo https://packages.confluent.io/confluent-cli/rpm/confluent-cli.repo && \
    yum clean all && \
    yum install -y confluent-cli && \
    rm -rf /var/cache/yum

# Install Kafka Connect plugins
RUN confluent connect plugin install confluentinc/kafka-connect-mqtt:latest \
    && confluent connect plugin install confluentinc/kafka-connect-prometheus-metrics:latest
