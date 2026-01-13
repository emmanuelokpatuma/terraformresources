variable "storage_name" {
  type = string
}

variable "resource_group" {
  type = string
}


variable "location" {
  description = "Azure location for the storage account"
  type        = string
  default     = "northeurope"
}
