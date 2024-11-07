resource "digitalocean_database_db" "pg-pretalx-db" {
  cluster_id = digitalocean_database_cluster.pg-pretalx-cluster.id
  name       = var.database_name
}

resource "digitalocean_database_user" "pg-pretalx-user" {
  cluster_id = digitalocean_database_cluster.pg-pretalx-cluster.id
  name       = var.database_user_name
}

resource "digitalocean_database_cluster" "pg-pretalx-cluster" {
  engine     = var.database_engine
  name       = var.database_cluster_name
  node_count = var.database_node_count
  # private_network_uuid = var.database_private_network_uuid
  region           = var.database_region
  size             = var.database_size
  storage_size_mib = var.database_storage_size_mib
  version          = var.database_version
  tags             = var.database_tags
}
