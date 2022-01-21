# Kuttl Scorecard RHOAM test config

1. Install RHOAM and login to the OpenShift cluster as a user with cluster-admin permissions
2. Apply RBAC
```bash
kubectl apply -f rbac/rbac.yaml
```
3. Run the scorecard kuttl test
```bash
operator-sdk scorecard ./bundle \
    --selector='suite=happy-path' \
    --namespace=redhat-rhoam-operator \
    --skip-cleanup \
    --wait-time 3000s \
    --service-account rhoam-test-runner
```