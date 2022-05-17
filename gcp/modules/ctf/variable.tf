variable "project_id" {
  description = "ID of the GCP project."
}

variable "region" {
  description = "Name of the geographical region to deploy instances."
}

variable "zone" {
  description = "Name of the geographical zone to deploy instances."
}

variable "network_name" {
  description = "Name of the network this set of firewall rules applies to."
}

variable "subnetwork_name" {
  description = "Name of the sub-network this set of firewall rules applies to."
}

variable "ip_cidr_range" {
  description = "CIDR range for the subnetwork."
  default     = "10.1.0.0/16"
}

variable "ctfd_instance_name" {
  description = "Name of the CTFd instance."
}

variable "ctfd_instance_type" {
  description = "Machine type of the CTFd instance."
}

variable "challenge_instance_name" {
  description = "Prefix name of Challenge instances."
}

variable "challenge_instance_type" {
  description = "Machine type of Challenge instances."
}

variable "challenge_instances_count" {
  description = "Number of Challenge instances."
}

variable "ssh_username" {
  description = "Name of SSH user to connect to."
}

variable "ssh_pubkey_path" {
  description = "Path to the SSH public key."
}