## Reflection

### Part 1 – Docker
- **Challenges Faced**:  
  e.g., Large image sizes, dependency conflicts, broken push errors.  
- **Resolution**:  
  Applied multi-stage builds, used `.dockerignore`, corrected tags.  
- **Lessons Learned**:  
  Importance of image optimization and consistent tagging practices.

---

### Part 2 – Docker Swarm
- **Challenges Faced**:  
  e.g., Node join failures, overlay network misconfiguration, service downtime during updates.  
- **Resolution**:  
  Verified tokens/IPs, re‑initialized overlay network, configured rolling updates.  
- **Lessons Learned**:  
  Swarm’s HA and rolling update strategies ensure resilience in distributed environments.

---

### Part 3 – Kubernetes
- **Challenges Faced**:  
  e.g., YAML syntax errors, failed rollout, PVC not binding.  
- **Resolution**:  
  Used `kubectl describe` for debugging, applied rollback, corrected storage class.  
- **Lessons Learned**:  
  Declarative configs + troubleshooting commands are critical for production readiness.

---

### Part 4 – Istio & EFK
- **Challenges Faced**:  
  e.g., Traffic routing misconfigurations, Jaeger not capturing traces, Fluentd not shipping logs.  
- **Resolution**:  
  Validated VirtualService/DestinationRule with `istioctl analyze`, redeployed Jaeger, checked Fluentd DaemonSet.  
- **Lessons Learned**:  
  Service mesh adds powerful traffic control, but observability/logging must be tuned carefully.

---

### Overall Takeaways
- **Key Skills Gained**: Containerization, orchestration, scaling, traffic management, observability.  
- **Future Improvements**: Automate deployments with CI/CD, integrate Helm charts, explore GitOps workflows.  
