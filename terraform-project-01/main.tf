# Este archivo contiene la definición principal de los recursos que se van a crear en Azure. Es la Plantilla Orquestadora 
# Función: Define la infraestructura específica, como grupos de recursos, redes virtuales, máquinas virtuales, etc.

# Se van a utilizar para los modulos que vamos a invocar 
variable "rgname" {}
variable "location" {}
variable "vmname" {}

# Crear Resource Group 

module "mod_01" { 
    source = "./modules/resource-group"
    rgname = var.rgname
    location = var.location
}

