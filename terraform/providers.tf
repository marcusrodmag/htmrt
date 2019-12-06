provider "google" {
  version = "2.12"
  credentials = file("key/htmrt-terraform-sa.json")
  project     = "htmrt-260621"
  region      = var.region["${terraform.workspace}"]
}