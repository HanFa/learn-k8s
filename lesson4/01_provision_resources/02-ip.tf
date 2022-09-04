
// https://github.com/kelseyhightower/kubernetes-the-hard-way/blob/master/docs/03-compute-resources.md
// Reserve a static IP address for the external load balancer of the Kubernetes API server

resource "google_compute_address" "lb" {
  name = local.detail

  region = local.region
  address_type = "EXTERNAL"
}
