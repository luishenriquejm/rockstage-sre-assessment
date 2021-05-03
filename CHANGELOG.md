
# What has been done?
* Configured MYSQL as Statefullset, so that, replicas can have their own state for future clusters
* Added a Init Container to wait a conection with MySQL in WordPress and PHPMyAdmin
* Created a custom helm charts of MySQL, PHPMyAdmin and WordPress
* Created a custom wordpress image with mysql_client and pushed to Dockerhub
* Created a custom Terraform script for local run
* Created a custom shell script of entrypoint.sh of WordPress
* Created PV, PVC and SC for containers MySQL and WordPress