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