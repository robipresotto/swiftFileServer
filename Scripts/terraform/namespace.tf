resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = var.namespace-monitoring
    annotations = {
      "linkerd.io/inject" = "enabled"
    }
  }
}

resource "kubernetes_namespace" "storage" {
  metadata {
    name = var.namespace-storage
    annotations = {
      "linkerd.io/inject" = "enabled"
    }
  }
}

resource "kubernetes_namespace" "app" {
  metadata {
    name = var.namespace-app
    annotations = {
      "linkerd.io/inject" = "enabled"
    }
  }
}

resource "kubernetes_namespace" "linkerd" {
  metadata {
    name = var.namespace-linkerd
  }
}

resource "kubernetes_namespace" "ci-cd" {
  metadata {
    name = var.namespace-ci-cd
  }
}

