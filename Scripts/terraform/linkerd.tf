resource "helm_release" "linkerd-plane" {
  name            = "linkerd-control-plane"
  chart            = "linkerd-control-plane"
  repository    = "https://helm.linkerd.io/stable"
  namespace  = var.namespace-linkerd
  version         = "1.9.6"

  values = [
    templatefile("${path.module}/templates/linkerd-values.yaml", {
      debugLevel = "debug"
    })
  ]

  set_sensitive {
    name = "identityTrustAnchorsPEM"
    value = "certificates/ca.crt"
  }

  set_sensitive {
    name = "identity.issuer.tls.keyPEM"
    value = "certificates/issuer.key"
  }

  set_sensitive {
    name = "identity.issuer.tls.crtPEM"
    value = "certificates/issuer.crt"
  }
  
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