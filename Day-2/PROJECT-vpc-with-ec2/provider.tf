terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>5.11"
    }
  }
}

provider "google" {
  # Configuration options
  region = "us-central1"
}
