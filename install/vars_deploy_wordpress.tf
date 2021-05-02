
### WORDPRESS DEPLOYMENT ###

                 # ATTENTION HERE #
####################################################################
####################################################################
variable wp_lan_ip_address {
  type        = string
  default     = "192.168.15.18"
  description = "
                   Attention: 
  Put here the LAN IP Address (localhost/127.0.0.1 if run locally) 
  of the server for correctly work, 
  if incorrectly, that's needed to change directly in database"
}
####################################################################
####################################################################

### NAMESPACES ###

variable namespace_1 {
  type        = string
  default     = "cliente1"
  description = "Name of Namespace"
}

variable namespace_2 {
  type        = string
  default     = "cliente2"
  description = "Name of Namespace"
}

variable namespace_3 {
  type        = string
  default     = "cliente3"
  description = "Name of Namespace"
}

### DATABASE APP



### CLIENT 1 ###




variable wp1_phpmyadmin_nodeport {
  type        = string
  default     = "30012"
  description = "PHPmyadmin NodePort"
}

variable wp1_helm_name {
  type        = string
  default     = "wp-frontend"
  description = "Helm App Name"
}

variable wp1_app_name {
  type        = string
  default     = "wp-frontend"
  description = "k8S App Name"
}

variable wp1_nodeport {
  type        = string
  default     = "30011"
  description = "NodePort of App"
}

variable wp1_storage_size {
  type        = string
  default     = "20Gi"
  description = "Database PersistentVolume and StorageClass size"
}

variable wp1_storage_path {
  type        = string
  default     = "/kubernetes/pv/db/wordpress/"
  description = "Database PersistentVolume mountpath"
}

variable wp1_database_name {
  type        = string
  default     = "WPCLIENTE1"
  description = "Database Name"
}

variable wp1_user_db {
  type        = string
  default     = "cliente1"
  description = "User of DB"
}

variable wp1_user_db {
  type        = string
  default     = "secret"
  description = "Password of User DB"
}