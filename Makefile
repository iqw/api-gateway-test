
run: kong_init kong_provision services_init
	kubectl --namespace kong port-forward service/kong-kong-proxy 8080:80

services_init:
	sh cmd/monolith/k8s/deploy.sh
	sh cmd/hello-service/k8s/deploy.sh

kong_init:
	helm repo add kong https://charts.konghq.com
	helm repo update
	helm upgrade --install kong kong/kong --namespace=kong --create-namespace --set ingressController.installCRDs=false

kong_provision:
	kubectl apply -f cmd/kong/auth.yaml
