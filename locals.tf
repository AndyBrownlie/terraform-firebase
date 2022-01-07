locals {
  service_account_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  lifetime               = "600s"

  project_env_name = "${var.project_name}-${var.env}"
}