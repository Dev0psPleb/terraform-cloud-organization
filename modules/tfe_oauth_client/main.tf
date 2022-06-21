locals {
  organization_name = lower(replace("${var.organization_name}", " ", "_"))
}

module "oauth_client" {
  source                = "BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_oauth_client"
  version               = "0.1.5"
  api_url               = var.api_url
  https_url             = var.https_url
  oauth_token           = var.oauth_token
  organization          = local.organization_name
  service_provider      = var.service_provider
  tfe_oauth_client_name = "Terraform Cloud - ${local.organization_name}"
}
