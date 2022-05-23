module "dynamic" {
  source = "./modules/dynamic"

  linode_count = 7
  image        = "linode/debian11"
  region       = "eu-central"
  type         = "g6-dedicated-8"

  key       = "~/.ssh/ctf/id_rsa.pub"
  key_label = "ctf-dynamic"
  root_pass = var.root_pass

  label_prefix = "vm_dynamic"
}

module "static" {
  source = "./modules/static"

  linode_count = 3
  image        = "linode/debian11"
  region       = "eu-central"
  type         = "g6-dedicated-8"

  key       = "~/.ssh/ctf/id_rsa.pub"
  key_label = "ctf-static"
  root_pass = var.root_pass

  label_prefix = "vm_static"
}