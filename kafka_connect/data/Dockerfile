FROM confluentinc/cp-server-connect-base:latest


RUN   confluent connect plugin install confluentinc/kafka-connect-mqtt:latest \
   && confluent connect plugin install confluentinc/kafka-connect-prometheus-metrics:latest