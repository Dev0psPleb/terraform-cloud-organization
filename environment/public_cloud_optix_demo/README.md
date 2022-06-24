# public_cloud_optix_demo

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.30.2 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_oauth_client"></a> [oauth\_client](#module\_oauth\_client) | ../../modules/tfe_oauth_client | n/a |
| <a name="module_organization"></a> [organization](#module\_organization) | ../../modules/terraform_cloud_organization | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_vcs_repo"></a> [add\_vcs\_repo](#input\_add\_vcs\_repo) | Whether or not to add a VCS repo to this workspace | `bool` | `false` | no |
| <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email) | Email address of the Terraform Cloud Organization Administrator | `string` | `"publiccloud@sophos.com"` | no |
| <a name="input_allow_destroy_plan"></a> [allow\_destroy\_plan](#input\_allow\_destroy\_plan) | Whether destroy plans can be queued on the workspace | `bool` | `false` | no |
| <a name="input_api_url"></a> [api\_url](#input\_api\_url) | (Required) The base URL of your VCS provider's API (e.g. https://api.github.com or https://ghe.example.com/api/v3). | `string` | `"https://api.github.com"` | no |
| <a name="input_auto_apply"></a> [auto\_apply](#input\_auto\_apply) | Whether to automatically apply changes when a Terraform plan is successful. Defaults to false | `bool` | `false` | no |
| <a name="input_create_organization"></a> [create\_organization](#input\_create\_organization) | Boolean: Whether to create the TFC organization | `bool` | `true` | no |
| <a name="input_execution_mode"></a> [execution\_mode](#input\_execution\_mode) | Which execution mode to use. Available options: remote, local, or agent | `string` | `"remote"` | no |
| <a name="input_file_triggers_enabled"></a> [file\_triggers\_enabled](#input\_file\_triggers\_enabled) | Whether to filter runs based on the changed files in a VCS push. Defaults to true. If enabled, the working directory and trigger prefixes describe a set of paths which must contain changes for a VCS push to trigger a run. If disabled, any push will trigger a run. | `bool` | `true` | no |
| <a name="input_github_pat_token"></a> [github\_pat\_token](#input\_github\_pat\_token) | GitHub Personal Access Token | `string` | n/a | yes |
| <a name="input_global_remote_state"></a> [global\_remote\_state](#input\_global\_remote\_state) | (Optional) Whether the workspace allows all workspaces in the organization to access its state data during runs. If false, then only specifically approved workspaces can access its state (remote\_state\_consumer\_ids). | `bool` | `false` | no |
| <a name="input_https_url"></a> [https\_url](#input\_https\_url) | (Required) The homepage of your VCS provider (e.g. https://github.com or https://ghe.example.com). | `string` | `"https://github.com"` | no |
| <a name="input_oauth_token_id"></a> [oauth\_token\_id](#input\_oauth\_token\_id) | The output of the tfe\_oauth\_client module. | `string` | `""` | no |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | (Required) Name of the Terraform organization. | `string` | n/a | yes |
| <a name="input_queue_all_runs"></a> [queue\_all\_runs](#input\_queue\_all\_runs) | (Optional) Whether the workspace should start automatically performing runs immediately after its creation. Defaults to true. When set to false, runs triggered by a webhook (such as a commit in VCS) will not be queued until at least one run has been manually queued. Note: This default differs from the Terraform Cloud API default, which is false. The provider uses true as any workspace provisioned with false would need to then have a run manually queued out-of-band before accepting webhooks. | `bool` | `false` | no |
| <a name="input_service_provider"></a> [service\_provider](#input\_service\_provider) | (Required) The VCS provider being connected with. Valid options are ado\_server, ado\_services, bitbucket\_hosted, bitbucket\_server, github, github\_enterprise, gitlab\_hosted, gitlab\_community\_edition, or gitlab\_enterprise\_edition. | `string` | `"github"` | no |
| <a name="input_speculative_enabled"></a> [speculative\_enabled](#input\_speculative\_enabled) | Optional) Whether this workspace allows speculative plans. Defaults to true. Setting this to false prevents Terraform Cloud or the Terraform Enterprise instance from running plans on pull requests, which can improve security if the VCS repository is public or includes untrusted contributors. | `bool` | `true` | no |
| <a name="input_structured_run_output_enabled"></a> [structured\_run\_output\_enabled](#input\_structured\_run\_output\_enabled) | (Optional) Whether this workspace should show output from Terraform runs using the enhanced UI when available. Defaults to true. Setting this to false ensures that all runs in this workspace will display their output as text logs. | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to workspace | `list(string)` | `[]` | no |
| <a name="input_tfe_token"></a> [tfe\_token](#input\_tfe\_token) | Token from the TFE account for the TFE provider API access | `string` | `""` | no |
| <a name="input_vcs_branch"></a> [vcs\_branch](#input\_vcs\_branch) | (Optional) The repository branch that Terraform will execute from. This defaults to the repository's default branch (e.g. main). | `string` | `"main"` | no |
| <a name="input_vcs_repository"></a> [vcs\_repository](#input\_vcs\_repository) | The VCS Repository to add to the workspace | `string` | `""` | no |
| <a name="input_working_directory"></a> [working\_directory](#input\_working\_directory) | Working directory of the VCS repository from which TF plans are run | `string` | `"/"` | no |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | Workspace name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
