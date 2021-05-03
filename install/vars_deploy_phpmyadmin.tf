### PHPMYADMIN ###

variable phpmyadmin_database_namespace {
  type        = string
  default     = "database"
  description = "Helm App Name"
}

variable phpmyadmin_helm_name {
  type        = string
  default     = "phpmyadmin"
  description = "Helm App Name"
}

variable phpmyadmin_app_name {
  type        = string
  default     = "phpmyadmin"
  description = "k8S App Name"
}

variable phpmyadmin_root_password {
  type        = string
  default     = "c2VjcmV0"
  description = "Root DB Password"
}

variable phpmyadmin_nodePort {
  type        = string
  default     = "30012"
  description = "NodePort"
}

variable phpmyadmin_database_host {
  type        = string
  default     = "wordpress-db-mysql.database.svc.cluster.local"
  description = "Complete FQDN"
}