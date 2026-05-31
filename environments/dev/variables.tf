variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

variable "acrs" {
  type = map(object({
    name                = string
    resource_group_key  = string
    sku                 = string
    admin_enabled       = bool
    tags                = map(string)
  }))
}

variable "aks_clusters" {
  type = map(object({
    name                = string
    resource_group_key  = string
    dns_prefix          = string
    node_pool_name      = string
    node_count          = number
    vm_size             = string
    tags                = map(string)
  }))
}
