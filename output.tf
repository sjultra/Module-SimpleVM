output "vm_external_ip" {
    value = google_compute_address.ip_address.address
}