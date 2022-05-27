resource "linode_firewall" "frp_firewall" {
  label = "frp_firewall"
  tags  = ["ssh", "socket-docker", "frp", "http", "https", "dns", "swarm", "challenges"]

  inbound {
    label    = "inbound-ssh"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "inbound-http"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "80"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "inbound-https"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "443"
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
    label    = "inbound-socket-docker"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "2376"
    ipv4     = ["194.195.240.112/32"] // change to CTFd IPs
    # ipv6     = ["::/0"]
  }

  inbound {
    label    = "inbound-docker-swarm"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "2377"
    ipv4     = ["0.0.0.0/0"] // to remove after deploy
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "inbound-frps"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "7000"
    ipv4     = ["194.195.240.112/32"] // change to CTFd IPs
    # ipv6     = ["::/0"]
  }

  inbound {
    label    = "inbound-frpc"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "7400"
    ipv4     = ["194.195.240.112/32"] // change to CTFd IPs
    # ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-challenges"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "10000-10100"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound_policy = "DROP"
  outbound_policy = "DROP"

  linodes = local.linode_ids
}