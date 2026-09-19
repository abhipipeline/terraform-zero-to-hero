# NETWORKING
resource "google_compute_network" "vpc" {
  name = "custom-vpc"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "sub1" {
  name = "subnetwork1"
  ip_cidr_range = var.cidr
  region = "us-central1"
  network = google_compute_network.vpc.id
}
resource "google_compute_firewall" "allow_web_and_ssh" {
  name    = "allow-web-ssh"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["vm-instance"]
}


# VM INSTANCE
resource "google_compute_instance" "default" {
  name         = "my-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  tags = ["vm-instance"]

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

  

  metadata_startup_script = file("${path.module}/userdata.sh")
}
