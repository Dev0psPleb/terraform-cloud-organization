locals {
  organization_name = lower(replace("${var.organization_name}", " ", "_"))
}

module "organization" {
  source              = "BrynardSecurity-terraform/terraform-cloud/tfe"
  version             = "0.1.5"
  admin_email         = var.admin_email
  name                = local.organization_name
  create_organization = var.create_organization
}

module "oauth_client" {
  source                = "BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_oauth_client"
  version               = "0.1.5"
  api_url               = var.api_url
  https_url             = var.https_url
  oauth_token           = var.github_pat_token
  organization          = local.organization_name
  service_provider      = var.service_provider
  tfe_oauth_client_name = var.tfe_oauth_client_name
}
