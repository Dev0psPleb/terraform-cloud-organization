# tfe_oauth_client

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_oauth_client"></a> [oauth\_client](#module\_oauth\_client) | BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_oauth_client | 0.1.5 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_url"></a> [api\_url](#input\_api\_url) | (Required) The base URL of your VCS provider's API (e.g. https://api.github.com or https://ghe.example.com/api/v3). | `string` | `"https://api.github.com"` | no |
| <a name="input_https_url"></a> [https\_url](#input\_https\_url) | (Required) The homepage of your VCS provider (e.g. https://github.com or https://ghe.example.com). | `string` | `"https://github.com"` | no |
| <a name="input_oauth_token"></a> [oauth\_token](#input\_oauth\_token) | GitHub Personal Access Token | `string` | `""` | no |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | (Required) Name of the Terraform organization. | `string` | n/a | yes |
| <a name="input_service_provider"></a> [service\_provider](#input\_service\_provider) | (Required) The VCS provider being connected with. Valid options are ado\_server, ado\_services, bitbucket\_hosted, bitbucket\_server, github, github\_enterprise, gitlab\_hosted, gitlab\_community\_edition, or gitlab\_enterprise\_edition. | `string` | `"github"` | no |
| <a name="input_tfe_oauth_client_name"></a> [tfe\_oauth\_client\_name](#input\_tfe\_oauth\_client\_name) | The name of the Terraform Cloud Oauth Client | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_oauth_client_id"></a> [oauth\_client\_id](#output\_oauth\_client\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->