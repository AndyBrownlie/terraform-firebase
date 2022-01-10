output "project_id" {
  value       = module.firebase_project.firebase_project.project
  description = "The unqiue Firebase project Id assigned by Firebase"
}

output "project_name" {
  value       = module.firebase_project.firebase_project.display_name
  description = "The name given to the firebase project (based on project name & environment)"
}

output "project_number" {
  value       = module.firebase_project.firebase_project.project_number
  description = "The name given to the firebase project (based on project name & environment)"
}

/*
output "web_app_id" {
  value = module.firebase_web_app.firebase_web_app.app_id
}

output "web_app_name" {
  value = module.firebase_web_app.firebase_web_app.display_name
}
*/