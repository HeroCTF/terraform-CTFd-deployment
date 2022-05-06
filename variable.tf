variable "project_id" {
  default     = "938412492616"
  description = "ID of the GCP project."
}

variable "region" {
  default     = "europe-west1"
  description = "Name of the geographical region to deploy instances."
}

variable "zone" {
  default     = "europe-west1-b"
  description = "Name of the geographical zone to deploy instances."
}

variable "network_name" {
  default     = "ctf-network"
  description = "Name of the network this set of firewall rules applies to."
}

variable "subnetwork_name" {
  default     = "ctf-subnetwork"
  description = "Name of the sub-network this set of firewall rules applies to."
}

variable "ctfd_instance_name" {
  default     = "ctfd"
  description = "Name of the CTFd instance."
}

variable "ctfd_instance_type" {
  default     = "custom-6-8192"
  description = "Machine type of the CTFd instance."
}

variable "challenge_instance_name" {
  default     = "challenge"
  description = "Prefix name of Challenge instances."
}

variable "challenge_instance_type" {
  default     = "e2-medium"
  description = "Machine type of Challenge instances."
}

variable "ssh_username" {
  default     = "heroctf"
  description = "Name of SSH user to connect to."
}

variable "ssh_pubkey_path" {
  default     = "~/.ssh/gcp/id_rsa.pub"
  description = "Path to the SSH public key."
}