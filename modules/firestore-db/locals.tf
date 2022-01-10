locals {
  firestore_db_type        = "CLOUD_FIRESTORE"
  firestore_api            = "firestore.googleapis.com"
  timeout_create           = "30m"
  timeout_update           = "40m"
  firestore_admin_role     = "roles/appengine.appAdmin"
  firestore_dev_admin_role = "roles/firebase.developAdmin"
}
