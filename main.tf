provider "google" {
  credentials = var.service_account_secret
  project     = var.gcp_project_id
  region      = var.resources_region
  zone        = var.resources_zone
}

resource "google_compute_network" "vpc" {
  name                    = "network"
  auto_create_subnetworks = "true"
}

resource "google_compute_address" "ip_address" {
  name = "vm-ip"
}

resource "google_compute_instance" "vm" {
  name         = var.vm_name
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


