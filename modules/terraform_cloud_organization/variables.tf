variable "admin_email" {
  description = "Email address of the Terraform Cloud Organization Administrator"
  type        = string
  default     = "publiccloud@sophos.com"
}
variable "create_organization" {
  description = "Boolean: Whether to create the TFC organization"
  type        = bool
  default     = true
}
variable "organization_name" {
  description = "(Required) Name of the Terraform organization."
  type        = string
}
