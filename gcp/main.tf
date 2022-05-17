module "ctf" {
  source = "./modules/ctf"

  project_id = var.project_id
  region     = var.region
  zone       = var.zone

  network_name    = "ctf-network"
  subnetwork_name = "ctf-subnetwork"

  ctfd_instance_name        = "ctfd"
  ctfd_instance_type        = "custom-6-8192"
  challenge_instance_name   = "challenge"
  challenge_instance_type   = "e2-medium"
  challenge_instances_count = 1

  ssh_username    = "heroctf"
  ssh_pubkey_path = "~/.ssh/gcp/id_rsa.pub"
}