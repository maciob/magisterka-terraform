variable "AWS_REGION" {
  default = "eu-west-2"
}
#---------- BOTH
variable "subnet_count" {
  type = any
}
#---------- NETWORK
variable "subnets" {
  type = any
}
variable "vpc_config" {
  type = any
}
variable "route_table_config" {
  type = map(any)
}
variable "ingress_cidr_blocks" {
  type = list(string)
}
variable "egress_cidr_blocks" {
  type = list(string)
}
variable "ingress_rules" {
  type = list(string)
}
variable "egress_rules" {
  type = list(string)
}
variable "rules" {
  type = any
}
#---------- COMPUTE
variable "cluster_config" {
  type = any
}
variable "node_group_config" {
  type = any
}
variable "DB_Username" {
  type = any
}
variable "DB_Password" {
  type = any
}
#---------- Apps
variable "dns_config" {
  type = any
}
variable "argo_address" {
  type = any
}
variable "argocd_user" {
  type = any
}
variable "argocd_pass" {
  type = any
}