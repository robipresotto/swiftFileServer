resource "helm_release" "k8-dashboard" {
  name            = "k8 dashboard"
  repository    = "https://kubernetes.github.io/dashboard/"
  chart            = "kubernetes-dashboard"
  namespace  = "k8"

  values = [
    templatefile("${path.module}/templates/k8-values.yaml", {
      # not defined yet
    })
  ]
}