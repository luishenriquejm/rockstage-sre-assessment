resource "kubernetes_namespace" "minikube-namespace-db" {
  metadata {
        name = "${var.database_namespace}"
  }
}

resource "kubernetes_namespace" "minikube-namespace1" {
  metadata {
        name = "${var.namespace_1}"
  }
}

resource "kubernetes_namespace" "minikube-namespace2" {
  metadata {
        name = "${var.namespace_2}"
  }
}

resource "kubernetes_namespace" "minikube-namespace3" {
  metadata {
        name = "${var.namespace_3}"
  }
}

resource helm_release "mysql" {
  name       = "${var.database_helm_name}"
  chart      = "./helm/mysql"
  namespace  = "${var.database_namespace}"

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
      name = "database.root_password"
      value = base64encode("${var.database_root_password}")
  }

}

# #### CLIENT 1 ###

# resource helm_release "wordpress" {
#   name       = "${var.wp1_helm_name}"
#   chart      = "./helm/wordpress"
#   namespace  = "${var.namespace_1}"

#   set {
#       name = "phpmyadmin.nodeport"
#       value = "${var.wp1_phpmyadmin_nodeport}"
#   }

#   set {
#       name = "appname"
#       value = "${var.wp1_app_name}"
#   }

#   set {
#       name = "nodePort"
#       value = "${var.wp1_nodeport}"
#   }

#   set {
#       name = "wordpress.endereco_web"
#       value = "${var.wp_lan_ip_address}"
#   }

#   set {
#       name = "storage.size"
#       value = "${var.wp1_storage_size}"
#   }

#   set {
#       name = "storage.path"
#       value = "${var.wp1_storage_path}"
#   }

#   set {
#       name = "database.name"
#       value = "${var.wp1_database_name}"
#   }

#   set {
#       name = "database.root_password"
#       value = base64encode("${var.database_root_password}")
#   }

#   set {
#       name = "database.host"
#       value = "${var.database_host_address}"
#   }

#   set {
#       name = "database.usuario"
#       value = "${var.wp1_user_db}"
#   }

#   set {
#       name = "database.usuario_senha"
#       value = "${var.wp1_user_password_db}"
#   }
# }

# #### CLIENT 2 ###

# resource helm_release "wordpress_2" {
#   name       = "${var.wp2_helm_name}"
#   chart      = "./helm/wordpress"
#   namespace  = "${var.namespace_2}"

#   set {
#       name = "phpmyadmin.nodeport"
#       value = "${var.wp2_phpmyadmin_nodeport}"
#   }

#   set {
#       name = "appname"
#       value = "${var.wp2_app_name}"
#   }

#   set {
#       name = "nodePort"
#       value = "${var.wp2_nodeport}"
#   }

#   set {
#       name = "wordpress.endereco_web"
#       value = "${var.wp_lan_ip_address}"
#   }

#   set {
#       name = "storage.size"
#       value = "${var.wp2_storage_size}"
#   }

#   set {
#       name = "storage.path"
#       value = "${var.wp2_storage_path}"
#   }

#   set {
#       name = "database.name"
#       value = "${var.wp2_database_name}"
#   }

#   set {
#       name = "database.root_password"
#       value = base64encode("${var.database_root_password}")
#   }

#   set {
#       name = "database.host"
#       value = "${var.database_host_address}"
#   }

#   set {
#       name = "database.usuario"
#       value = "${var.wp2_user_db}"
#   }

#   set {
#       name = "database.usuario_senha"
#       value = "${var.wp2_user_password_db}"
#   }
# }

#### CLIENT 3 ###

resource helm_release "wordpress_3" {
  name       = "${var.wp3_helm_name}"
  chart      = "./helm/wordpress"
  namespace  = "${var.namespace_3}"

  set {
      name = "phpmyadmin.nodeport"
      value = "${var.wp3_phpmyadmin_nodeport}"
  }

  set {
      name = "appname"
      value = "${var.wp3_app_name}"
  }

  set {
      name = "nodePort"
      value = "${var.wp3_nodeport}"
  }

  set {
      name = "wordpress.endereco_web"
      value = "${var.wp_lan_ip_address}"
  }

  set {
      name = "storage.size"
      value = "${var.wp3_storage_size}"
  }

  set {
      name = "storage.path"
      value = "${var.wp3_storage_path}"
  }

  set {
      name = "database.name"
      value = "${var.wp3_database_name}"
  }

  set {
      name = "database.root_password"
      value = base64encode("${var.database_root_password}")
  }

  set {
      name = "database.host"
      value = "${var.database_host_address}"
  }

  set {
      name = "database.usuario"
      value = "${var.wp3_user_db}"
  }

  set {
      name = "database.usuario_senha"
      value = "${var.wp3_user_password_db}"
  }

}