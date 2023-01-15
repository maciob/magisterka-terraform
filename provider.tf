provider "aws" {
    region = "${var.AWS_REGION}"
}
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
provider "helm" {
    kubernetes {
        host = "${module.Compute.CLUSTER_ENDPOINT}"
        cluster_ca_certificate = base64decode(module.Compute.CLUSTER_CERTIFICATE_AUTHORITY.0.data)
        exec {
            api_version = "client.authentication.k8s.io/v1beta1"
            args        = ["eks", "get-token", "--cluster-name", var.cluster_config["name"]]
            command     = "aws"
        }
    }
}
