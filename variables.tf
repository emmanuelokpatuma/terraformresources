variable "storage_name" {
  description = "Name of the storage account"
  type        = string
  default     = "eostorage-dev"   # change this as needed
}

variable "resource_group" {
  description = "Name of the resource group"
  type        = string
  default     = "azure_assignment"  # your existing RG
}

variable "location" {
  description = "Azure location for the storage account"
  type        = string
  default     = "northeurope"       # your desired region
}
