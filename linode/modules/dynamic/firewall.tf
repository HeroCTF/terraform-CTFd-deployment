resource "linode_firewall" "dynamic_firewall" {
  label = "dynamic_firewall"
  tags  = ["all"]

  inbound {
    label    = "allow-all-inbound"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "1-65535"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  outbound {
    label    = "allow-all-outbound"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "1-65535"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound_policy = "ACCEPT"
  outbound_policy = "ACCEPT"

  linodes = local.linode_ids
}