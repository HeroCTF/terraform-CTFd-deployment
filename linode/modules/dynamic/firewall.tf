resource "linode_firewall" "dynamic_firewall" {
  label = "dynamic_firewall"
  tags  = ["ssh", "http", "https", "dns"]

  inbound {
    label    = "inbound-ssh"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  outbound {
    label    = "outbound-http"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "80"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  outbound {
    label    = "outbound-https"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "443"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  outbound {
    label    = "outbound-dns"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "53"
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