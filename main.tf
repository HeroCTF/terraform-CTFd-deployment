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

resource "google_compute_firewall" "ssh" {
  name    = "${var.network_name}-allow-ssh"
  project = var.project_id
  network = var.network_name

  allow {
    ports    = ["22"]
    protocol = "tcp"
  }

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]

  depends_on = [
    google_compute_network.ctf_network,
  ]
}

resource "google_compute_firewall" "web" {
  name    = "${var.network_name}-allow-http-https"
  project = var.project_id
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ctfd"]

  depends_on = [
    google_compute_network.ctf_network,
  ]
}

resource "google_compute_firewall" "challenge" {
  name    = "${var.network_name}-allow-challenge"
  project = var.project_id
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["10000-10100"]
  }

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["challenge"]

  depends_on = [
    google_compute_network.ctf_network,
  ]
}

resource "google_compute_instance" "ctfd_instance" {
  name         = var.ctfd_instance_name
  machine_type = var.ctfd_instance_type
  zone         = var.zone
  tags         = ["ssh", "ctfd"]

  metadata = {
    ssh-keys = "${var.ssh_username}:${file(var.ssh_pubkey_path)}"
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 256
    }
  }

  network_interface {
    network            = var.network_name
    subnetwork         = var.subnetwork_name
    subnetwork_project = var.project_id

    access_config {

    }
  }

  depends_on = [
    google_compute_subnetwork.ctf_subnetwork,
  ]
}

resource "google_compute_instance" "challenge_instance" {
  count = 1

  name         = "${var.challenge_instance_name}-${count.index}"
  machine_type = var.challenge_instance_type
  zone         = var.zone
  tags         = ["ssh", "challenge"]

  metadata = {
    ssh-keys = "${var.ssh_username}:${file(var.ssh_pubkey_path)}"
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 256
    }
  }

  network_interface {
    network            = var.network_name
    subnetwork         = var.subnetwork_name
    subnetwork_project = var.project_id

    access_config {

    }
  }

  depends_on = [
    google_compute_subnetwork.ctf_subnetwork,
  ]
}