# Virtual Network (VNet) y Subnet: Define la red virtual y la subred que usará la VM.

resource "azurerm_virtual_network" "vnet" {
    name = var.vnetname
    address_space = ["10.0.0.0/16"]
    location = azurerm_resource_group.var.location
    resource_group_name = azurerm_resource_group.var.rgname
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnetname
  virtual_network_name = azurerm_virtual_network.var.vnetname
  resource_group_name  = azurerm_resource_group.var.rgname 
  address_prefixes     = ["10.0.1.0/24"]
}

# Network Security Group (NSG): Configura las reglas de seguridad para abrir los puertos 80 (HTTP) y 22 (SSH).

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsgname
  location            = azurerm_resource_group.var.location
  resource_group_name = azurerm_resource_group.var.rgname

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
}

# Network Interface (NIC): Conecta la interfaz de red con la subred y el grupo de seguridad.

resource "azurerm_network_interface" "nic" {
  name                = var.nicname
  location            = azurerm_resource_group.var.location
  resource_group_name = azurerm_resource_group.var.rgname

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.var.subnetname
    private_ip_address_allocation = "Dynamic"
  }
}
