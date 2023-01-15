resource "kubernetes_manifest" "argo-app-of-apps" {
  manifest = {
    "api_version" = "argoproj.io/v1alpha1"
    "kind" = "Application"
    "metadata" = {
      "name"      = "app"
      "namespace" = "argocd"
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
  depends_on = [helm_release.argo_cd]
}
