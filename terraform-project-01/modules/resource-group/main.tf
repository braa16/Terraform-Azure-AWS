# Creando Recursos Resource Groups 
# Un grupo de recursos es una entidad que agrupa todos los recursos relacionados de tu proyecto en Azure, lo que facilita la gestión y administración.

resource "azurerm_resource_group" "rg" {
    location = var.location
    name = var.rgname

# Etiqueta para organizar, gestionar y clasificar los recursos

tags = {
    Environment   = "Desarrollo"
    Owner         = "admin"
    Department    = "IT"
    Project       = "APP1"

  }

}

