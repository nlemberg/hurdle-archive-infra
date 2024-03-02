variable "proj_name" {
  type        = string
}

variable "vpc_cidr" {
  type        = string
  default = "10.0.0.0/16"
}

variable "subnet_count" {
  type        = number
}