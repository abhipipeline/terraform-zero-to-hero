provider "google" {
  project     = "project_id"
  region      = "us-central1"
}

resource "google_compute_instance" "example" {
    name = "my_instance"
    machine_type = "e2.micro"
    zone = "us-central1-a"

    network_interface {
  network = "default"
}
boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
scheduling {
preemptible= true
}
}
