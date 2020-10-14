variable "service_account_secret" {}

variable "gcp_project_id" {}

variable "resources_region" {
    default = "us-central1"
}

variable "resources_zone" {
    default = "us-central1-c"
}

variable "vm_name" {
    default = "simple-vm"
}

variable "vm_size" {
    default = "f1-micro"
}

variable "vm_image" {
    default = "debian-cloud/debian-9"
}