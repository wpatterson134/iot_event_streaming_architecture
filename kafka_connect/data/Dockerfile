FROM confluentinc/cp-server-connect-base:latest

RUN apt-get update && apt-get install -y curl unzip && \
    curl -sO http://client.hub.confluent.io/confluent-hub-client-latest.tar.gz && \
    mkdir -p /usr/local/confluent-hub && \
    tar -xzf confluent-hub-client-latest.tar.gz -C /usr/local/confluent-hub && \
    ln -s /usr/local/confluent-hub/confluent-hub /usr/local/bin/confluent-hub && \
    rm confluent-hub-client-latest.tar.gz

RUN   confluent-hub install --no-prompt hpgrahsl/kafka-connect-mongodb:1.1.0 \
   && confluent-hub install --no-prompt confluentinc/kafka-connect-prometheus-metrics:1.0.0 \
   && confluent-hub install --no-prompt confluentinc/kafka-connect-mqtt:1.2.0