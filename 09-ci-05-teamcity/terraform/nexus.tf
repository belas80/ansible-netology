resource "yandex_compute_instance" "instance-nexus" {
  name        = "nexus"
  zone        = "ru-central1-b"
  hostname    = "nexus"
  platform_id = "standard-v3"
  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = var.centos7_image
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
#    user-data                    = file("${path.module}/cloud_config.yaml")
    ssh-keys                     = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}
