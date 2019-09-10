#!/bin/bash

WORKDIR="/Users/mokeefe"
ISTIO_VERSION=1.2.5

kubectl create clusterrolebinding cluster-admin-binding \
    --clusterrole=cluster-admin \
    --user=$(gcloud config get-value core/account)

kubectl label namespace default istio-injection=enabled

helm template ${WORKDIR}/istio-${ISTIO_VERSION}/install/kubernetes/helm/istio-init --name istio-init --namespace istio-system | kubectl apply -f -
sleep 20

kubectl get crds | grep 'istio.io\|certmanager.k8s.io' | wc -l

sleep 2

helm template ${WORKDIR}/istio-${ISTIO_VERSION}/install/kubernetes/helm/istio --name istio --namespace istio-system \
--set prometheus.enabled=false \
--set tracing.enabled=true \
--set kiali.enabled=true --set kiali.createDemoSecret=true \
--set "kiali.dashboard.jaegerURL=http://jaeger-query:16686" \
--set "kiali.dashboard.grafanaURL=http://grafana:3000" \
--set grafana.enabled=true \
--set global.proxy.accessLogFile="/dev/stdout" \
--set sidecarInjectorWebhook.enabled=true > istio.yaml

kubectl apply -f istio.yaml