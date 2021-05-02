
# What has been done?

* Configured MYSQL Statefullset so that replicas can have their own state for future clusters
* Added Init Container to wait for conection with MySQL
* Created a custom charts of MySQL and WordPress
* Created a custom wordpress image with mysql_client
* Created custom Terraform script for local run