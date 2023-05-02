resource "azurerm_resource_group" "shwe" {
name = var.resource_group_name
location = var.location
}
resource "azurerm_kubernetes_cluster" "aks" {
name = var.cluster_name
kubernetes_version = var.kubernetes_version
location = var.location
resource_group_name = azurerm_resource_group.shwe.name
dns_prefix = var.cluster_name

default_node_pool {
name = "system"
node_count = var.system_node_count
vm_size = "Standard_DS2_v2"
enable_auto_scaling = false
}
service_principal {
  client_id = "362acd8f-5400-44de-b5ff-062782041fca"
  client_secret = "t0~8Q~VIMsign~AkygPTun0WeTL-xnm-HMn7ib8T"
}
}
