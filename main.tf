provider "kubernetes" {
  config_context_cluster   = "minikube"
  host = "https://localhost:8443"
}


provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
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


# resource "kubernetes_namespace" "minikube-namespace-db" {
#   metadata {
#         name = "database"
#   }
# }

resource "kubernetes_namespace" "minikube-namespace1" {
  metadata {
        name = "cliente1"
  }
}

# resource "kubernetes_namespace" "minikube-namespace2" {
#   metadata {
#         name = "cliente2"
#   }
# }

# resource "kubernetes_namespace" "minikube-namespace3" {
#   metadata {
#         name = "cliente3"
#   }
# }


resource helm_release "mysql" {
  name       = "mysql"
  chart      = "./helm/mysql"
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

}









# # Configure the MySQL provider
# provider "mysql" {
#   endpoint = "my-database.example.com:3306"
#   username = "app-user"
#   password = "app-password"
# }

# # Create a Database
# resource "mysql_database" "app" {
#   name = "my_awesome_app"
# }



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


