resource "argocd_application" "ArgoAppOfApps" {
  metadata {
    name      = "App"
    namespace = "argocd"
    labels = {
      test = "true"
    }
  }
  spec {
    source {
      repo_url        = "https://github.com/maciob/magisterka-GitOps.git"
      chart           = "AppOfApps"
      target_revision = "master"
      path            = "."
    }

    destination {
      server    = "https://kubernetes.default.svc"
      namespace = "App"
    }
  }
}
