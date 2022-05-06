resource "google_compute_instance" "ctfd_instance" {
  name         = var.ctfd_instance_name
  machine_type = var.ctfd_instance_type
  zone         = var.zone
  tags         = ["ssh", "ctfd", "swarm"]

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
  count = var.challenge_instances_count

  name         = "${var.challenge_instance_name}-${count.index}"
  machine_type = var.challenge_instance_type
  zone         = var.zone
  tags         = ["ssh", "challenge", "swarm"]

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