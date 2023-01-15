terraform{
    backend "s3" {
        bucket = "terraform-magisterka"
        key = "state"
        region = "eu-west-1"
    }
    required_providers {
        argocd = {
            source = "oboukili/argocd"
            version = "1.1.3"
        }
    }
}
provider "argocd" {
  server_addr = "https://kubernetes.default.svc"
  username    = var.argocd_user
  password    = var.argocd_pass
}
