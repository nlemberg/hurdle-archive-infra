variable "proj_name" {
  type        = string
}

variable "vpc_cidr" {
  type        = string
  default = "10.0.0.0/16"
}

variable "sub_a_cidr" {
  type        = string
  default = "10.0.1.0/24"
}

variable "sub_b_cidr" {
  type        = string
  default = "10.0.2.0/24"
}

variable "sub_a_az" {
  type        = string
  default = "us-east-1a"
}

variable "sub_b_az" {
  type        = string
  default = "us-east-1b"
}
