variable "firebase_project_id" {
  description = "The unique project ID assigned by GCP when creating the project"
  type        = string
}

variable "location" {
  description = "The default location for app engine dependent services the project (such as Firestore) & storage"
  type        = string
}

variable "firestore_admin_users" {
  description = "The comma separated list (array) of google email addresses of users to be assigned as IAM admins for Firestore development"
  type        = list(string)
}
