provider "kubernetes" {
  config_context_cluster   = "minikube"
  host = "http://localhost:8080"
}


resource "kubernetes_namespace" "minikube-namespace1" {
  metadata {
        name = "database"
  }
}

resource "kubernetes_namespace" "minikube-namespace1" {
  metadata {
        name = "cliente1"
  }
}

resource "kubernetes_namespace" "minikube-namespace2" {
  metadata {
        name = "cliente2"
  }
}

resource "kubernetes_namespace" "minikube-namespace3" {
  metadata {
        name = "cliente3"
  }
}

terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.1.2"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource helm_release "mysql" {
  name       = "mysql"
  chart      = "/mnt/c/Terraform/helm/mysql"
  namespace  = "database"

  set {
      name = "appname"
      value = "wordpress-db-mysql"
  }

  set {
      name = "storage.size"
      value = "20Gi"
  }

  set {
      name = "storage.path"
      value = "/kubernetes/pv/db/mysql_cliente/"
  }

  set {
      name = "database.name"
      value = "WPCLIENTE1"
  }


}


# resource helm_release "mysql2" {
#   name       = "mysql"
#   chart      = "/mnt/c/Terraform/helm/mysql"
#   namespace  = "cliente1"
# }

# resource helm_release "mysql3" {
#   name       = "mysql"
#   chart      = "/mnt/c/Terraform/helm/mysql"
#   namespace  = "cliente1"
# }


