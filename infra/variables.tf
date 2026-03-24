variable "prefix" { type = string }
variable "location" { type = string }
variable "vm_count" { type = number }
variable "admin_username" { type = string }
variable "ssh_public_key" { type = string }
variable "allow_ssh_from_cidr" { type = string }
variable "tags" { type = map(string) }
