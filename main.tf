terraform {
 required_providers {
   yandex = {
     source = "yandex-cloud/yandex"
   }
 }
 required_version = ">= 0.13"
}

provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = var.yc_zone
}

#VM
resource "yandex_compute_instance" "redmine" {
  boot_disk {
    initialize_params {
      image_id = "fd8k1jln53802oe7gbu6"
    }
  }
  network_interface {
    subnet_id = "${yandex_vpc_subnet.subnet-b.id}"
    nat = true
  }
  resources {
    cores = 2
    memory = 2
  }
  metadata = {
    user-data = file("${path.module}/cloud_config.yaml")
  }
}
