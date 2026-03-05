resource "azurerm_resource_group" "rg" {
  name     = format("%s%s", var.global_settings.environment_prefix, var.resource_group_name)

  location = lookup(
    var.settings,
    "region",
    var.global_settings.default_region
  )

  tags = merge(
    var.tags,
    lookup(var.settings, "tags", {})
  )
}
