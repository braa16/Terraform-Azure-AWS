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

# Variables Networking 

variable "nicname" {
}
variable "subnetname" {
}
variable "nsgname" {
}
variable "vnetname" {
}
variable "publicipname" {
}
