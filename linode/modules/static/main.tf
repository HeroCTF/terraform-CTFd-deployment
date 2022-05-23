terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.27.1"
    }
  }
}

locals {
    linode_ids = linode_instance.linode_ctf[*].id
}

resource "linode_sshkey" "ctf_key" {
    label = var.key_label
    ssh_key = chomp(file(var.key))
}

resource "linode_instance" "linode_ctf" {
    count = var.linode_count
    image = var.image
    label = "${var.label_prefix}_${count.index}"
    region = var.region
    type = var.type
    authorized_keys = [ linode_sshkey.ctf_key.ssh_key ]
    root_pass = var.root_pass
}