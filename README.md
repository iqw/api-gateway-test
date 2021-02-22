# What is this?

Working usage of Kong Gateway under k8s with jwt auth

# Installation (EASY WAY)

1. `make run` (default k8s context will be accessed, 3 namespaces created)

# Installation (HARD WAY)

1. Install Kong into any cluster

```shell script
helm repo add kong https://charts.konghq.com
helm repo update
helm install kong/kong --namespace=kong --create-namespace --generate-name --set ingressController.installCRDs=false
```

2. Execute cmd/monolith/deploy.sh and cmd/hello-service/deploy.sh from within script directory (on deploy.sh level)

# Access

1. `kubectl --namespace kong port-forward service/kong-kong-proxy 8080:80`
2. Call `GET http://localhost:8080/v1/hello` (to access `hello-service`) or `GET http://localhost:8080/v1/world` (to
   access `monolith`). Hello service is secured, use this token to access (header `Authorization: Bearer {token}`):

```shell
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImlzcyI6IjExMTEifQ.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.yaZK93v1wSsw_4mLjKVaFexap5gsd_USYqs7BDmy0Vc
```
