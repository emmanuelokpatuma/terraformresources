variable "location" {
  description = "Azure location for the storage account"
  type        = string
  default     = "northeurope"
}

# List of storage account names (for count loop)
variable "storage_names" {
  description = "List of storage account names to create"
  type        = list(string)
  default     = [
    "eostorage001dev",
    "eostorage002dev",
    "eostorage003dev"
  ]
}

# Map of storage accounts with replication types (for for_each loop)
variable "storages" {
  description = "Map of storage account names to replication types"
  type        = map(string)
  default = {
    "eostoragea001dev" = "LRS"
    "eostorageb001dev" = "GRS"
    "eostoragec001dev" = "LRS"
  }
}

# Existing Resource Group name
variable "existing_rg_name" {
  description = "Name of the existing Azure Resource Group"
  type        = string
  default     = "azure_assignment"
}
