provider "tfe" {}

locals {
  organization_name = lower(replace("${var.organization_name}", " ", "_"))
  tags              = ["prod", "${local.organization_name}"]
}

module "organization" {
  source  = "BrynardSecurity-terraform/terraform-cloud/tfe"
  version = "0.1.5"
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
  version               = "0.1.5"
  api_url               = var.api_url
  https_url             = var.https_url
  oauth_token           = var.github_pat_token
  organization          = module.organization.tfe_organization_id
  service_provider      = var.service_provider
  tfe_oauth_client_name = "Terraform0.1.1 Cloud - ${local.organization_name}"
}

output "oauth_client_id" {
  value = module.oauth_client.oauth_token_id
}

module "workspace" {
  source                = "BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_workspace"
  version               = "0.1.5"
  add_vcs_repo          = true
  auto_apply            = true
  execution_mode        = "local"
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
  version             = "0.1.5"
  create_variable_set = true
  global              = null
  organization        = module.organization.tfe_organization_id
  variable_set_name   = module.organization.tfe_organization_id
  workspace_ids       = [module.workspace.tfe_workspace_id]
}

locals {
  variable_object = {
    "organization_name" = {
      create_variable = true
      value           = local.organization_name
      category        = "terraform"
      description     = "Terraform Cloud Organization"
      hcl             = false
      key             = "organization"
      sensitive       = false
      variable_set_id = module.variable_set.tfe_variable_set_id
    },
    "terraform_api_token" = {
      create_variable = true
      value           = var.terraform_api_token
      category        = "terraform"
      description     = "Terraform Cloud API Token"
      hcl             = false
      key             = "terraform_api_token"
      sensitive       = true
      variable_set_id = module.variable_set.tfe_variable_set_id
    }
  }
}

module "variables" {
  source             = "BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_variable"
  version            = "0.1.5"
  depends_on         = [module.variable_set]
  for_each           = local.variable_object
  category           = each.value.category
  create_variable    = each.value.create_variable
  description        = each.value.description
  description_suffix = "(managed by Terraform)"
  hcl                = each.value.hcl
  key                = each.value.key
  sensitive          = each.value.sensitive
  value              = each.value.value
  variable_set_id    = each.value.variable_set_id
}
