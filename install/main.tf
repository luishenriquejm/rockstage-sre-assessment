resource "kubernetes_namespace" "minikube-namespace-db" {
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


resource helm_release "mysql" {
  name       = "wp-database"
  chart      = "./helm/mysql"
  namespace  = "database"

  set {
      name = "appname"
      value = "${var.database_app_name}"
  }

  set {
      name = "storage.size"
      value = "${var.database_storage_size}"
  }

  set {
      name = "storage.path"
      value = "${var.database_storage_path}"
  }

  set {
      name = "database.name"
      value = "${var.database_name}"
  }


  set {
      name = "database.root_password" # BASE64
      value = base64encode("${var.database_root_password}")
      # value = "c2VjcmV0"
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


