variable "firebase_project_id" {
  description = "The unique project ID assigned by GCP when creating the project"
  type        = string
}

variable "project_name" {
  description = "The project name as per the project naming conventions, <productname>-<environment>"
  type        = string
}

variable "firebase_config_file_path" {
  description = "The relative path & file name for the generated Firebase config"
  type        = string
}