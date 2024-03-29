resource "helm_release" "external_dns" {
    name = "external-dns"
    chart = "./magisterka-helm/infra-apps/external-dns"
    wait = true
    version = "6.12.0"
    namespace = "default"
    create_namespace = "true"

    set {
        name = "provider"
        value = var.dns_config["provider"]
    }
    set {
        name = "domainFilters[0]"
        value = var.dns_config["filter"]
    }
    set {
        name = "policy"
        value = var.dns_config["policy"]
    }
    set {
        name = "registry"
        value = var.dns_config["registry"]
    }
    set {
        name = "txtOwnerId"
        value = var.dns_config["txtOwnerId"]
    }
    set {
        name = "interval"
        value = var.dns_config["interval"]
    }
    set {
        name = "rbac.create"
        value = var.dns_config["create"]
    }
    set {
        name = "rbac.serviceAccountName"
        value = var.dns_config["name"]
    }
    set {
        name = "rbac.serviceAccountAnnotations.eks\\.amazonaws\\.com/role-arn"
        value = var.dns_config["arn"]
    }
    set {
        name  = "name"
        value = "external-dns"
    }
}