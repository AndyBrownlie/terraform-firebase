output "firestore_db" {
  value       = google_app_engine_application.db
  description = "The Google App Engine resource (Firestore db) created"
}