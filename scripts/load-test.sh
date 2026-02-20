#!/bin/bash

echo "Starting load generator..."

kubectl run load-generator \
  --image=busybox \
  -- /bin/sh -c "while true; do wget -q -O- http://nginx-demo; done"

echo "Load test running"
