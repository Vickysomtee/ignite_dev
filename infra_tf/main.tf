resource "kubectl_manifest" "test" {
  for_each  = toset(data.kubectl_path_documents.docs.documents)
  yaml_body = each.value
}

resource "kubectl_manifest" "namespace" {
  yaml_body = <<YAML
  apiVersion: v1
  kind: Namespace
  metadata:
    name: prometheus
  YAML
}

resource "helm_release" "kube-prometheus" {
  name       = "kube-prometheus-stack"
  namespace  = var.namespace
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  depends_on = [kubectl_manifest.namespace]
}
