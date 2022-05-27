resource "linode_firewall" "static_firewall" {
  label = var.firewall_label
  tags  = ["all"]

  inbound {
    label    = "allow-all-inbound"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "1-65535"
    ipv4     = ["172.105.82.179/32"] // change to 0.0.0.0
    # ipv6     = ["::/0"]
  }

  outbound {
    label    = "allow-all-outbound"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "1-65535"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound_policy = "DROP"
  outbound_policy = "ACCEPT"

  linodes = local.linode_ids
}