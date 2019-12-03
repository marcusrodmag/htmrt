variable "cluster_name_map" {
	type = map(string)
		default = {
			dev     = "htmrt-dev"
			prd     = "htmrt-prd"
  	}
}

variable "node_disk_size_map" {
	type = map(number)
	default = {
		dev     = 20
		prd      = 20
	}
}

variable "initial_node_count_map" {
	type = map(number)
	default = {
		dev     = 1
		prd     = 1
	}
}

variable "node_size_map" {
	type = map(string)
	default = {
		dev     = "n1-standard-1"
		prd      = "n1-standard-1"
	}
}

variable "project" {
	default = "htmrt-260621"
}

variable "region" {
	default = "us-central1"
}

variable "zone" {
	default = "us-central1-f"
}

variable "network-default" {
	description = "Nome da rede default"
	default = "default"
}

variable "subnetwork-default" {
	description = "Nome da subrede default"
	default = "default"
}