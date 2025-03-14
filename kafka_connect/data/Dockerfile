FROM confluentinc/cp-kafka-connect:latest

RUN   confluent-hub install --no-prompt hpgrahsl/kafka-connect-mongodb:1.1.0 \
   && confluent connect plugin install --no-prompt confluentinc/kafka-connect-prometheus-metrics:latest \
   && confluent connect plugin install --no-prompt confluentinc/kafka-connect-mqtt:latest