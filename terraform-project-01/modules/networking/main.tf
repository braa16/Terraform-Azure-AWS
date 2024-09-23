# Este archivo contiene la definición de los recursos de red que se van a crear. Se invocaran desde los modulos del main principal.  

# Virtual Network (VNet) y Subnet: Define la red virtual y la subred que usará la VM.

# Una Virtual Network (VNet) en Azure es una red privada y flexible que te permite controlar cómo los recursos en Azure se conectan entre sí y con el mundo exterior.

resource "azurerm_virtual_network" "vnet" {
    name = var.vnetname
    address_space = ["10.0.0.0/16"]
    location = var.location
    resource_group_name = var.rgname

# Etiqueta para organizar, gestionar y clasificar los recursos

tags = {
    Environment   = "Desarrollo"
    Owner         = "network-admin"
    Department    = "IT"
    Project       = "APP1"
    SecurityLevel= "High"

  }

}

# Una Subnet es una subred que forma parte de una Virtual Network (VNet). Permiten segmentar tu red virtual en bloques más pequeños y organizados.

resource "azurerm_subnet" "subnet" {
  name                 = var.subnetname
  virtual_network_name = var.vnetname
  resource_group_name  = var.rgname
  address_prefixes     = ["10.0.1.0/24"]
  depends_on = [azurerm_virtual_network.vnet]

}

# Network Security Group (NSG): Configura las reglas de seguridad para abrir los puertos 80 (HTTP) y 22 (SSH).

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsgname
  location            = var.location
  resource_group_name = var.rgname

  security_rule {
    name                       = "Allow_HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow_SSH"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

# Etiqueta para organizar, gestionar y clasificar los recursos

tags = {
    Environment   = "Desarrollo"
    Owner         = "network-admin"
    Department    = "IT"
    Project       = "APP1"

  }
}

# NIC: (Network Interface Card) tiene el objetivo principal de conectar la máquina virtual (VM) u otro recurso de red a nuestra VNet.

resource "azurerm_network_interface" "nic" {
  name                = var.nicname
  location            = var.location
  resource_group_name = var.rgname

# Configura cómo la interfaz de red obtendrá y gestionará su dirección IP dentro de la subred especificada, asegurando que esté conectada adecuadamente a la VNet.

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.my-publicip.id
  }

# Etiqueta para organizar, gestionar y clasificar los recursos

  tags = {
    Environment   = "Desarrollo"
    Owner         = "network-admin"
    Department    = "IT"
    Project       = "APP1"

  }
}

# Configuramos la IP pública que asignaremos a la VM para ser accesibles desde la Internet pública.

resource "azurerm_public_ip" "my-publicip" {
  name                = var.publicipname
  resource_group_name = var.rgname
  location            = var.location
  allocation_method   = "Dynamic"

# Etiqueta para organizar, gestionar y clasificar los recursos

  tags = {
    Environment   = "Desarrollo"
    Owner         = "network-admin"
    Department    = "IT"
    Project       = "APP1"

  }

}

# Asociación entre NSG y Subnet

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = azurerm_subnet.subnet.id  
  network_security_group_id = azurerm_network_security_group.nsg.id 
}