variable "proj_name" {
  type        = string
}

variable "subnet_ids" {
  type        = list(string)
}

variable "node_group_instance_types" {
    description = "eks node group instance type"
    default = "t3a.medium"
  type        = string
}

variable "node_group_desired_size" {
    description = "eks node group desired size"
    default = 2
  type        = number
}

variable "node_group_max_size" {
    description = "eks node group max size"
    default = 3
  type        = number
}

variable "node_group_min_size" {
    description = "eks node group min size"
    default = 1
  type        = number
}

variable "node_group_max_unavailable" {
    description = "eks node group max unavailable"
    default = 1
  type        = number
}
