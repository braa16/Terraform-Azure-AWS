# Este archivo contiene la definición principal de los recursos que se van a crear en Azure. Es la Plantilla Orquestadora 
# Función: Define la infraestructura específica, como grupos de recursos, redes virtuales, máquinas virtuales, etc.

# Variables de entrada que se utilizara para los modulos que vamos a invocar 

variable "rgname" {}
variable "location" {}
variable "vnetname" {}
variable "subnetname" {}
variable "nsgname" {}
variable "nicname" {}

# Crear Resource Group mediante modulos

module "mod_01" { 
    source = "./modules/resource-group"
    rgname = var.rgname
    location = var.location
}

# Crear Recursos Networking (Vnet, Subnet, NSG, NIC) mediante modulos

 module "mod_02" { 
    source = "./modules/networking"
    vnetname = var.vnetname
    subnetname = var.subnetname
    nsgname = var.nsgname
    nicname = var.nicname
    rgname = var.rgname
    location = var.location
    depends_on = [module.mod_01]
}
