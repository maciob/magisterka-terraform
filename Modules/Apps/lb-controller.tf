resource "helm_release" "aws-load-balancer-controller" {
    name = "aws-load-balancer-controller"
    chart = "./magisterka-helm/infra-apps/aws-load-balancer-controller"
    wait = true
    version = "1.0.0"
    namespace = "default"
    create_namespace = "true"

    set {
        name = "clusterName"
        value = "magisterka-cluster"
    }

}