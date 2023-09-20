vcluster connect howard-moomboo-staging -n vcluster-howard-moomboo-stage --server https://howard.moomboo.stage --kube-config ./kubeconfig-temp.yaml --update-current=false


10.17.12.206  podinfo.demo.test
209, not 206

kubectl -n ingress-nginx logs deployment/flagger -f | jq .msg

stern -n ingress-nginx deploy/flagger -o raw --tail 10|jq .msg