variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "prefix" { type = string }
variable "admin_username" { type = string }
variable "ssh_public_key" { type = string }
variable "subnet_id" { type = string }
variable "vm_count" { type = number }
variable "cloud_init" { type = string }
variable "tags" { type = map(string) }

resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "${var.prefix}-nic-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "vm" {
  count               = var.vm_count
  name                = "${var.prefix}-vm-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = "Standard_B1s"

  admin_username = var.admin_username
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  custom_data = base64encode(var.cloud_init)

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  tags = var.tags
}

output "vm_names" {
  value = [for v in azurerm_linux_virtual_machine.vm : v.name]
}
output "nic_ids" {
  value = [for n in azurerm_network_interface.nic : n.id]
}
