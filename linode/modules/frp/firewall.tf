resource "linode_firewall" "frp_firewall" {
  label = "frp_firewall"
  tags  = ["ssh", "socket-docker", "frpc"]

  inbound {
    label    = "allow-ssh"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-socket-docker"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "2376"
    ipv4     = ["35.205.173.230/32"] // change to CTFd IPs
    # ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-frpc"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "7400"
    ipv4     = ["35.205.173.230/32"] // change to CTFd IPs
    # ipv6     = ["::/0"]
  }

  inbound_policy = "DROP"
  outbound_policy = "DROP"

  linodes = local.linode_ids
}