flux bootstrap github \
  --token-auth \
  --owner=juozasg \
  --repository=flux-client-perf \
  --branch=main \
  --path=infra \
  --personal



 k port-forward Deployment/podinfo 8080:9898
 

## delete
kubectl patch kustomization/flux-system -n flux-system \
    --type json \
    --patch='[ { "op": "remove", "path": "/metadata/finalizers" } ]'