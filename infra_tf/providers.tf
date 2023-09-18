terraform {
  required_version = ">= 0.13"

  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

provider "kubectl" {
  config_path    = var.kube_config
  config_context = var.cluster
}

provider "helm" {
  kubernetes {
    config_path    = var.kube_config
    config_context = var.cluster
  }
}

