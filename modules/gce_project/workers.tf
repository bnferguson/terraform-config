resource "google_container_cluster" "workers_b" {
  name = "workers-b"
  zone = "us-central1-b"
  initial_node_count = "${var.gke_initial_node_count}"
  project = "${var.gce_project}"
  # subnetwork "workers"

  master_auth {
    username = "${var.gke_master_username}"
    password = "${var.gke_master_password}"
  }

	node_config {
    machine_type = "g1-small"
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }
}

resource "google_container_cluster" "workers_c" {
  name = "workers-c"
  zone = "us-central1-c"
  initial_node_count = "${var.gke_initial_node_count}"
  project = "${var.gce_project}"
  # subnetwork "workers"

  master_auth {
    username = "${var.gke_master_username}"
    password = "${var.gke_master_password}"
  }

	node_config {
    machine_type = "g1-small"
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }
}
