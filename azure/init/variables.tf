variable "component" {
  type        = string
  description = "System Component Name - Name the Terraform Group"
  default     = "tfstore"
}
variable "owner" {
  type        = string
  description = "Owner Name"
  default = "DevOps"
}
variable "location" {
  default = "southcentralus"
}
variable "net_name" {
  type        = string
  description = "Name the Net"
}
variable "env_name" {
  type        = string
  description = "Name the Environment"
}
variable "tfstate_rg" {
  type        = string
  description = "Resource Group name for TF State Storage"
}
variable "tfstate_account" {
  type        = string
  description = "Storage Account name for TF State Storage"
}
variable "tfstate_container" {
  type        = string
  description = "Blob Container name for TF State Storage"
}
# variable "az_count" {
#   description = "Number of AZs to cover in a given AWS region"
#   default     = "2"
# }
# variable "timezone" {
#   default = "America/Chicago"
# }

variable "image_publisher" {
  type = string
  description = "Publisher Name on Azure"
  default = "Canonical"
}
variable "image_offer" {
  type = string
  description = "Offer Name on Azure"
  default = "0001-com-ubuntu-server-jammy"
}
variable "image_sku" {
  type = string
  description = "SKU Name on Azure"
  default = "22_04-lts-gen2"
}