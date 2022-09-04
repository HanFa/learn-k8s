
// https://github.com/kelseyhightower/kubernetes-the-hard-way/blob/master/docs/03-compute-resources.md
// Provision compute instances as Kubernetes control plane and worker nodes

resource "google_compute_instance" "controllers" {
  count = 3
  name = "controller-${count.index}"

  boot_disk {
    initialize_params {
      size  = "200"
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  machine_type = "e2-standard-2"

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id
    network_ip = "10.240.0.1${count.index}"
  }
  can_ip_forward = true

  service_account {
    scopes = ["compute-rw", "storage-ro", "service-management", "service-control", "logging-write", "monitoring"]
  }
}

resource "google_compute_instance" "workers" {
  count = 3

  name = "worker-${count.index}"

  boot_disk {
    initialize_params {
      size  = "200"
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  machine_type = "e2-standard-2"

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id
    network_ip = "10.240.0.2${count.index}"
  }
  can_ip_forward = true

  service_account {
    scopes = ["compute-rw", "storage-ro", "service-management", "service-control", "logging-write", "monitoring"]
  }
}
