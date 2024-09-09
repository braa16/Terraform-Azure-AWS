# Contiene la configuración del proveedor, en este caso, Azure.
# Función: Definir el proveedor azurerm y configuraciones básicas.

# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2" # Define la versión del proveedor que deseas utilizar
    }
  }

  required_version = ">= 1.1.0" # Requiere Terraform versión 1.3.0 o superior
}

provider "azurerm" {
  features {}
}

