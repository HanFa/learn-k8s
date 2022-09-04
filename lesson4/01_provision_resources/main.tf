terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.34.0"
    }
  }
}

provider "google" {
  project = local.project
  region  = local.region
  zone    = local.zone
}
