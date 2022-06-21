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


