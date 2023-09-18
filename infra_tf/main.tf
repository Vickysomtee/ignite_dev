resource "kubectl_manifest" "test" {
  for_each  = toset(data.kubectl_path_documents.docs.documents)
  yaml_body = each.value
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "kube-prometheus" {
  name       = "kube-prometheus-stack"
  namespace  = var.namespace
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  depends_on = [ kubernetes_namespace.monitoring ]
}
