FROM confluentinc/cp-server-connect-base:latest


RUN   confluent connect plugin install confluentinc/kafka-connect-mqtt:latest \
   && confluent connect plugin install confluentinc/kafka-connect-prometheus-metrics:latest \
   && confluent-hub install --no-prompt confluentinc/kafka-connect-mqtt:1.2.0