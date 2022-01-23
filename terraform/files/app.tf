resource "yandex_compute_instance" "app" {
  name = "reddit-app-${count.index + 1}"
  labels = {
    tags = "reddit-app"
  }
  hostname    = "reddir-app"
  count       = var.instance_count
  platform_id = var.platform_id

  resources {
    cores         = 2
    core_fraction = 20
    memory        = 2
  }

  scheduling_policy {
    preemptible = var.preemptible
  }

  boot_disk {
    initialize_params {
      image_id = var.app_disk_image
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.app-subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  #  connection {
  #    type        = "ssh"
  #    host        = self.network_interface.0.nat_ip_address
  #    user        = "ubuntu"
  #    agent       = false
  #    private_key = file(var.private_key_path)
  #  }
}
