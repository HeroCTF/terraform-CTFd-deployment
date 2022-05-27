variable "key" {
  description = "Public SSH Key's path."
}

variable "key_label" {
  description = "New SSH key label."
}

variable "linode_count" {
  description = "The number of Linode instances to deploy."
  type = number
  default = 1
}

variable "image" {
  description = "Image to use for Linode instance."
}

variable "label_prefix" {
  description = "The Linode's label is for display purposes only, but must be unique."
}

variable "region" {
  description = "The region where your Linode will be located."
  default = "eu-central"
}

variable "type" {
  description = "Linodes machine type"
}

variable "root_pass" {
  description = "Your Linode's root user's password."
}
