variable "firebase_project_id" {
  description = "The unique project ID assigned by GCP when creating the project"
  type        = string
}

variable "location" {
  description = "The default location for app engine dependent services the project (such as Firestore) & storage"
  type        = string
}