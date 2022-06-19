provider "tfe" {}

module "esg_se_xdr_demo_prod" {
  source              = "../../modules/terraform_cloud_organization"
  admin_email         = var.admin_email
  organization_name   = var.organization_name
  create_organization = var.create_organization
}
