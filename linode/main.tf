module "frp" {
  source = "./modules/frp"

  linode_count = 1
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

  linode_count = 1
  image        = "linode/debian11"
  region       = "eu-central"
  type         = "g6-dedicated-4"

  key       = "~/.ssh/ctf/id_rsa.pub"
  key_label = "ctf-dynamic"
  root_pass = var.root_pass

  label_prefix = "vm_dynamic"
}

module "static" {
  source = "./modules/static"

  linode_count = 0
  image        = "linode/debian11"
  region       = "eu-central"
  type         = "g6-dedicated-8"

  key       = "~/.ssh/ctf/id_rsa.pub"
  key_label = "ctf-static"
  root_pass = var.root_pass

  label_prefix = "vm_static"
}