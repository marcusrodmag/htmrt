terraform {
	backend "gcs" {
		bucket = "htmrt-tf-state"
		prefix = "terraform/state"
		credentials = "key/htmrt-terraform-sa.json"
	}
}