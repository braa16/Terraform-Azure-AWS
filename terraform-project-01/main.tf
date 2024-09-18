# Este archivo contiene la definición principal de los recursos que se van a crear en Azure. Es la Plantilla Orquestadora 
# Función: Define la infraestructura específica, como grupos de recursos, redes virtuales, máquinas virtuales, etc.

# Crear Resource Group.

module "mod_01" { 
    source = "./modules/resource-group"
    rgname = var.rgname
    location = var.location
}

# Crear Recursos Networking (Vnet, Subnet, NSG, NIC).

 module "mod_02" { 
    source = "./modules/networking"
    vnetname = var.vnetname
    subnetname = var.subnetname
    nsgname = var.nsgname
    nicname = var.nicname
    rgname = var.rgname
    location = var.location
    publicipname = var.publicipname
    depends_on = [module.mod_01]
}

# Crear Recurso VM, acceso SSH e instalacion de nginx.

module "mod_03" {
    source = "./modules/virtual-machines"
    vmname = var.vmname
    rgname = var.rgname
    location = var.location
    vnetname = var.vnetname
    subnetname = var.subnetname
    nsgname = var.nsgname
    publicipname = var.publicipname
    nicname = var.nicname
    admin_username = var.admin_username
    vm_size = var.vm_size
    hddname = var.hddname
    path_ssh = var.path_ssh
    depends_on = [module.mod_02]
}

