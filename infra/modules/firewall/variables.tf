variable "firewall_name" {
  type        = string
  description = "Nome do firewall"
}

variable "firewall_droplet_ids" {
  type        = list(number)
  description = "Lista dos droplets associados ao firewall"
}

variable "firewall_inbound_rules" {
  type = list(object({
    protocol         = string
    ports            = list(string)
    source_addresses = list(string)
  }))
  description = "Regras de entrada para o firewall, com protocolo, portas e endereços de origem"
}

variable "firewall_outbound_rules" {
  type = list(object({
    protocol              = string
    ports                 = list(string)
    destination_addresses = list(string)
  }))
  description = "Regras de saída para o firewall, com protocolo, portas e endereços de destino"
}
