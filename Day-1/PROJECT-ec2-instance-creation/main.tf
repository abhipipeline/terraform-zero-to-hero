provider "google" {
  project     = "project_id"
  region      = "us-central1"
}

resource "google_compute_instance" "example" {
    name = "my_instance"
    machine_type = "e2.micro"
    provision = "spot"
    zone = "us-central1-a"
}
