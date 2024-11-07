variable "database_engine" {
  type        = string
  description = "Engine"
}

variable "database_name" {
  type        = string
  description = "Nome do db"
}

variable "database_user_name" {
  type        = string
  description = "Nome do user do db"
}

variable "database_cluster_name" {
  type        = string
  description = "Nome do cluster"
}

variable "database_node_count" {
  type        = number
  description = "Número de nós no cluster"
}

# variable "database_private_network_uuid" {
#   type        = string
#   description = "UUID da rede privada para o banco de dados"
# }

variable "database_region" {
  type        = string
  description = "Região onde o banco de dados será criado"
}

variable "database_size" {
  type        = string
  description = "Tamanho da instância"
}

variable "database_storage_size_mib" {
  type        = number
  description = "Tamanho do armazenamento em MiB"
}

variable "database_version" {
  type        = string
  description = "Versão do banco de dados"
}

variable "database_tags" {
  type        = list(any)
  description = "Tags do cluster"

}
