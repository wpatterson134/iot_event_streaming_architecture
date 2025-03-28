#!bin/bash

kubectl create ns kafka && kubectl create ns mongodb

#kafka resources
kubectl apply -f ./kafka/strimzi/strimzi-0.45.0/install/cluster-operator -n kafka
kubectl apply -f ./kafka/strimzi/strimzi-0.45.0/examples/kafka/kafka-persistent.yaml -n kafka
kubectl apply -f ./kafka/strimzi/strimzi-0.45.0/examples/connect/kafka-connect.yaml -n kafka
kubectl apply -f ./kafka/strimzi/strimzi-0.45.0/examples/connect/source-connector.yaml -n kafka
kubectl apply -f ./kafka/strimzi/strimzi-0.45.0/examples/connect/sink-connector.yaml -n kafka
kubectl apply -f ./kafka/strimzi/strimzi-0.45.0/examples/bridge/kafka-bridge.yaml -n kafka

#mongodb resources
helm repo update
helm install community-operator mongodb/community-operator --namespace mongodb
kubectl apply -f mongodb-custom-resource.yaml -n mongodb
kubectl apply -f sensor-config.yaml -n mongodb
kubectl apply -f mongo-express-deployment.yaml -n mongodb

#Kafka connect ui and kafka topics ui
kubectl apply -f kafka-topics-ui-deployment.yaml -n kafka
kubectl apply -f kafka-connect-ui-deployment.yaml -n kafka