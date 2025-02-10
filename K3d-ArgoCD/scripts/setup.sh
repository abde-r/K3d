#!/bin/bash
set -e

sudo kubectl create namespace argocd
sudo kubectl create namespace dev
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
sudo kubectl apply -n dev -f ./confs/deployment.yaml
sudo kubectl apply -f ./dev/app.yaml