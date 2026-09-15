provider "google" {
  project     = "project_id"
  region      = "us-central1"
}

resource "google_compute_instance" "example" {
    name = "my-instance"
    machine_type = "e2.micro"
    zone = "us-central1-a"

    network_interface {
  network = "default"
}
boot_disk {
    initialize_params {
      image_family = "debian-11"
      image_project = "debian-cloud"
    }
  }
scheduling {
preemptible= true
}
}
