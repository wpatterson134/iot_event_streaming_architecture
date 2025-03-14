FROM confluentinc/cp-kafka-connect:latest

RUN   confluent-hub install --no-prompt hpgrahsl/kafka-connect-mongodb:1.1.0 \
   && confluent-hub install --no-prompt confluentinc/kafka-connect-prometheus-metrics:1.0.0 \
   && confluent-hub install --no-prompt confluentinc/kafka-connect-mqtt:1.2.0