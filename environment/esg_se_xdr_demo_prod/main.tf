module "organization" {
  source              = "../../modules/terraform_cloud_organization"
  admin_email         = var.admin_email
  organization_name   = var.organization_name
  create_organization = var.create_organization
}

module "oauth_client" {
  source                = "../../modules/tfe_oauth_client"
  depends_on            = [module.organization]
  api_url               = var.api_url
  https_url             = var.https_url
  oauth_token           = var.github_pat_token
  organization_name     = module.organization.organization_id
  service_provider      = var.service_provider
  tfe_oauth_client_name = var.organization_name
}

module "workspace" {
  source                        = "../../modules/terraform_cloud_workspace"
  allow_destroy_plan            = var.allow_destroy_plan
  add_vcs_repo                  = var.add_vcs_repo
  auto_apply                    = var.auto_apply
  execution_mode                = var.execution_mode
  file_triggers_enabled         = var.file_triggers_enabled
  global_remote_state           = var.global_remote_state
  name                          = var.workspace_name
  oauth_token_id                = module.oauth_client.oauth_token_id
  organization                  = module.organization.organization_id
  queue_all_runs                = var.queue_all_runs
  speculative_enabled           = var.speculative_enabled
  structured_run_output_enabled = var.structured_run_output_enabled
  tags                          = var.tags
  vcs_repository                = var.vcs_repository
  vcs_branch                    = var.vcs_branch
  working_directory             = var.working_directory
}
