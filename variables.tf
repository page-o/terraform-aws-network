variable "vpc" {
  type = object({
    cidr_block           = string
    name                 = string
    instance_tenancy     = optional(string, "default")
    enable_dns_hostnames = optional(bool, true)
    enable_dns_support   = optional(bool, true)
  })
}

variable "public_subnets" {
  type = list(object({
    cidr = string
    az   = string
    name = string
  }))
}

variable "public_subnets_route_table_name" {
  type = string
}

variable "private_subnets" {
  type = list(object({
    cidr             = string
    az               = string
    name             = string
    route_table_name = string
  }))
}

variable "private_secondary_subnets" {
  type = list(object({
    cidr = string
    az   = string
    name = string
  }))
}

variable "private_secondary_subnets_route_table_name" {
  type = string
}

variable "gateway" {
  type = object({
    igw_name  = string
    ngw_names = list(string)
  })
}
