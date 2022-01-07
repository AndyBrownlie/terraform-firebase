variable "org_id" {
  description = "The ID assigned by GCP when registering your organisation?"
  type        = string
  # In GCP, go to IAM and Admin | Settings
}

variable "project_name" {
  description = "The name of the project?"
  type        = string
}

variable "env" {
  description = "The environment (dev, test, stage, prod)?"
  type        = string
  validation {
    condition     = contains(["dev", "test", "stage", "prod"], var.env)
    error_message = "Valid values for var: env are (dev, test, stage, prod)."
  }
}

variable "default_location" {
  description = "The default location for app engine dependent services the project (such as Firestore) & storage"
  type        = string
}

variable "region" {
  description = "The region that the project will be created in. (This should be region format, e.g. europe-west2)"
  type        = string
}

variable "firebase_admin_users" {
  description = "The comma separated list (array) of google email addresses of users to be assigned as IAM admins for this Firebase project"
  type        = list(string)
}

variable "service_account_user" {
  description = "The google email address of the service account (e.g. <service-account-name>@<admin-project>.iam.gserviceaccount.com) to be assigned an access token for project creation API calls"
  type        = string
}

variable "firebase_config_file_path" {
  description = "The relative path & file name for the generated Firebase config"
  type        = string
}