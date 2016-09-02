resource "google_compute_network" "main" {
  name = "main"
  project = "${var.gce_project}"
}

resource "google_compute_subnetwork" "public" {
  name = "public"
  ip_cidr_range = "10.10.1.0/24"
  network = "${google_compute_network.main.self_link}"
  region = "us-central1"

  project = "${var.gce_project}"
}

resource "google_compute_subnetwork" "workers" {
  name = "workers"
  ip_cidr_range = "10.10.2.0/24"
  network = "${google_compute_network.main.self_link}"
  region = "us-central1"

  project = "${var.gce_project}"
}

resource "google_compute_firewall" "allow_icmp" {
  name    = "allow-icmp"
  network = "${google_compute_network.main.name}"

  project = "${var.gce_project}"

  allow {
    protocol = "icmp"
  }
}

resource "google_compute_firewall" "allow_ssh" {
  name = "allow-ssh"
  network = "${google_compute_network.main.name}"

  project = "${var.gce_project}"

  allow {
    protocol = "tcp"
    ports = ["22"]
  }
}

resource "google_compute_firewall" "allow_internal" {
  name = "allow-internal"
  network = "${google_compute_network.main.name}"
  source_ranges = ["10.10.0.0/16"]

  project = "${var.gce_project}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }
}
