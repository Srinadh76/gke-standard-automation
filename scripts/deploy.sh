#!/bin/bash

PROJECT_ID="test-440011"
CLUSTER_NAME="standard-demo"
REGION="us-central1"
NODE_POOL="default-pool"

echo "Connecting to cluster..."
gcloud container clusters get-credentials $CLUSTER_NAME \
  --region $REGION \
  --project $PROJECT_ID

echo "Enabling node autoscaling..."
gcloud container node-pools update $NODE_POOL \
  --cluster $CLUSTER_NAME \
  --region $REGION \
  --enable-autoscaling \
  --min-nodes 1 \
  --max-nodes 3 \
  --project $PROJECT_ID

echo "Enabling auto-upgrade..."
gcloud container node-pools update $NODE_POOL \
  --cluster $CLUSTER_NAME \
  --region $REGION \
  --enable-autoupgrade \
  --project $PROJECT_ID

echo "Enabling auto-repair..."
gcloud container node-pools update $NODE_POOL \
  --cluster $CLUSTER_NAME \
  --region $REGION \
  --enable-autorepair \
  --project $PROJECT_ID

echo "Deploying sample workload..."
kubectl apply -f k8s/nginx.yaml
kubectl apply -f k8s/hpa.yaml

echo "Deployment & automation setup completed"
