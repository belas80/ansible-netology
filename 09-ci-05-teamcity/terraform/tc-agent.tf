resource "yandex_compute_instance" "instance-tc-agent" {
  name        = "tc-agent"
  zone        = "ru-central1-b"
  hostname    = "tc-agent"
  platform_id = "standard-v3"

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.container-optimized-image.id
      #      size = 30
      type = "network-ssd"
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-b.id
    nat       = true
  }
  resources {
    cores  = 2
    memory = 4
  }
  metadata = {
    docker-container-declaration = file("${path.module}/declaration-agent.yaml")
    user-data                    = file("${path.module}/cloud_config.yaml")
    ssh-keys                     = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}
