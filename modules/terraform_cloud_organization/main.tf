

module "organization" {
  source              = "BrynardSecurity-terraform/terraform-cloud/tfe"
  version             = "0.1.5"
  admin_email         = var.admin_email
  name                = var.organization_name
  create_organization = var.create_organization
}


