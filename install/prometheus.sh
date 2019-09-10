#!/bin/bash


kubectl create namespace istio-system

kubectl create clusterrolebinding cluster-admin-binding \
    --clusterrole=cluster-admin \
    --user=$(gcloud config get-value core/account)

kubectl apply -f cluster-role.yaml
kubectl apply -f configmap.yaml
kubectl apply -f deployment.yaml