provider "google" {
  region      = var.resources_region
  zone        = var.resources_zone
}

resource "google_compute_network" "vpc" {
  name                    = "${var.id}-network"
  auto_create_subnetworks = "true"
}

resource "google_compute_address" "ip_address" {
  name = "${var.id}-vm-ip"
}

resource "google_compute_instance" "vm" {
  name         = "${var.id}-${var.vm_name}"
  machine_type = var.vm_size

  boot_disk {
    initialize_params {
      image = var.vm_image
    }
  }

  network_interface {
    network = google_compute_network.vpc.self_link

    access_config {
      nat_ip = google_compute_address.ip_address.address
    }
  }
}


