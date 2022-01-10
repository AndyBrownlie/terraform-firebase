
locals {
  firebase_admin_role = "roles/firebase.admin"
  firestore_owner_role = "roles/datastore.owner"
  firestore_user_role ="roles/datastore.user"
  firestore_admin_role = "roles/appengine.appAdmin"
}

resource "random_id" "id" {
  byte_length = 4
  prefix      = "${var.project_name}-"
}

resource "google_project" "project" {
  provider   = google-beta
  project_id = random_id.id.hex
  name       = var.project_name
  org_id     = var.org_id
}

resource "google_firebase_project" "project" {
  provider = google-beta
  project  = google_project.project.project_id
}

resource "google_project_iam_member" "firebase_admin" {
  project  = google_project.project.project_id
  role     = local.firebase_admin_role
  for_each = toset(var.firebase_admin_users)
  member   = "user:${each.value}"
}

resource "google_project_iam_member" "firestore_admin" {
  project  = google_project.project.project_id
  role     = local.firestore_admin_role
  for_each = toset(var.firebase_admin_users)
  member   = "user:${each.value}"
}

/*
resource "google_project_iam_member" "firestore_owner" {
  project  = google_project.project.project_id
  role     = local.firestore_owner_role
  for_each = toset(var.firebase_admin_users)
  member   = "user:${each.value}"
}

resource "google_project_iam_member" "firestore_user" {
  project  = google_project.project.project_id
  role     = local.firestore_user_role
  for_each = toset(var.firebase_admin_users)
  member   = "user:${each.value}"
}
*/

resource "google_project_iam_member" "firestore_owner" {
  project  = google_project.project.project_id
  role     = "roles/firebase.developAdmin"
  for_each = toset(var.firebase_admin_users)
  member   = "user:${each.value}"
}