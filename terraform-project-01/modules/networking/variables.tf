# Define las variables de entrada que se utilizara en la configuración para parametrizar valores como nombres de recursos, ubicaciones, etc.
# Función: Centralizar las variables para una fácil gestión y reutilización.

variable "vnetname" {
  description = "dev-weu-vnet-app1"
  type        = string
}
variable "subnetname" {
  description = "dev-weu-subnet-app1"
  type        = string
}
variable "nsgname" {
description = "dev-weu-nsg-app1"
  type        = string
}
variable "nicname" {
description = "dev-weu-nic-app1"
  type        = string
}
