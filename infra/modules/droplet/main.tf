resource "digitalocean_droplet" "pretalx" {
  image      = var.image_name
  name       = var.droplet_name
  region     = var.droplet_region
  size       = var.droplet_size
  backups    = var.droplet_backups
  monitoring = var.droplet_monitoring
  # vpc_uuid   = var.droplet_vpc_uuid
}
