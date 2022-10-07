variable "vpc" {
  description = "VPC"
  type = object({
    cidr_block           = string
    name                 = string
    instance_tenancy     = optional(string, "default")
    enable_dns_hostnames = optional(bool, true)
    enable_dns_support   = optional(bool, true)
  })
}

variable "public_subnets" {
  description = "Public Subnets"
  type = list(object({
    cidr = string
    az   = string
    name = string
  }))
}

variable "public_subnets_route_table_name" {
  description = "Public Subnet Route Table Name Tag"
  type        = string
}

variable "private_subnets" {
  description = "Private Subnets"
  type = list(object({
    cidr             = string
    az               = string
    name             = string
    route_table_name = string
  }))
}

variable "private_secondary_subnets" {
  description = "Secondary Private Subnets"
  type = list(object({
    cidr = string
    az   = string
    name = string
  }))
}

variable "private_secondary_subnets_route_table_name" {
  description = "Secondary Private Subnet Route Table Name Tag"
  type        = string
}

variable "gateway" {
  description = "Gateway such as Internet Gateway and NAT Gateway"
  type = object({
    igw_name  = string
    ngw_names = list(string)
  })
}
