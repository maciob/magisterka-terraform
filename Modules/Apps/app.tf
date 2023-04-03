resource "helm_release" "magisterka" {
    depends_on = [helm_release.external_dns,helm_release.aws-load-balancer-controller]
    name = "magisterka"
    chart = "./magisterka-helm/frontend"
    wait = true
    version = "1.0.0"
    namespace = "default"
    create_namespace = "true"

    set {
        name = "global.backend"
        value = "magisterka-backend"
    }    
    set {
        name = "global.front_url"
        value = "${var.front_url}"
    }
    set {
        name = "global.connectionstring"
        value = "server=${var.db_address};user=${var.db_username};password=${var.db_password};database=menadzer;"
    }
    set {
        name = "global.mail_login"
        value = var.email_username
    }
    set {
        name = "global.mail_password"
        value = var.email_password
    }
    set {
        name = "ingress.annotations.external-dns\\.alpha\\.kubernetes\\.io/hostname"
        value = var.front_url
    }
    set {
        name  = "ingress.annotations.alb\\.ingress\\.kubernetes\\.io/certificate-arn"
        value = "${var.cert_arn}"
    }
}