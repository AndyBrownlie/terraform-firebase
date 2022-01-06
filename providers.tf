provider "google" {
  alias   = "tokengen"
  region      = var.region
}

data "google_service_account_access_token" "sa" {
  provider                = google.tokengen
  target_service_account  = var.service_account_user
  lifetime                = local.lifetime
  scopes                  = local.service_account_scopes
}

provider "google-beta" {
  access_token = data.google_service_account_access_token.sa.access_token
  region      = var.region 
}