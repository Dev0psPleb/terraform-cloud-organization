terraform {
  cloud {
    organization = "esg_se_xdr_demo_environment"

    workspaces {
      name = "terraform_cloud_organization"
    }
  }
}
provider "tfe" {}

locals {
  organization_name = lower(replace("${var.organization_name}", " ", "_"))
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
  tfe_oauth_client_name = "Terraform Cloud - ${local.organization_name}"
}

output "oauth_client_id" {
  value = module.oauth_client.oauth_token_id
}

/*

    Commenting out this section to test initialization of this workspaces backend with a backend config file

*/

data "terraform_remote_state" "tfc_organization" {
  backend = "remote"
  config = {
    organization = module.organization.tfe_organization_id
    workspaces = {
      name = "terraform_cloud_organization"
    }
  }
}

locals {
  workspace_object = {
    "vpc-us-east-1" = {
      allow_destroy_plan            = true
      add_vcs_repo                  = true
      auto_apply                    = true
      execution_mode                = "local"
      file_triggers_enabled         = false
      global_remote_state           = true
      name                          = "vpc-us-east-1"
      oauth_token_id                = data.terraform_remote_state.tfc_organization.outputs.oauth_client_id
      queue_all_runs                = true
      speculative_enabled           = false
      structured_run_output_enabled = true
      tags                          = ["source:aws", "env:dev", "aws_account_id:010062078576", "aws_region:us-east-1"]
      tfe_token                     = var.terraform_api_token
      vcs_repository                = "sophos-iaas/terraform-aws-vpc"
      vcs_branch                    = "main"
      working_directory             = "./us-east-1"
    }
  }
}

module "workspace" {
  source                        = "BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_workspace"
  version                       = "0.1.5"
  for_each                      = local.workspace_object
  allow_destroy_plan            = each.value.allow_destroy_plan
  add_vcs_repo                  = each.value.add_vcs_repo
  auto_apply                    = each.value.auto_apply
  execution_mode                = each.value.execution_mode
  file_triggers_enabled         = each.value.file_triggers_enabled
  global_remote_state           = each.value.global_remote_state
  name                          = each.value.name
  oauth_token_id                = each.value.oauth_token_id
  organization                  = module.organization.tfe_organization_id
  queue_all_runs                = each.value.queue_all_runs
  speculative_enabled           = each.value.speculative_enabled
  structured_run_output_enabled = each.value.structured_run_output_enabled
  tags                          = each.value.tags
  tfe_token                     = each.value.tfe_token
  vcs_repository                = each.value.vcs_repository
  vcs_branch                    = each.value.vcs_branch
  working_directory             = each.value.working_directory
}
/*
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
    "admin_email" = {
      create_variable = true
      value           = var.admin_email
      category        = "terraform"
      description     = "Organization Administrator Email Address"
      hcl             = false
      key             = "admin_email"
      sensitive       = false
      variable_set_id = module.variable_set.tfe_variable_set_id
    },
    "github_pat_token" = {
      create_variable = true
      value           = var.github_pat_token
      category        = "terraform"
      description     = "Github Personal Access Token"
      hcl             = false
      key             = "github_pat_token"
      sensitive       = true
      variable_set_id = module.variable_set.tfe_variable_set_id
    },
    "github_repository" = {
      create_variable = true
      value           = var.github_repository
      category        = "terraform"
      description     = "Github Repository to add to Github workspace"
      hcl             = false
      key             = "github_repository"
      sensitive       = false
      variable_set_id = module.variable_set.tfe_variable_set_id
    },
    "organization_name" = {
      create_variable = true
      value           = local.organization_name
      category        = "terraform"
      description     = "Terraform Cloud Organization"
      hcl             = false
      key             = "organization_name"
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
    },
    "working_directory" = {
      create_variable = true
      value           = local.organization_name
      category        = "terraform"
      description     = "Terraform Cloud Working Directory"
      hcl             = false
      key             = "working_directory"
      sensitive       = false
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
*/
