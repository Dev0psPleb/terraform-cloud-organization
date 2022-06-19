provider "tfe" {}

module "organization" {
  source              = "../../modules/terraform_cloud_organization"
  admin_email         = var.admin_email
  organization_name   = var.organization_name
  create_organization = var.create_organization
}

module "oauth_client" {
  source                = "../../modules/terraform_cloud_organization"
  depends_on            = [module.organization]
  api_url               = var.api_url
  https_url             = var.https_url
  github_pat_token      = var.github_pat_token
  organization_name     = var.organization_name
  service_provider      = var.service_provider
  tfe_oauth_client_name = "Terraform Cloud - ${var.organization_name}"
}
