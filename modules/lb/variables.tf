variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "prefix" { type = string }
variable "backend_nic_ids" { type = list(string) }
variable "allow_ssh_from_cidr" { type = string }
variable "tags" { type = map(string) }
