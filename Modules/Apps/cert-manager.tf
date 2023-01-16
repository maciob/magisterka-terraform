resource "helm_release" "cert-manager" {
    name = "cert-manager"
    repository = "https://charts.jetstack.io"
    chart = "cert-manager"
    wait = true
    version = "1.11.0"
    namespace = "default"
    create_namespace = "true"

    set {
        name = "installCRDs"
        value = "true"
    }
}