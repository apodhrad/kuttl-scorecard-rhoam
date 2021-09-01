# Kuttl Scorecard RHOAM test config

1. Install RHOAM and login to the OpenShift cluster as a user with cluster-admin permissions
2. Apply RBAC
```bash
kubectl apply -f rbac/rbac.yaml
```
3. Run the scorecard kuttl test
```bash
operator-sdk scorecard ./bundle --selector='suite=rhoam-basic' --namespace=redhat-rhoam-operator --service-account=cluster-admin-sa --skip-cleanup --wait-time 600s
```