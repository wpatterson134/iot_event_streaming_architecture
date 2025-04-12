#!/bin/bash

kubectl create ns kafka && kubectl create ns mongodb

#kafka resources
kubectl apply -f ./kafka/strimzi/strimzi-0.45.0/install/cluster-operator -n kafka
kubectl apply -f ./kafka/strimzi/strimzi-0.45.0/examples/kafka/kafka-persistent.yaml -n kafka
kubectl apply -f ./kafka/strimzi/strimzi-0.45.0/examples/connect/kafka-connect.yaml -n kafka

#mongodb resources
helm repo update
helm install community-operator mongodb/community-operator --namespace mongodb
kubectl apply -f mongodb-custom-resource.yaml -n mongodb
kubectl apply -f sensor-config.yaml -n mongodb
kubectl apply -f mongo-express-deployment.yaml -n mongodb

until kubectl get kafkaconnect my-connect-cluster | grep "Ready"; do
  echo "Waiting for Kafka Connect to be ready..."
  sleep 2
done

kubectl apply -f ./kafka/strimzi/strimzi-0.45.0/examples/connect/source-connector.yaml -n kafka
kubectl apply -f ./kafka/strimzi/strimzi-0.45.0/examples/connect/sink-connector.yaml -n kafka
kubectl apply -f ./kafka/strimzi/strimzi-0.45.0/examples/bridge/kafka-bridge.yaml -n kafka

until kubectl get kctr mqtt-source | grep "Ready"; do
  echo "Waiting for MQTT Source connector to be ready..."
  sleep 2
done

kubectl apply -f ./mosquitto-deployment.yaml -n kafka



#Kafka connect ui and kafka topics ui
kubectl apply -f kafka-topics-ui-deployment.yaml -n kafka
kubectl apply -f kafka-connect-ui-deployment.yaml -n kafka

#IoT Sensors
kubectl apply -f sensor-config.yaml -n kafka
kubectl apply -f iot-processor-deployment.yaml -n kafka
kubectl apply -f iot-sensor-1-deployment.yaml -n kafka
kubectl apply -f iot-sensor-2-deployment.yaml -n kafka
kubectl apply -f iot-sensor-3-deployment.yaml -n kafka