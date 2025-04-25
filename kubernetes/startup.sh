#!/bin/bash

kubectl create ns kafka && kubectl create ns mongodb

#kafka resources
kubectl apply -f ./kafka/strimzi/strimzi-0.45.0/install/cluster-operator -n kafka
kubectl apply -f ./kafka/strimzi/strimzi-0.45.0/examples/metrics/kafka-metrics.yaml -n kafka
kubectl apply -f ./kafka/strimzi/strimzi-0.45.0/examples/metrics/kafka-connect-metrics.yaml -n kafka

#mongodb resources
helm repo update
helm install community-operator mongodb/community-operator --namespace mongodb
kubectl apply -f mongodb-custom-resource.yaml -n mongodb
kubectl apply -f sensor-config.yaml -n mongodb
kubectl apply -f mongo-express-deployment.yaml -n mongodb

kubectl apply -f ./mosquitto-deployment.yaml -n kafka
#Must wait for Mosquitto deploy and svc to be ready.
#MQTT source connector fails if it starts up before Mosquitto
#Because it can't find the mosquitto service right away
until kubectl get deploy mosquitto-deployment -o wide -n kafka | grep "1/1"; do
  echo "Waiting for Mosquitto service to be ready..."
  sleep 2
done

until kubectl get kafkaconnect my-connect-cluster -n kafka | grep "True"; do
  echo "Waiting for Kafka Connect to be ready..."
  sleep 2
done

kubectl apply -f ./kafka/strimzi/strimzi-0.45.0/examples/connect/source-connector.yaml -n kafka
kubectl apply -f ./kafka/strimzi/strimzi-0.45.0/examples/connect/sink-connector.yaml -n kafka
kubectl apply -f ./kafka/strimzi/strimzi-0.45.0/examples/connect/prometheus-sink.yaml -n kafka
kubectl apply -f ./kafka/strimzi/strimzi-0.45.0/examples/bridge/kafka-bridge.yaml -n kafka




#Kafka connect ui and kafka topics ui
kubectl apply -f kafka-topics-ui-deployment.yaml -n kafka
kubectl apply -f kafka-connect-ui-deployment.yaml -n kafka
kubectl apply -f kafka-exporter-deployment.yaml -n kafka

#IoT Sensors
kubectl apply -f sensor-config.yaml -n kafka
kubectl apply -f kafka-alias.yaml -n kafka
kubectl apply -f iot-processor-deployment.yaml -n kafka
kubectl apply -f iot-sensor-1-deployment.yaml -n kafka
kubectl apply -f iot-sensor-2-deployment.yaml -n kafka
kubectl apply -f iot-sensor-3-deployment.yaml -n kafka

#Prometheus resources
kubectl create ns monitoring
kubectl apply -f prometheus-frontend.yaml -n monitoring