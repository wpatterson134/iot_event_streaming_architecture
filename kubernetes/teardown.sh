#!/bin/bash

#IoT sensors and processor
kubectl delete -f sensor-config.yaml -n kafka
kubectl delete -f iot-processor-deployment.yaml -n kafka
kubectl delete -f iot-sensor-1-deployment.yaml -n kafka
kubectl delete -f iot-sensor-2-deployment.yaml -n kafka
kubectl delete -f iot-sensor-3-deployment.yaml -n kafka

#Kafka connect ui and kafka topics ui
kubectl delete -f kafka-topics-ui-deployment.yaml -n kafka
kubectl delete -f kafka-connect-ui-deployment.yaml -n kafka

#mongodb resources
kubectl delete -f mongodb-custom-resource.yaml -n mongodb
kubectl delete -f sensor-config.yaml -n mongodb
kubectl delete -f mongo-express-deployment.yaml -n mongodb
helm uninstall community-operator mongodb/community-operator --namespace mongodb

#kafka resources
kubectl delete -f ./kafka/strimzi/strimzi-0.45.0/examples/bridge/kafka-bridge.yaml -n kafka
kubectl delete -f ./kafka/strimzi/strimzi-0.45.0/examples/connect/source-connector.yaml -n kafka
kubectl delete -f ./kafka/strimzi/strimzi-0.45.0/examples/connect/sink-connector.yaml -n kafka
kubectl delete -f ./kafka/strimzi/strimzi-0.45.0/examples/connect/kafka-connect.yaml -n kafka
kubectl delete -f ./kafka/strimzi/strimzi-0.45.0/examples/kafka/kafka-persistent.yaml -n kafka
kubectl delete -f ./kafka/strimzi/strimzi-0.45.0/install/cluster-operator -n kafka


kubectl delete ns kafka && kubectl delete ns mongodb





