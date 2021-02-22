
run: kong_init kong_provision
	sh cmd/monolith/k8s/deploy.sh
	sh cmd/hello-service/k8s/deploy.sh

kong_init:
	helm repo add kong https://charts.konghq.com
	helm repo update
	helm upgrade --install kong kong/kong --namespace=kong --create-namespace --set ingressController.installCRDs=false

kong_provision:
	kubectl apply -f cmd/kong/auth.yaml
