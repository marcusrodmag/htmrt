output "instance_type" {
  value = "${var.node_size_map["${terraform.workspace}"]}"
}

output "node_count" {
  value = "${var.initial_node_count_map["${terraform.workspace}"]}"
}

output "node_disk_size" {
  value = "${var.node_disk_size_map["${terraform.workspace}"]}"
}

output "cluster_name" {
  value = "${var.cluster_name_map["${terraform.workspace}"]}"
}

# output "external_ip" {
#   value = google_compute_global_address.default.address
# }