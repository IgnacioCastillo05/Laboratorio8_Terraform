output "vm_names" {
  value = [for v in azurerm_linux_virtual_machine.vm : v.name]
}
output "nic_ids" {
  value = [for n in azurerm_network_interface.nic : n.id]
}
