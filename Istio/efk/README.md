Overview
This EFK stack collects logs from Kubernetes pods using Fluentd, stores them in Elasticsearch, and visualizes them in Kibana.

kubectl apply -f elasticsearch-deployment.yaml
kubectl apply -f kibana-deployment.yaml

http://<node-ip>:30056.

kubectl apply -f fluentd-daemonset.yaml

Check Fluentd pods: kubectl get pods -n kube-system

Open Kibana dashboard and configure index patterns (fluentd-*).

