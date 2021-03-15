
/* Allow http traffic*/

resource "google_compute_firewall" "allow_http" {

  name    = "allow-http"
  network = google_compute_network.vpc_network.id
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  target_tags = ["allow-http"]

}

/* Allow https traffic*/

resource "google_compute_firewall" "allow_https" {
  name    = "allow-https"
  network = google_compute_network.vpc_network.id
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  target_tags = ["allow-https"]

}

/* Allow ssh traffic*/


resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.id
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags = ["allow-ssh"]
}


/* Allow ICMP traffic so we can ping our machine */

resource "google_compute_firewall" "allow_icmp" {
  name    = "allow-icmp"
  network = google_compute_network.vpc_network.id
  allow {
    protocol = "icmp"
  }
  target_tags = ["allow-ssh"]
}