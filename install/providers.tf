provider "kubernetes" {
  config_context_cluster = "minikube"
  host = "https://127.0.0.1:8443"
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    host = "https://127.0.0.1:8443"
    config_path = "~/.kube/config"
  }
}

terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.1.2"
    }
    local = {
      source = "hashicorp/local"
      version = "2.1.0"
    }

  }
}