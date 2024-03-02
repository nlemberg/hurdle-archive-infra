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

variable "sub_a_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "sub_b_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "sub_a_az" {
  type    = string
  default = "us-east-1a"
}

variable "sub_b_az" {
  type    = string
  default = "us-east-1b"
}
