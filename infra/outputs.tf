output "lb_public_ip" {
  value = module.lb.public_ip
}
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
output "vm_names" {
  value = module.compute.vm_names
}
