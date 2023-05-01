output "external_ip_runner" {
  value = yandex_compute_instance.instance-runner.network_interface.0.nat_ip_address
}

