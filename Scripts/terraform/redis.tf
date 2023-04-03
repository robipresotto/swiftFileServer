
resource "helm_release" "redis-cluster" {
  chart = "redis-cluster"
  name = "redis-cluster"
  repository = "https://charts.bitnami.com/bitnami"
  namespace = "app"
  version = "8.4.3"
  
  values = [
    templatefile("${path.module}/templates/redis-values.yaml", {
      // not definied yet
    })
  ]
}