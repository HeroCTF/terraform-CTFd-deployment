resource "linode_firewall" "dynamic_firewall" {
  label = "dynamic_firewall"
  tags  = ["ssh"]

  inbound {
    label    = "allow-ssh"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-docker-swarm"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "2377"
    ipv4     = ["0.0.0.0/0"] // change to FRP IPs
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-challenges"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "10000-10100"
    ipv4     = ["0.0.0.0/0"] // change to FRP IPs
    ipv6     = ["::/0"]
  }

  inbound_policy = "DROP"
  outbound_policy = "DROP"

  linodes = local.linode_ids
}