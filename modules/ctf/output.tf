output "ctfd-ip-address" {
  value = google_compute_instance.ctfd_instance.network_interface.0.access_config.0.nat_ip
}

output "challenge-ip-addresses" {
  value = join(",", google_compute_instance.challenge_instance[*].network_interface.0.access_config.0.nat_ip)
}