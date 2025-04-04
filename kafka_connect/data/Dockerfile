FROM quay.io/strimzi/kafka:0.45.0-kafka-3.8.0
USER root:root
COPY ./confluent-7.9.0 /opt/kafka/confluent-7.9.0
ENV CONFLUENT_HOME=/opt/kafka/confluent-7.9.0
ENV PATH=$PATH:$CONFLUENT_HOME/bin
RUN confluent --help
# ENV CONFLUENT_CLOUD_EMAIL=wpatterson134@gmail.com
# ENV CONFLUENT_CLOUD_PASSWORD=dir823rEgU3HQ8Yic@
# RUN confluent login
# RUN confluent connect plugin install confluentinc/kafka-connect-mqtt:1.2.4
# RUN confluent connect plugin install confluentinc/kafka-connect-prometheus-metrics:1.1.2

ENV CONNECT_PLUGIN_PATH="/usr/share/java,/usr/share/confluent-hub-components,/opt/kafka/custom-config/,/opt/kafka,/opt/kafka/plugins"


COPY ./my-plugins/ /opt/kafka/plugins/


USER 1001