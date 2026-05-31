module "resource_group" {
  source          = "../../modules/resource_group"
  resource_groups = var.resource_groups
}

module "acr" {
  source     = "../../modules/acr"
  depends_on = [module.resource_group]
  acrs = {
    for k, v in var.acrs : k => {
      name                = v.name
      resource_group_name = module.resource_group.resource_group_names[v.resource_group_key]
      location            = module.resource_group.resource_group_locations[v.resource_group_key]
      sku                 = v.sku
      admin_enabled       = v.admin_enabled
      tags                = v.tags
    }
  }
}

module "aks" {
  source     = "../../modules/aks"
  depends_on = [module.resource_group]
  aks_clusters = {
    for k, v in var.aks_clusters : k => {
      name                = v.name
      resource_group_name = module.resource_group.resource_group_names[v.resource_group_key]
      location            = module.resource_group.resource_group_locations[v.resource_group_key]
      dns_prefix          = v.dns_prefix
      node_pool_name      = v.node_pool_name
      node_count          = v.node_count
      vm_size             = v.vm_size
      tags                = v.tags
    }
  }
}
