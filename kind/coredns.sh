kind create cluster --config=ingress-cluster.yaml
lsof -i tcp:443

# coredns

# https://github.com/kingdon-ci/fleet-infra/blob/main/examples/production-basic/coredns/coredns-custom.yaml


k edit cm coredns -oyaml -n kube-system

# rewrite name weavegitops.demo ingress-nginx-controller.ingress-nginx.svc.cluster.local
# rewrite name podinfo.demo ingress-nginx-controller.ingress-nginx.svc.cluster.local

k rollout restart deployment coredns -n kube-system


kubectl delete pod dnstools; kubectl run -it --rm --restart=Never --image=infoblox/dnstools:latest dnstools



#https://github.com/kingdon-ci/fleet-infra/blob/main/examples/production-basic/coredns/coredns-custom.yaml