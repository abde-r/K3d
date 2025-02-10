#!/bin/bash
set -e

sudo kubectl apply -f /app1/deployment.yaml
sudo kubectl apply -f /app2/deployment.yaml
sudo kubectl apply -f /app3/deployment.yaml
sudo kubectl apply -f ingress.yaml