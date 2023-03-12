resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = var.namespace-monitoring
  }
}

resource "kubernetes_namespace" "storage" {
  metadata {
    name = var.namespace-storage
  }
}