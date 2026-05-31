resource_groups = {
  rg1 = {
    name     = "rg-terraform-prod"
    location = "East US"
    tags     = { environment = "prod" }
  }
}

acrs = {
  acr1 = {
    name               = "acrterraformprod123" # Must be globally unique
    resource_group_key = "rg1"
    sku                = "Premium"
    admin_enabled      = true
    tags               = { environment = "prod" }
  }
}

aks_clusters = {
  aks1 = {
    name               = "aks-terraform-prod"
    resource_group_key = "rg1"
    dns_prefix         = "aksprod"
    node_pool_name     = "default"
    node_count         = 3
    vm_size            = "Standard_DS2_v2"
    tags               = { environment = "prod" }
  }
}
