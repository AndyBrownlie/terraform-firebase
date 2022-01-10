resource "google_app_engine_application" "db" {
  project       = var.firebase_project_id
  location_id   = var.location
  database_type = "CLOUD_FIRESTORE" 
  provider     = google-beta
}

resource "google_project_service" "enable-apis" {
  project = var.firebase_project_id
  service = "firestore.googleapis.com"
provider     = google-beta
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}