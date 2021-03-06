# terraform

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.30.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_oauth_client"></a> [oauth\_client](#module\_oauth\_client) | BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_oauth_client | 0.1.5 |
| <a name="module_organization"></a> [organization](#module\_organization) | BrynardSecurity-terraform/terraform-cloud/tfe | 0.1.5 |
| <a name="module_workspace"></a> [workspace](#module\_workspace) | BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_workspace | 0.1.5 |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.tfc_organization](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | AWS Account ID | `string` | `""` | no |
| <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email) | Organization Administrator Email Address | `string` | n/a | yes |
| <a name="input_api_url"></a> [api\_url](#input\_api\_url) | (Required) The base URL of your VCS provider's API (e.g. https://api.github.com or https://ghe.example.com/api/v3). | `string` | `"https://api.github.com"` | no |
| <a name="input_create_organization"></a> [create\_organization](#input\_create\_organization) | Boolean: Whether to create the TFC organization | `bool` | `true` | no |
| <a name="input_github_pat_token"></a> [github\_pat\_token](#input\_github\_pat\_token) | GitHub Personal Access Token | `string` | n/a | yes |
| <a name="input_github_repository"></a> [github\_repository](#input\_github\_repository) | Github Repository to add to Github workspace | `string` | `""` | no |
| <a name="input_https_url"></a> [https\_url](#input\_https\_url) | (Required) The homepage of your VCS provider (e.g. https://github.com or https://ghe.example.com). | `string` | `"https://github.com"` | no |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | (Required) Name of the Terraform organization. | `string` | n/a | yes |
| <a name="input_service_provider"></a> [service\_provider](#input\_service\_provider) | (Required) The VCS provider being connected with. Valid options are ado\_server, ado\_services, bitbucket\_hosted, bitbucket\_server, github, github\_enterprise, gitlab\_hosted, gitlab\_community\_edition, or gitlab\_enterprise\_edition. | `string` | `"github"` | no |
| <a name="input_terraform_api_token"></a> [terraform\_api\_token](#input\_terraform\_api\_token) | Terraform Cloud API Token | `string` | n/a | yes |
| <a name="input_working_directory"></a> [working\_directory](#input\_working\_directory) | Working directory of the VCS repo. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_oauth_client_id"></a> [oauth\_client\_id](#output\_oauth\_client\_id) | n/a |
| <a name="output_organization_id"></a> [organization\_id](#output\_organization\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
