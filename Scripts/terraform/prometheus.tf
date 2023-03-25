resource "helm_release" "prometheus" {
  chart            = "prometheus"
  name            = "prometheus"
  namespace  = "monitoring"
  repository    = "https://prometheus-community.github.io/helm-charts"
  version         = "19.7.2"

  values = [
    templatefile("${path.module}/templates/prometheus-values.yaml", {
      persistentVolume = true
    })
  ]

}