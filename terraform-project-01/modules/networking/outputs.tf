# Este archivo contendrá las declaraciones de outputs que exponen los valores que otros módulos o recursos necesitarán, como el ID de la interfaz de red (NIC) en este caso.

output "nic_id" {
  value = azurerm_network_interface.nic.id
}
