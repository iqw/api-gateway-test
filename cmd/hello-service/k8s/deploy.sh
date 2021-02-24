cd "$(dirname "$0")" && helm upgrade --install --namespace=hello-service --create-namespace hello-service hello-service
