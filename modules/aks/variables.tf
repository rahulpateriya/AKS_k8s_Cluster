variable "aks_clusters" {
  description = "Map of AKS clusters to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string
    node_pool_name      = string
    node_count          = number
    vm_size             = string
    tags                = map(string)
  }))
}
