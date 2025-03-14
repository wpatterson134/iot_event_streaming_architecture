FROM confluentinc/cp-server-connect-base:latest


RUN   confluent connect plugin install confluentinc/kafka-connect-mqtt:latest \
   #&& confluent-hub install --no-prompt confluentinc/kafka-connect-prometheus-metrics:1.0.0 \
   #&& confluent-hub install --no-prompt confluentinc/kafka-connect-mqtt:1.2.0