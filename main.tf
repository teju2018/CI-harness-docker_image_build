provider "google" {
  project = "saicharan-457910"
  zone    = "us-central1-a"
}

resource "google_compute_instance" "instance" {
  name         = "instance-1"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "centos-stream-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
      # This is required to assign an external IP
    }
  }
}

output "instance-ip" {
  value = google_compute_instance.instance.network_interface[0].access_config[0].nat_ip
}

