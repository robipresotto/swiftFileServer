
resource "helm_release" "testkube" {
  chart            = "kubeshop/testkube"
  name            = "testkube"
  repository    = "https://kubeshop.github.io/helm-charts"
  namespace  = "testkube"
  version         = "1.9.246"

  values = [
    templatefile("${path.module}/templates/testkube-values.yaml", {
      # not defined yet
    })
  ]
}