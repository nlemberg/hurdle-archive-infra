variable "region" {
  description = "aws region"
  type        = string
}

variable "profile" {
  description = "aws profile/owner tag"
  type        = string
}

variable "bootcamp" {
  description = "mandatory tag"
  type        = number
}

variable "expiration_date" {
  description = "mandatory tag"
  type        = string
}

variable "proj_name" {
  type = string
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_count" {
  description = "number of subnets"
  type        = number
}

variable "node_group_instance_types" {
  description = "eks node group instance type"
  default     = "t3a.medium"
  type        = string
}

variable "node_group_desired_size" {
  description = "eks node group desired size"
  default     = 2
  type        = number
}

variable "node_group_max_size" {
  description = "eks node group max size"
  default     = 3
  type        = number
}

variable "node_group_min_size" {
  description = "eks node group min size"
  default     = 1
  type        = number
}

variable "node_group_max_unavailable" {
  description = "eks node group max unavailable"
  default     = 1
  type        = number
}

variable "gitops_repo_url" {
  type = string
}

variable "argocd_github_secret_arn" {
  description = "arn of secret github credentials for argocd "
  type        = string
}

variable "argocd_admin_pass_arn" {
  description = "arn of argocd admin password"
  type        = string
}