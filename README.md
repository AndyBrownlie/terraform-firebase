# terraform-firebase
A single Terraform module that allows you to build out the following Firebase components:
* Firebase project
* Firebase web app

and provides you with a formatted typescript environment file to use for Firebase intialisation in your javascript/typescript webapp.
## Quick Start

Create an infrastructure folder with a terraform (.tf) file, pasting the following code):
```
module "firebase" {
    source = "github.com/AndyBrownlie/terraform-firebase"

    org_id                      = <your GCP registered organisation ID> 
    project_name                = <project name>
    region                      = <region> 
    service_account_user        = <service account with Firebase creator privileges>
    firebase_admin_users        = [<array of user email addresses to be granted Firebase admin rights>, <..>]
    firebase_config_file_path   = <path/and/filename of generated Firebase options initialisation file>
    env                         = <environment this infrastructure is for. Options are dev, test, stage or prod>
}
```
Run:
```
>terraform init
>terraform validate
>teraform plan
>terraform apply
```


## More Info...


Terraform User is the google user account used to authenticate with GCP and Firebase. To ensure you are already logged in using this google account as your GOOGLE_DEFAULT_CREDENTIALS, ensure you have run the following command

```
gcloud auth application-default login
```
## Install Pre-requisites
* gcloud CLI
* Firebase CLI
* Terraform

## Pre-requisites

1. Organisation exists
2. Terraform admin GCP project exists in organisation
3. Terraform admin service account exists on the Terraform admin GCP project, but also added to the organisation IAM.
4. Terraform User has been granted Service Account Token Creator role on the afore-mentioned Service Account IAM Binding   

## What This Set of Terraform Scripts Does
* creates both a GCP & Firebase project
* assigns Firebase Admin permissions to Terraform User
* creates a Firebase web app in the Firebase project
* creates a Firebase web app config
* creates a environment configuration file for js/ts Firebase app initialisation


## Linking Firebase Web App to Firebase Hosting

[You only need to link web app to Firebase hosting](https://stackoverflow.com/questions/64409754/what-benefit-does-linking-firebase-web-app-to-firebase-hosting-site-brings) if you are using Firebase libraries direct from script, and not loaded via app package managers (eg NPM or yarn).