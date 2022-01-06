# terraform-thunk-firebase

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
2. Terraform Admin project exists in organisation
3. Terraform Admin service account exists on the project, but also added to the organisation IAM.
4. Terraform User has been granted Service Account Token Creator role on the afore-mentioned Service Account IAM Binding   

## What You Can Do With This Terraform Set of Scripts
* create a google & firebase project
* assign Firebase Admin permissions to Terraform User

##Environment Config
Workspaces are for different envs. To specify new workspace:

``` terraform workspace new <workspace-name>```

To switch workspaces:
```terraform workspace switch <workspace-name>```

To see all workspaces:
```terraform workspace list```


[You do NOT need to link web app to Firebase hosting](https://stackoverflow.com/questions/64409754/what-benefit-does-linking-firebase-web-app-to-firebase-hosting-site-brings) if you are using Firebase libraries from app package managers (eg NPM or yarn)