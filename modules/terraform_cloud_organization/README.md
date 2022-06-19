# terraform_cloud_organization

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_organization"></a> [organization](#module\_organization) | BrynardSecurity-terraform/terraform-cloud/tfe | 0.1.5 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email) | Email address of the Terraform Cloud Organization Administrator | `string` | `"publiccloud@sophos.com"` | no |
| <a name="input_api_url"></a> [api\_url](#input\_api\_url) | (Required) The base URL of your VCS provider's API (e.g. https://api.github.com or https://ghe.example.com/api/v3). | `string` | `"https://api.github.com"` | no |
| <a name="input_create_organization"></a> [create\_organization](#input\_create\_organization) | Boolean: Whether to create the TFC organization | `bool` | `true` | no |
| <a name="input_github_pat_token"></a> [github\_pat\_token](#input\_github\_pat\_token) | GitHub Personal Access Token | `string` | `""` | no |
| <a name="input_https_url"></a> [https\_url](#input\_https\_url) | (Required) The homepage of your VCS provider (e.g. https://github.com or https://ghe.example.com). | `string` | `"https://github.com"` | no |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | (Required) Name of the Terraform organization. | `string` | n/a | yes |
| <a name="input_service_provider"></a> [service\_provider](#input\_service\_provider) | (Required) The VCS provider being connected with. Valid options are ado\_server, ado\_services, bitbucket\_hosted, bitbucket\_server, github, github\_enterprise, gitlab\_hosted, gitlab\_community\_edition, or gitlab\_enterprise\_edition. | `string` | `"github"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_organization_id"></a> [organization\_id](#output\_organization\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
