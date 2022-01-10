resource "google_app_engine_application" "db" {
  project       = var.firebase_project_id
  location_id   = var.location
  database_type = local.firestore_db_type
  provider      = google-beta
}

resource "google_project_service" "enable-apis" {
  project  = var.firebase_project_id
  service  = "firestore.googleapis.com"
  provider = google-beta
  timeouts {
    create = local.timeout_create
    update = local.timeout_update
  }

  disable_dependent_services = true
}

resource "google_project_iam_member" "firestore_admin" {
  project  = var.firebase_project_id
  role     = local.firestore_admin_role
  for_each = toset(var.firestore_admin_users)
  member   = "user:${each.value}"
}

resource "google_project_iam_member" "firestore_owner" {
  project  = var.firebase_project_id
  role     = local.firestore_dev_admin_role
  for_each = toset(var.firestore_admin_users)
  member   = "user:${each.value}"
}