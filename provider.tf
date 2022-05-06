provider "google" {
  credentials = file("accounts.json")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

