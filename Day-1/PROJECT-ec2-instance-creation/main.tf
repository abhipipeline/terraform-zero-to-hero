provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_instance" "example" {
  name         = "my-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
      # This allocates a public IP address
    }
  }

  scheduling {
    preemptible = true
  }

  tags = ["http-server", "https-server"]
}
