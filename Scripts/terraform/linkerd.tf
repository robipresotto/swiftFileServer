resource "helm_release" "linkerd-viz" {
  chart            = "linkerd-viz"
  name            = "linkerd-viz"
  repository    = "https://helm.linkerd.io/stable"
  namespace  = var.namespace-linkerd
  version         = "30.3.6"

  values = [
    templatefile("${path.module}/templates/linkerd-values.yaml", {
      //TODO: https://artifacthub.io/packages/helm/linkerd2/linkerd-viz
    })
  ]

  depends_on = [
    helm_release.linkerd-crds
  ]
}

resource "helm_release" "linkerd-crds" {
  chart            = "linkerd-crds"
  name            = "linkerd-crds"
  repository    = "https://helm.linkerd.io/stable"
  namespace  = var.namespace-linkerd
  version         = "1.4.0"
}