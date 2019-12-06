# https://www.terraform.io/docs/providers/google/r/container_cluster.html
resource "google_container_cluster" "htmrt-cluster" {

	name						= var.cluster_name_map["${terraform.workspace}"]
	description					= "Cluster htmrt - ${terraform.workspace}"
	project						= var.project
	location					= var.zone["${terraform.workspace}"]
	network 					= var.network-default
	subnetwork 					= var.subnetwork-default
	initial_node_count 			= var.initial_node_count_map["${terraform.workspace}"]
	enable_kubernetes_alpha 	= "false"
	enable_legacy_abac			= "true"
	
	master_auth {
  		# Disable basic authentication
	}

	maintenance_policy {
  		daily_maintenance_window {
    		start_time = "03:30"
  		}
	}
    
	addons_config {
		http_load_balancing {
			disabled = false
		}
		horizontal_pod_autoscaling {
			disabled = false
		}
	}

	node_config {
		machine_type = var.node_size_map["${terraform.workspace}"]
		disk_size_gb = var.node_disk_size_map["${terraform.workspace}"]
	    metadata = {
			disable-legacy-endpoints = "true"
		}
		oauth_scopes = [
			"https://www.googleapis.com/auth/devstorage.read_only",
			"https://www.googleapis.com/auth/datastore",
			"https://www.googleapis.com/auth/logging.write",
			"https://www.googleapis.com/auth/monitoring",
			"https://www.googleapis.com/auth/cloud-platform",
			"https://www.googleapis.com/auth/servicecontrol",
			"https://www.googleapis.com/auth/service.management.readonly",
			"https://www.googleapis.com/auth/trace.append"
		]
	}
}