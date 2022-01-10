#terraform {
# terraform init -backend-config="./backend.hcl"
#  backend "gcs" {}
#}

module "firebase_project" {
  source = "./modules/firebase-project"

  org_id               = var.org_id
  project_name         = local.project_env_name
  firebase_admin_users = var.firebase_admin_users
}
/*
module "firebase_web_app" {
  source = "./modules/firebase-web-app"

  firebase_project_id       = module.firebase_project.firebase_project.project
  project_name              = local.project_env_name
  firebase_config_file_path = var.firebase_config_file_path
}
*/
module "firestore_db" {
  source = "./modules/firestore-db"

  firebase_project_id = module.firebase_project.firebase_project.project
  location            = var.default_location
}
