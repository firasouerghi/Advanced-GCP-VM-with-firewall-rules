
/* Output our VM public ip address */

output "instance_public_ip_address" {

  value       = google_compute_address.static_ip.address
  description = "our instance external ip address"

}
