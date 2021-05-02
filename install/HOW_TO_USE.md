# How to

## Pre Requisites

* Install Minikube
* Install Terraform inside machine of minikube

```console
minikube start
```

## Edit Vars

* Edit variables of files:

```console
vars_deploy_database.tf
vars_deploy_wordpress.tf
```

## Deploy with terraform

```console
terraform init
terraform apply
```