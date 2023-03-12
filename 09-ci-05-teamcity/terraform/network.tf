# Network
resource "yandex_vpc_network" "lab-net" {
  name = "lab-network"
}

# Subnet b
resource "yandex_vpc_subnet" "subnet-b" {
  v4_cidr_blocks = ["192.168.11.0/24"]
  zone           = "ru-central1-b"
  name           = "subnet-b"
  network_id     = yandex_vpc_network.lab-net.id
}
