resource "google_firebase_web_app" "basic" {
    provider = google-beta
    project = var.firebase_project_id
    display_name = "${var.project_name}-web-app"
}

data "google_firebase_web_app_config" "basic" {
  provider   = google-beta
  project = var.firebase_project_id
  web_app_id = google_firebase_web_app.basic.app_id
}

data "template_file" "firebase_config" {
  template  = "${file("templates/firebase-config.tpl")}"
  vars      =  {
    app_id              = google_firebase_web_app.basic.app_id
    api_key             = data.google_firebase_web_app_config.basic.api_key
    auth_domain         = data.google_firebase_web_app_config.basic.auth_domain
    database_url        = lookup(data.google_firebase_web_app_config.basic, "database_url", "")
    project_id          = var.firebase_project_id
    storage_bucket      = lookup(data.google_firebase_web_app_config.basic, "storage_bucket", "")
    messaging_sender_id = lookup(data.google_firebase_web_app_config.basic, "messaging_sender_id", "")
    measurement_id      = lookup(data.google_firebase_web_app_config.basic, "measurement_id", "")
  }
}

resource "local_file" "firebase_config" {
    content = "${data.template_file.firebase_config.rendered}"
    filename = var.firebase_config_file_path
    depends_on = [
      data.google_firebase_web_app_config.basic,
      data.template_file.firebase_config
    ]
}