resource "digitalocean_firewall" "pretalx" {
  name        = var.firewall_name
  droplet_ids = var.firewall_droplet_ids

  dynamic "inbound_rule" {
    for_each = var.firewall_inbound_rules
    content {
      port_range       = inbound_rule.value.protocol != "icmp" ? join(",", inbound_rule.value.ports) : null
      protocol         = inbound_rule.value.protocol
      source_addresses = inbound_rule.value.source_addresses
    }
  }

  dynamic "outbound_rule" {
    for_each = var.firewall_outbound_rules
    content {
      protocol              = outbound_rule.value.protocol
      destination_addresses = outbound_rule.value.destination_addresses
      port_range            = outbound_rule.value.protocol != "icmp" ? join(",", outbound_rule.value.ports) : null
    }
  }

}
