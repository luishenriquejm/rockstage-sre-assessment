# How to

## Pre Requisites

* Install Minikube
* Install Terraform inside machine of minikube
* Install Helm V3 inside machine of minikube

```console
minikube start
```

## Edit Vars

* Edit variables of files before first use:

```console
vars_deploy_database.tf
vars_deploy_wordpress.tf
vars_deploy_phpmyadmin.tf
```

## Deploy with terraform

```console
terraform init
terraform apply
```