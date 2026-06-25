kubectl apply -f virtualservice-transaction.yaml
kubectl apply -f destinationrule-transaction.yaml
kubectl apply -f virtualservice-notification.yaml
kubectl apply -f destinationrule-notification.yaml


istioctl proxy-status
kubectl logs <pod-name>

curl -H "x-user-type: beta" http://<notification-service-url>

