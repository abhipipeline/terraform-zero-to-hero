provider "google" {
  region = "us-central1"
}
# NETWORKING
resource "google_compute_network" "vpc" {
  name = "custom_vpc"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "sub1" {
  name = "subnetwork1"
  ip_cidr_range = "10.0.1.0/24"
  region = "us-central1"
  network = google_compute_network.custom_vpc.id
}


# VM INSTANCE
resource "google_compute_instance" "default" {
  name         = "my-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  tags = ["VM-INSTANCE"]

  boot_disk {
    initialize_params {
      image = "debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.sub1.id

    access_config {
      // Ephemeral public IP
    }
  }

  

  metadata_startup_script = "echo hi > /test.txt"
}
