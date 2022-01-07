resource "google_app_engine_application" "db" {
  project     = var.firebase_project_id
  location_id = var.location
}