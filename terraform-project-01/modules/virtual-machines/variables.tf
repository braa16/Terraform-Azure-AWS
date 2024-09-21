# Define las variables de entrada que se utilizara en la configuración para parametrizar valores como nombres de recursos, ubicaciones, etc.
# Función: Centralizar las variables para una fácil gestión y reutilización.

variable "vm_size" {
}
variable "vmname" {
}
variable "rgname" {
}
variable "location" {
}
variable "admin_username" {
}
variable "hddname" {
}
variable "path_ssh" {
}
variable "nic_id" { # Variables NIC ID 
  description = "ID de la tarjeta de red (NIC) asociada a la VM"
  type        = string
}