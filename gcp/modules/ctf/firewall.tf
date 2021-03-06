resource "google_compute_firewall" "firewall_ssh" {
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

resource "google_compute_firewall" "firewall_web" {
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

resource "google_compute_firewall" "firewall_netcat" {
  name    = "${var.network_name}-allow-netcat"
  project = var.project_id
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["10000-10100"]
  }

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["netcat"]

  depends_on = [
    google_compute_network.ctf_network,
  ]
}

resource "google_compute_firewall" "firewall_internal" {
  name    = "${var.network_name}-allow-internal"
  project = var.project_id
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["1-65535"]
  }

  direction     = "INGRESS"
  source_ranges = [var.ip_cidr_range]
  target_tags   = ["internal"]

  depends_on = [
    google_compute_network.ctf_network,
  ]
}

