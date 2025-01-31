output "digitalocean_database_cluster_pg_pretalx_cluster_id" {
  value = digitalocean_database_cluster.pg-pretalx-cluster.id
}

output "digitalocean_database_cluster_pg_pretalx_cluster_urn" {
  value = digitalocean_database_cluster.pg-pretalx-cluster.urn
}

output "digitalocean_database_db_pg_pretalx_db" {
  value = digitalocean_database_db.pg-pretalx-db.id
}

output "digitalocean_database_user_pg_pretalx_cluster_id" {
  value = digitalocean_database_user.pg-pretalx-user.id
}
