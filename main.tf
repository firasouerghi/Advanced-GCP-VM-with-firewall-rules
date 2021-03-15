



/* static ip address resource */
resource "google_compute_address" "static_ip" {
  name = "task-static-ip"

}

/* subnetwork resource */

resource "google_compute_subnetwork" "vpc_subnet" {
  name          = "vpc-subnetwork"
  region        = var.region
  ip_cidr_range = "10.5.0.0/16"
  network       = google_compute_network.vpc_network.id

}

/* network resource */

resource "google_compute_network" "vpc_network" {
  name                    = "vpc-network"
  auto_create_subnetworks = false

}


/* additional disk resource */

resource "google_compute_disk" "additional_disk" {
  name = "new-disk"
  size = 40
  type = "pd-ssd"
  zone = var.zone

}

/* disk attachement resource */

resource "google_compute_attached_disk" "attachment_disk" {
  disk      = google_compute_disk.additional_disk.id
  instance = google_compute_instance.nginx_server.id 
}


/* compute instance resource */

resource "google_compute_instance" "nginx_server" {
  name         = "nginx-server"
  machine_type = var.machine_types[var.environment]
  zone         = var.zone
  description  = "Virtual machine that is going to host our nginx server "
  tags         = ["allow-http", "allow-https", "allow-icmp", "allow-ssh"] # firewall
  metadata = {
    "ssh-keys"       = "heroku:${file(var.ssh_key_file)}"
    "startup-script" = "apt-get update -y && apt-get install -y nginx"
  }

  boot_disk {
    auto_delete = true
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size  = 15

    }
  }
  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.vpc_subnet.id
    access_config {

      nat_ip = google_compute_address.static_ip.address

    }
  }

}