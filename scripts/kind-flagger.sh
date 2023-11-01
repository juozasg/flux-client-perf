# install ingress-nginx
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
kubectl create ns ingress-nginx
helm upgrade -i ingress-nginx ingress-nginx/ingress-nginx \
--namespace ingress-nginx \
--set controller.metrics.enabled=true \
--set controller.hostPort.enabled=true \
--set controller.terminationGracePeriodSeconds=0 \
--set controller.service.type="NodePort" \
--set controller.watchIngressWithoutClass=true \
--set controller.publishService.enabled=false \
--set controller.extraArgs.publish-status-address="localhost" \
--set controller.metrics.enabled=true \
--set controller.podAnnotations."prometheus\.io/scrape"=true \
--set controller.podAnnotations."prometheus\.io/port"=10254


# install flagger
helm repo add flagger https://flagger.app
helm upgrade -i flagger flagger/flagger \
--namespace ingress-nginx \
--set prometheus.install=true \
--set meshProvider=nginx


# install app 

# kubectl apply -k https://github.com/fluxcd/flagger//kustomize/podinfo?ref=main

# kubectl create ns test
helm upgrade -i flagger-loadtester flagger/loadtester \
--namespace=default
# k ge
kubectl apply -f ./podinfo-ingress.yaml
kubectl apply -f ./podinfo-canary.yaml




# controller:
#   hostPort:
#     enabled: true
#   terminationGracePeriodSeconds: 0
#   service:
#     type: "NodePort"
#   watchIngressWithoutClass: true

#   nodeSelector:
#     ingress-ready: "true"
#   tolerations:
#   - effect: "NoSchedule"
#     key: "node-role.kubernetes.io/master"
#     operator: "Equal"
#   - effect: "NoSchedule"
#     key: "node-role.kubernetes.io/control-plane"
#     operator: "Equal"
#   publishService:
#     enabled: false
#   extraArgs:
#     publish-status-address: "localhost"

# kind nginx
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
