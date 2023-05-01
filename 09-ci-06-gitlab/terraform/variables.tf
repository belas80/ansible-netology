variable "yandex_cloud_id" {
  default = "b1gmh5fl71a23gh6qrqc"
}

variable "yandex_folder_id" {
  default = "b1g9eq93ionckal26dpc"
}

variable "ubuntu_image_2204" {
  default = "fd8emvfmfoaordspe1jr"
}

variable "centos7_image" {
  default = "fd89dg08jjghmn88ut7p"
}

data "yandex_compute_image" "container-optimized-image" {
  family = "container-optimized-image"
}
