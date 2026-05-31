resource_groups = {
  rg1 = {
    name     = "rg-terraform-dev1"
    location = "japaneast"
    tags     = { environment = "dev" }
  }
}

acrs = {
  acr1 = {
    name               = "acrterraformdev123" # Must be globally unique
    resource_group_key = "rg1"
    sku                = "Standard"
    admin_enabled      = true
    tags               = { environment = "dev" }
  }
}

aks_clusters = {
  aks1 = {
    name               = "aks-terraform-dev"
    resource_group_key = "rg1"
    dns_prefix         = "aksdev"
    node_pool_name     = "default"
    node_count         = 1
    vm_size            = "Standard_D2s_v3"
    tags               = { environment = "dev" }
  }
}
