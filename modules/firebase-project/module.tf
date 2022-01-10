

resource "random_id" "id" {
  byte_length = local.byte_length
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
