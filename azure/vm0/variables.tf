variable "component" {
  type        = string
  description = "System Component Name - Name the Terraform Group"
}
variable "owner" {
  type        = string
  description = "Owner Name"
  default = "DevOps"
}
variable "location" {
  type = string
  description = "Azure Location aka Region"
}
variable "net_name" {
  type        = string
  description = "Name the Net"
}
variable "env_name" {
  type        = string
  description = "Name the Environment"
}
variable "vm_name" {
  type = string
  description = "Name the Virtual Machine"
}
variable "vm_user" {
  type = string
  description = "Set the Username for Linux login"
}
variable "vm_size" {
  type = string
  description = "Size of Azure VM"
  # default = "Standard_B2s"
  # https://learn.microsoft.com/en-us/azure/virtual-machines/sizes-b-series-burstable
}
variable "image_publisher" {
  type = string
  description = "Publisher Name on Azure"
  default = "Canonical"
}
variable "image_offer" {
  type = string
  description = "Offer Name on Azure"
  default = "0001-com-ubuntu-minimal-jammy"
}
variable "image_sku" {
  type = string
  description = "SKU Name on Azure"
  default = "minimal-22_04-lts"
}
variable "ssh_src1" {
  type = string
  description = "ssh source ip address 1"
}
variable "ssh_src1name" {
  type = string
  description = "ssh source name 1"
}
variable "ssh_src2" {
  type = string
  description = "ssh source ip address 2"
}
variable "ssh_src2name" {
  type = string
  description = "ssh source name 2"
}
variable "pubkey1_file" {
  type = string
  description = "public ssh key 1 for remote access"
  default = "ssh_kt-mbpro20.pub"
}
variable "pubkey2_file" {
  type = string
  description = "public ssh key 2 for remote access"
  default = ""
}
variable "pubkey3_file" {
  type = string
  description = "public ssh key 3 for remote access"
  default = ""
}

# Setup "terraform.tfvars" file in this folder to use your preferences
# # note some variables are set in env.sh to ensure consistency between terraform components
# vm_name = "surveyor0"
# vm_user = "yourname"
# vm_size = "Standard_B2s"
# ssh_src1 = "1.1.1.1"
# ssh_src1name = "sitenameA"
# ssh_src2 = "9.9.9.9"
# ssh_src2name = "jumphostB"
# pubkey1_file = "ssh_kt-mbpro20.pub"
# pubkey2_file = "ssh_kt-noisy.pub"
# pubkey3_file = "ssh_kt-imac17.pub"
