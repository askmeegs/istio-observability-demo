# Demos: Day 2 Istio Observability

A real Istio environment =
- Many services - need bulky telemetry pods to ingest all those Envoy metrics!
- Devs are on call. Alerting on istio-generated metrics like latency
- BYO Prometheus and Grafana, which are used by other things besides Istio and lives in its own namespace

Not covered in this lightning talk are other real-life setups:
- Multicluster / multicloud
- Mesh expansion / observability for stateful services


## Metrics - How to bring your own prometheus


## Metrics - Grafana service dashboards


## Kiali on Day 2

mTLS status
see your config in 1 place


Logging

enable envoy access logs



## recap - how we installed Istio to make this happen

1. install your own prom and grafana (I used the GCP marketplace), update ConfigMap for Istio
2. install Istio on Cluster 1 with a bunch of flags
3.