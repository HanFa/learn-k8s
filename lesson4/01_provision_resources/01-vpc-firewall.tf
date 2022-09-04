
// https://github.com/kelseyhightower/kubernetes-the-hard-way/blob/master/docs/03-compute-resources.md
// Provision VPC, subnet and corresponding firewall

resource "google_compute_network" "vpc_network" {
  project                 = local.project
  name                    = local.detail
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  project       = local.project
  name          = "kubernetes"
  network       = google_compute_network.vpc_network.id
  ip_cidr_range = "10.240.0.0/24"
}

resource "google_compute_firewall" "allow_internal" {
  name    = "allow-internal"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
  }
  allow {
    protocol = "udp"
  }
  allow {
    protocol = "icmp"
  }
  direction     = "INGRESS"
  source_ranges = ["10.240.0.0/24"]
}

resource "google_compute_firewall" "allow_external" {
  name    = "allow-external"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["22", "6443"]
  }

  allow {
    protocol = "icmp"
  }

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}
