output "external_ip_server" {
  value = yandex_compute_instance.instance-tc-server.network_interface.0.nat_ip_address
}

output "external_ip_agent" {
  value = yandex_compute_instance.instance-tc-agent.network_interface.0.nat_ip_address
}

output "external_ip_nexus" {
  value = yandex_compute_instance.instance-nexus.network_interface.0.nat_ip_address
}
