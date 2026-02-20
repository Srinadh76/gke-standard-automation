#!/bin/bash

PROJECT_ID="test-440011"
CLUSTER_NAME="standard-demo"
REGION="us-central1"

echo "Checking node autoscaling & management..."
gcloud container node-pools describe default-pool \
  --cluster $CLUSTER_NAME \
  --region $REGION \
  --project $PROJECT_ID \
  --format="yaml(autoscaling,management)"

echo "Checking HPA status..."
kubectl get hpa

echo "Checking nodes..."
kubectl get nodes

echo "Checking pods..."
kubectl get pods
