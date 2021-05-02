### MYSQL DATABASE ###

variable database_namespace {
  type        = string
  default     = "database"
  description = "Name of Namespace *** ATTENTION *** If you change the default database you need tho change here too"
}

variable database_host_address {
  type        = string
  default     = "wordpress-db-mysql.database.svc.cluster.local"
  description = "nameofservice.namespace.type.domain *** ATTENTION *** If you change the default database you need tho change here too"
}

variable database_helm_name {
  type        = string
  default     = "wp-database"
  description = "Helm App Name"
}


variable database_app_name {
  type        = string
  default     = "wordpress-db-mysql"
  description = "k8S App Name"
}

variable database_storage_size {
  type        = string
  default     = "20Gi"
  description = "Database PersistentVolume and StorageClass size"
}

variable database_storage_path {
  type        = string
  default     = "/kubernetes/pv/db/mysql_cliente/"
  description = "Database PersistentVolume mountpath"
}

variable database_name {
  type        = string
  default     = "WPCLIENTE1"
  description = "Database Name"
}

variable database_root_password {
  type        = string
  default     = "secret"
  description = "Database Name"
}

