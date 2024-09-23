# Este archivo contiene la definición de los recursos como VM y sus caracteristicas. Se invocaran desde los modulos del main principal.  

# Definición de VM.

resource "azurerm_linux_virtual_machine" "myvm" {
  name = var.vmname
  resource_group_name = var.rgname
  location = var.location
  size = var.vm_size 
  admin_username = var.admin_username
  network_interface_ids = [var.nic_id]

# Evitar que Terraform intente aplicar estos pequeños cambios en futuros planes.

 lifecycle {
    ignore_changes = [
      size
    ]
  }

# Definimos cómo se manejará el disco del SO de la VM, Caching: Lectura y escritura, Almacenamiento: Tipo estándar, basado en HDD y 30GB

 os_disk {
    name = var.hddname
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 30
  }

# Imagen Debia, version 11 y le indicamos que siempre use la versión más reciente disponible. 

source_image_reference {
  publisher = "Debian"
  offer     = "debian-11"
  sku       = "11"
  version   = "latest"

}

# Acceso SSH, método de conexión segura a VM de forma encriptada, mediante un par de claves RSA (Publica y Privada)

admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.path_ssh)
  }

# Este es el bloque de custom_data, donde pasas el script de cloud-init codificado en base64

 custom_data = base64encode(file("${path.module}/setup.sh"))

# Etiqueta para organizar, gestionar y clasificar los recursos

tags = {
    Environment   = "Desarrollo"
    Owner         = "admin"
    Department    = "IT"
    Project       = "APP1"
  }
}

