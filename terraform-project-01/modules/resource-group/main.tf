# Creando Recursos Resource Groups 

resource "azurerm_resource_group" "rg" {
    location = var.location
    name = var.rgname
}

