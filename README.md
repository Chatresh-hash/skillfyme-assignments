# Assignment #1 – Containerized Microservices with High Availability and Smart Traffic Routing

## 📌 Overview
This repository contains the complete solution for SkillfyBank’s production-level assignment.  
It demonstrates containerization, orchestration, scaling, traffic management, and observability using:
- **Docker** (microservice containerization)
- **Docker Swarm** (multi-host orchestration)
- **Kubernetes** (full-scale deployment)
- **Istio** (advanced traffic routing & service mesh)
- **EFK Stack** (logging & visualization)

---

## ⚙️ Prerequisites
- Docker & DockerHub account
- Docker Machine + VirtualBox (for Swarm simulation)
- Kubernetes cluster (minikube/kubeadm/multipass)
- Istio + Jaeger + MetalLB
- Optional: EFK stack (Elasticsearch, Fluentd, Kibana)

---

## 🚀 Execution Guide

### Part 1 – Docker
1. Build and push images:
   ```bash
   docker build -t <dockerhub-user>/account-service:1.0 ./docker/account-service
   docker push <dockerhub-user>/account-service:1.0

   docker build -t <dockerhub-user>/transaction-service:1.0 ./docker/transaction-service
   docker push <dockerhub-user>/transaction-service:1.0

   docker build -t <dockerhub-user>/notifition-service:1.0 ./docker/notification-service
   docker push <dockerhub-user>/notification-service:1.0


### Part 2 – Docker Swarn

./swarm/swarm-init.sh
docker stack deploy -c part2-swarm/docker-stack.yml skillfybank

### Part 3 - Kubernetes 

kubectl apply -f part3-kubernetes/account-deployment.yaml
kubectl apply -f part3-kubernetes/transaction-deployment.yaml
kubectl apply -f part3-kubernetes/notification-deployment.yaml

kubectl rollout undo deployment/transaction-deployment
kubectl logs
kubectl describe

### Part 4 - Istio

Install Istio and enable mTLS.

Apply traffic routing configs:

bash
kubectl apply -f part4-istio/virtualservice-transaction.yaml
kubectl apply -f part4-istio/destinationrule-transaction.yaml
kubectl apply -f part4-istio/virtualservice-notification.yaml
kubectl apply -f part4-istio/destinationrule-notification.yaml
Validate traffic splitting (90/10), canary deployment, A/B testing.

Enable Jaeger tracing and circuit breaking.

Deploy EFK stack for log visualization.

### Trouble Shooting

Docker push errors → check tags, DockerHub login.

Swarm join issues → verify tokens and IP addresses.

Kubernetes rollout failures → use kubectl rollout undo.

Istio routing misconfigurations → run istioctl analyze.

EFK logs not visible → confirm Fluentd DaemonSet is running and Elasticsearch is reachable.



-----















