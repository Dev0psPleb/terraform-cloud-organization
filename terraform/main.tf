provider "tfe" {}

locals {
  organization_name = lower(replace("${var.organization_name}", " ", "_"))
  tags              = ["prod", "${local.organization_name}"]
}

module "organization" {
  source  = "BrynardSecurity-terraform/terraform-cloud/tfe"
  version = "0.1.1"
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
  version               = "0.1.1"
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
  source                = "BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_workspace"
  version               = "0.1.1"
  add_vcs_repo          = true
  auto_apply            = true
  file_triggers_enabled = true
  name                  = local.organization_name
  oauth_token_id        = module.oauth_client.oauth_token_id
  organization          = module.organization.tfe_organization_id
  queue_all_runs        = true
  tags                  = local.tags
  tfe_token             = var.terraform_api_token
  vcs_repository        = var.github_repository
  working_directory     = var.working_directory
}

module "variable_set" {
  source              = "BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_variable_set"
  version             = "0.1.1"
  create_variable_set = true
  global              = null
  organization        = module.organization.tfe_organization_id
  variable_set_name   = module.organization.tfe_organization_id
  workspace_ids       = [module.workspace.tfe_workspace_id]
}

module "variables" {
  source          = "BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_variables"
  version         = "0.1.1"
  for_each        = var.variable
  category        = each.value.category
  create_variable = each.value.create_variable
  description     = each.value.description
  hcl             = each.value.hcl
  key             = each.value.key
  sensitive       = each.value.sensitive
  value           = each.value.value
  variable_set    = each.value.variable_set
  workspace_id    = module.workspace.tfe_workspace_id
}
