module "dynamic" {
  source = "./modules/dynamic"

  linode_count = 1
  image        = "linode/debian11"
  region       = "eu-central"
  type         = "g6-dedicated-8"

  key       = "~/.ssh/ctf/id_rsa.pub"
  key_label = "ctf-pubkey"
  root_pass = var.root_pass

  label_prefix = "vm_challenge"
}