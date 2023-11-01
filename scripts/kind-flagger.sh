
# install ingress-nginx
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
kubectl create ns ingress-nginx
helm upgrade -i ingress-nginx ingress-nginx/ingress-nginx \
--namespace ingress-nginx \
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

# kubectl create ns test
# kubectl apply -k https://github.com/fluxcd/flagger//kustomize/podinfo?ref=main

helm upgrade -i flagger-loadtester flagger/loadtester \
--namespace=test

kubectl apply -f ./podinfo-ingress.yaml
kubectl apply -f ./podinfo-canary.yaml


