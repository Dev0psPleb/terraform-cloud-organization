variable "admin_email" {
  description = "Email address of the Terraform Cloud Organization Administrator"
  type        = string
  default     = "publiccloud@sophos.com"
}
variable "api_url" {
  description = "(Required) The base URL of your VCS provider's API (e.g. https://api.github.com or https://ghe.example.com/api/v3)."
  type        = string
  default     = "https://api.github.com"
}
variable "create_organization" {
  description = "Boolean: Whether to create the TFC organization"
  type        = bool
  default     = true
}
variable "github_pat_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
  default     = ""
}
variable "https_url" {
  description = "(Required) The homepage of your VCS provider (e.g. https://github.com or https://ghe.example.com)."
  type        = string
  default     = "https://github.com"
}
variable "organization_name" {
  description = "(Required) Name of the Terraform organization."
  type        = string
}
variable "service_provider" {
  description = "(Required) The VCS provider being connected with. Valid options are ado_server, ado_services, bitbucket_hosted, bitbucket_server, github, github_enterprise, gitlab_hosted, gitlab_community_edition, or gitlab_enterprise_edition."
  type        = string
  default     = "github"
}
variable "tfe_oauth_client_name" {
  description = "The name of the Terraform Cloud Oauth Client"
  type        = string
  default     = ""
}
