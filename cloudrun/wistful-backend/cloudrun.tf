resource "google_cloud_run_service" "default" {
  name     = "${var.project_id}-${var.name}-srv"
  location = var.region

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}