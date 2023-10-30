data "azurerm_platform_image" "vm_image" {
    location = var.location
    publisher  = "${var.image_publisher}"
    offer = "${var.image_offer}"
    sku = "${var.image_sku}"
}