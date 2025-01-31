module "droplet" {
  source             = "./modules/droplet"
  image_name         = "129211873" # -> "ubuntu-22-04-x64" por algum motivo ele pediu o id
  droplet_name       = "pretalx"
  droplet_region     = "sfo3"
  droplet_size       = "s-2vcpu-4gb"
  droplet_backups    = true
  droplet_monitoring = true
  # droplet_vpc_uuid   = "9cb79062-f1e5-40b4-872f-171d9bcdfab3"
}

module "database_cluster" {
  source                = "./modules/database_cluster"
  database_name         = "pretalx"
  database_user_name    = "pretalx"
  database_engine       = "pg"
  database_cluster_name = "dbaas-db-5413665"
  database_node_count   = 1
  # database_private_network_uuid = "9cb79062-f1e5-40b4-872f-171d9bcdfab3"
  database_region           = "sfo3"
  database_size             = "db-s-1vcpu-1gb"
  database_storage_size_mib = 10240
  database_version          = "16"
  database_tags             = ["dbaas-db-5413665"]
}

module "firewall" {
  source               = "./modules/firewall"
  firewall_name        = "pretalx"
  firewall_droplet_ids = [module.droplet.digitalocean_droplet_pretalx_id]
  firewall_inbound_rules = [
    {
      ports            = ["4098"]
      protocol         = "tcp"
      source_addresses = ["0.0.0.0/0"]
    },
    {
      ports            = ["443"]
      protocol         = "tcp"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      ports            = ["80"]
      protocol         = "tcp"
      source_addresses = ["0.0.0.0/0", "::/0"]
    }
  ]

  firewall_outbound_rules = [
    {
      ports                 = []
      protocol              = "icmp"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      ports                 = ["all"]
      protocol              = "tcp"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      ports                 = ["all"]
      protocol              = "udp"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    }
  ]

}

module "project" {
  source              = "./modules/project"
  project_name        = "Talks Python"
  project_description = "Projeto para hospedar software de talks python."
  is_default          = true
  project_purpose     = "Website or blog"
}

resource "digitalocean_project_resources" "this" {
  project   = module.project.digitalocean_project_talks_python_id
  resources = [module.database_cluster.digitalocean_database_cluster_pg_pretalx_cluster_urn, module.droplet.digitalocean_droplet_pretalx_urn]
}

