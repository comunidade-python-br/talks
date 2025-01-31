variable "droplet_backups" {
  type        = bool
  description = "Indica se o droplet vai ter backups habilitados"
}


variable "droplet_monitoring" {
  type        = bool
  description = "Indica se o droplet vai ser monitorado"
}

variable "droplet_name" {
  type        = string
  description = "Nome do droplet"
}

variable "image_name" {
  type        = string
  description = "Nome da imagem do droplet"
}

variable "droplet_region" {
  type        = string
  description = "Região onde o droplet será criado"
}

variable "droplet_size" {
  type        = string
  description = "Tamanho da instância do droplet"
}

# variable "droplet_vpc_uuid" {
#   type        = string
#   description = "UUID do VPC onde o droplet será criado"
# }
