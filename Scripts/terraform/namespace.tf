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

resource "kubernetes_namespace" "linkerd" {
  metadata {
    name = var.namespace-linkerd
  }
}
