module "frp" {
  source = "./modules/frp"

  linode_count = 0
  image        = "linode/debian11"
  region       = "eu-central"
  type         = "g6-dedicated-4"

  key       = "~/.ssh/ctf/id_rsa.pub"
  key_label = "ctf-frp"
  root_pass = var.root_pass

  label_prefix = "vm_frp"
}

module "dynamic" {
  source = "./modules/dynamic"

  linode_count = 0
  image        = "linode/debian11"
  region       = "eu-central"
  type         = "g6-dedicated-4"

  key       = "~/.ssh/ctf/id_rsa.pub"
  key_label = "ctf-dynamic"
  root_pass = var.root_pass

  label_prefix = "vm_dynamic"
}

module "bastion" {
  source = "./modules/bastion"

  linode_count = 1
  image        = "linode/debian11"
  region       = "eu-central"
  type         = "g6-dedicated-2"

  key       = "~/.ssh/ctf/bastion.pub"
  key_label = "ctf-bastion"
  root_pass = var.root_pass

  label_prefix = "bastion"
}

module "static_crypto_pwn_prog_rev" {
  source = "./modules/static"

  linode_count = 4
  image        = "linode/debian11"
  region       = "eu-central"
  type         = "g6-dedicated-4"

  firewall_label = "fw_tcp"

  key       = "~/.ssh/ctf/id_rsa.pub"
  key_label = "ctf-static_crypto_pwn_prog"
  root_pass = var.root_pass

  label_prefix = "vm_static_4"
}

module "static_web" {
  source = "./modules/static"

  linode_count = 1
  image        = "linode/debian11"
  region       = "eu-central"
  type         = "g6-dedicated-8"

  firewall_label = "fw_web"

  key       = "~/.ssh/ctf/id_rsa.pub"
  key_label = "ctf-static_web_sys"
  root_pass = var.root_pass

  label_prefix = "vm_static_8"
}