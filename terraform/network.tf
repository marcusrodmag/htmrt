resource "google_compute_network" "htmrt-network" {
  name = "${terraform.workspace}-htmrt-network"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "htmrt-subnetwork" {
  name          = "${terraform.workspace}-htmrt-subnetwork"
  ip_cidr_range = "10.100.0.0/16"
  network       = google_compute_network.htmrt-network.self_link
  region        = "us-central1"
}

resource "google_compute_global_address" "default" {
  name = "${terraform.workspace}-htmrt-external-ip"
  address_type = "EXTERNAL"
}
resource "google_compute_address" "internal_with_gce_endpoint" {
	name         = "${terraform.workspace}-htmrt-k8s-loadbalancer"
	address_type = "INTERNAL"
}

resource "google_compute_firewall" "k8s-allow-project-network" {
	name    = "${terraform.workspace}-htmrt-fw-k8s-localnw"
	network = google_compute_network.htmrt-network.self_link
	priority = "1000"
	source_ranges = ["${google_container_cluster.htmrt-cluster.cluster_ipv4_cidr}"]

	allow {
		protocol = "tcp"
	}
	allow {
		protocol = "udp"
	}
	allow {
		protocol = "icmp"
	}
	allow {
		protocol = "esp"
	}
	allow {
		protocol = "ah"
	}
	allow {
		protocol = "sctp"
	}
	
}

## A criação efetiva do DNS requer o registro do dominio htmrt.com
# resource "google_dns_record_set" "k8s-lb-dns" {
#   name = "${terraform.workspace}-htmrt.${google_dns_managed_zone.dns-zone.dns_name}"
#   type = "A"
#   ttl  = 300

#   managed_zone = google_dns_managed_zone.dns-zone.name

#   rrdatas = [google_container_cluster.htmrt-cluster.network_interface[0].access_config[0].nat_ip]
# }

# resource "google_dns_managed_zone" "dns-zone" {
#   name     = "${terraform.workspace}-dns-zone"
#   dns_name = "htmrt.com"
# }