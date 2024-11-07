resource "digitalocean_project" "talks_python" {
  name        = var.project_name
  description = var.project_description
  is_default  = var.is_default
  purpose     = var.project_purpose
}
