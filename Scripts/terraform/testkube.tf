resource "kubernetes_secret" "testkube" {
  metadata {
    name = "testkube"
    namespace = "testkube"
  }

  data = {
    admin-user = "admin"
    admin-password = random_password.testkube.result
  }
}
resource "random_password" "testkube" {
  length = 24
}
resource "helm_release" "testkube" {
  chart            = "testkube"
  name            = "testkube"
  repository    = "https://kubeshop.github.io/helm-charts"
  namespace  = "testkube"
  version         = "1.9.276"

  values = [
    templatefile("${path.module}/templates/testkube-values.yaml", {
      admin_existing_secret = kubernetes_secret.testkube.metadata[0].name
      telemetry = false
      minioRootUser = "admin-user"
      minioRootPassword = "admin-password"
    })
  ]
}