resource "google_compute_subnetwork" "ctf_subnetwork" {
  name          = var.subnetwork_name
  ip_cidr_range = "10.1.0.0/16"
  region        = var.region
  network       = google_compute_network.ctf_network.id
}

resource "google_compute_network" "ctf_network" {
  name                    = var.network_name
  project                 = var.project_id
  auto_create_subnetworks = false
}

