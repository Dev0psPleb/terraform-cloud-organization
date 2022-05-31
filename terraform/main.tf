provider "tfe" {}

module "organization" {
  source  = "BrynardSecurity-terraform/terraform-cloud/tfe"
  version = "0.0.9"
  # insert the 2 required variables here
  admin_email         = var.admin_email
  name                = var.organization_name
  create_organization = var.create_organization
}

output "organization_id" {
  value = module.organization.tfe_organization_id
}

module "oauth_client" {
  source                = "BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_oauth_client"
  version               = "0.0.9"
  depends_on            = [module.organization]
  api_url               = var.api_url
  https_url             = var.https_url
  oauth_token           = var.github_pat_token
  organization          = module.organization.tfe_organization_id
  service_provider      = var.service_provider
  tfe_oauth_client_name = "Terraform Cloud (${var.organization_name})"
}

output "oauth_client_id" {
  value = module.oauth_client.oauth_token_id
}

module "workspace" {
  source                        = "BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_workspace"
  version                       = "0.0.9"
  add_vcs_repo                  = true
  agent_pool_id                 = ""
  allow_destroy_plan            = false
  auto_apply                    = true
  execution_mode                = "remote"
  file_triggers_enabled         = true
  global                        = true
  global_remote_state           = true
  name                          = module.organization.tfe_organization_id
  oauth_token_id                = module.oauth_client.oauth_token_id
  organization                  = module.organization.tfe_organization_id
  queue_all_runs                = true
  remote_state_consumer_ids     = [""]
  speculative_enabled           = true
  structured_run_output_enabled = true
  ssh_key_id                    = ""
  terraform_version             = ""
  tfe_token                     = var.terraform_api_token
  trigger_prefixes              = ""
  tags                          = ["prod"]
  vcs_branch                    = "main"
  vcs_repository                = ""
  workspace_description         = ""
  working_directory             = "./terraform"
  workspace_variable            = true
}
