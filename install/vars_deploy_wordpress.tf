
### WORDPRESS DEPLOYMENT ###

                 # ATTENTION HERE #
####################################################################
####################################################################
variable wp_lan_ip_address {
  type        = string
  default     = "192.168.15.18"
  description = "Put here the LAN IP Address (localhost/127.0.0.1 if run locally) of the server for correctly work, if incorrectly, that's needed to change directly in database"
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
  description = "App PersistentVolume and StorageClass size"
}

variable wp1_storage_path {
  type        = string
  default     = "/kubernetes/pv/wordpress/"
  description = "PersistentVolume mountpath"
}

variable wp1_storage_classname {
  type        = string
  default     = "wp-frontend-sc"
  description = "App StorageClass"
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

variable wp1_user_password_db {
  type        = string
  default     = "secret"
  description = "Password of User DB"
}

### CLIENT 2 ###

variable wp2_phpmyadmin_nodeport {
  type        = string
  default     = "30022"
  description = "PHPmyadmin NodePort"
}

variable wp2_helm_name {
  type        = string
  default     = "wp-frontend2"
  description = "Helm App Name"
}

variable wp2_app_name {
  type        = string
  default     = "wp-frontend"
  description = "k8S App Name"
}

variable wp2_nodeport {
  type        = string
  default     = "30021"
  description = "NodePort of App"
}

variable wp2_storage_size {
  type        = string
  default     = "20Gi"
  description = "App PersistentVolume and StorageClass size"
}

variable wp2_storage_path {
  type        = string
  default     = "/kubernetes/pv/wordpress_2/"
  description = "App PersistentVolume mountpath"
}

variable wp2_storage_classname {
  type        = string
  default     = "wp2-frontend-sc"
  description = "App StorageClass"
}

variable wp2_database_name {
  type        = string
  default     = "WPCLIENTE2"
  description = "Database Name"
}

variable wp2_user_db {
  type        = string
  default     = "cliente2"
  description = "User of DB"
}

variable wp2_user_password_db {
  type        = string
  default     = "secret"
  description = "Password of User DB"
}


### CLIENT 3 ###

variable wp3_phpmyadmin_nodeport {
  type        = string
  default     = "30032"
  description = "PHPmyadmin NodePort"
}

variable wp3_helm_name {
  type        = string
  default     = "wp-frontend3"
  description = "Helm App Name"
}

variable wp3_app_name {
  type        = string
  default     = "wp-frontend"
  description = "k8S App Name"
}

variable wp3_nodeport {
  type        = string
  default     = "30031"
  description = "NodePort of App"
}

variable wp3_storage_size {
  type        = string
  default     = "20Gi"
  description = "App PersistentVolume and StorageClass size"
}

variable wp3_storage_path {
  type        = string
  default     = "/kubernetes/pv/wordpress_3/"
  description = "Database PersistentVolume mountpath"
}

variable wp3_storage_classname {
  type        = string
  default     = "wp3-frontend-sc"
  description = "App StorageClass"
}

variable wp3_database_name {
  type        = string
  default     = "WPCLIENTE3"
  description = "Database Name"
}

variable wp3_user_db {
  type        = string
  default     = "cliente3"
  description = "User of DB"
}

variable wp3_user_password_db {
  type        = string
  default     = "secret"
  description = "Password of User DB"
}