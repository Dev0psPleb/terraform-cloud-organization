provider "tfe" {}

locals {
  organization_name = lower(replace("${var.organization_name}", " ", "_"))
}

module "organization" {
  source  = "BrynardSecurity-terraform/terraform-cloud/tfe"
  version = "0.0.9"
  # insert the 2 required variables here
  admin_email         = var.admin_email
  name                = local.organization_name
  create_organization = var.create_organization
}

output "organization_id" {
  value = module.organization.tfe_organization_id
}

module "oauth_client" {
  source                = "BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_oauth_client"
  version               = "0.0.9"
  api_url               = var.api_url
  https_url             = var.https_url
  oauth_token           = var.github_pat_token
  organization          = module.organization.tfe_organization_id
  service_provider      = var.service_provider
  tfe_oauth_client_name = "Terraform Cloud - ${local.organization_name}"
}

output "oauth_client_id" {
  value = module.oauth_client.oauth_token_id
}

module "workspace" {
  source         = "BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_workspace"
  version        = "0.0.9"
  add_vcs_repo   = true
  auto_apply     = true
  name           = local.organization_name
  oauth_token_id = module.oauth_client.oauth_token_id
  organization   = module.organization.tfe_organization_id
  tfe_token      = var.terraform_api_token
  vcs_repository = var.github_repository
}
