# ignite_dev

This is in fulfillment of the Ignite dev DevOps assessment.

## Test the Project

### Clone the project

```
git clone https://github.com/Vickysomtee/ignite_dev.git
```

### Go to the project directory

```
  cd ignite_dev

```
### Deploy the kubernetes cluster using Kind
Move into the kind directory the deploy the cluster

```
  cd kind && bash cluster.sh

```

### Deploy the Applications using Terraform
Move into the terraform directory to deploy the express app together with the kube-prometheus-stack

```
  cd infra_tf
  terraform init
  terraform plan
  terraform apply --auto-approve

```

Now the pods and services should be deployed and succesfully running. I created a namespace called 'Prometheus so the kube-prometheus-stack can run a different cluster.

### Access the pods in the browser.

Use the commands below to access the express app and kube-prometheus-stack (prometheus, grafana and aletmanager) respectively in the browser

```
kubectl port-forward svc/ignite-svc 3000:3000
kubectl port-forward svc/kube-prometheus-stack-prometheus 9090:9090 --namespace prometheus
kubectl port-forward svc/kube-prometheus-stack-grafana 3005:80 --namespace prometheus
kubectl port-forward svc/kube-prometheus-stack-alertmanager 9093:9093 --namespace prometheus

```

- localhost:3000 - express app
- localhost:9090 - prometheus
- localhost:3005 - grafana
- localhost:9093 - alertmanager
