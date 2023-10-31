output "surveyor_ipaddress" {
    value = azurerm_public_ip.surveyor.ip_address
}
output "surveyor_fqdn" {
    value = azurerm_public_ip.surveyor.fqdn
}
output "pubkey1" {
    value = file("${path.module}/pubkeys/${var.pubkey1_file}")
}
output "pubkey2" {
    value = file("${path.module}/pubkeys/${var.pubkey2_file}")
}
output "pubkey3" {
    value = file("${path.module}/pubkeys/${var.pubkey3_file}")
}