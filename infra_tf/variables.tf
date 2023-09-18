variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}
variable "namespace" {
  type    = string
  default = "prometheus"
}
variable "cluster" {
  type    = string
  default = "kind-ignitedev"
}