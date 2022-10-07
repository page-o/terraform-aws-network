![Terraform](https://www.datocms-assets.com/2885/1620155113-brandhcterraformprimaryattributedcolor.svg)
# terraform-aws-network
Terraform module to create common Network resources such as VPC/Subnets/Gateways/Route Tables.

Creates the following resources:

- VPC
- Public Subnet
- Private Subnet
- Internet Gateway
- NAT Gateway
- Route table


## Examples

Check the [examples](/examples/) folder.

## Usage

```
module "hoge" {
  source = "page-o/network/aws"

  vpc = {
    cidr_block = "172.16.0.0/16"
    name       = "vpc"
  }
  public_subnets = [
    {
      cidr = "172.16.0.0/24"
      az   = "ap-northeast-1a"
      name = "public-1a"
    },
    {
      cidr = "172.16.4.0/24"
      az   = "ap-northeast-1c"
      name = "public-1c"
    }
  ]
  public_subnets_route_table_name = "public-route-table"
  private_subnets = [
    {
      cidr             = "172.16.32.0/24"
      az               = "ap-northeast-1a"
      name             = "private-1a"
      route_table_name = "private-route-table-1a"
    },
    {
      cidr             ="172.16.36.0/24"
      az               = "ap-northeast-1c"
      name             = "private-1c"
      route_table_name = "private-route-table-1c"
    }
  ]
  private_secondary_subnets = [
    {
      cidr = "172.16.64.0/24"
      az   = "ap-northeast-1a"
      name = "private-db-1a"
    },
    {
      cidr = "172.16.68.0/24"
      az   = "ap-northeast-1c"
      name = "private-db-1c"
    }
  ]
  private_secondary_subnets_route_table_name = "private-db-route-table"
  gateway = {
    igw_name = "internet-gateway"
    ngw_names = [
      "nat-gateway-1a",
      "nat-gateway-1c"
    ]
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vpc | VPC | `object` | - | yes |
| vpc.cidr_block | VPC Cidr | `string` | - | yes |
| vpc.name | VPC Name Tag | `string` | - | yes |
| vpc.instance_tenancy | VPC Instance Tenancy setting | `string` | `default`` | no |
| vpc.enable_dns_hostnames | VPC Enabling DNS Hostnames | `bool` | `true` | no |
| vpc.enable_dns_support | VPC Enabling DNS Support | `bool` | `true` | no |
| public_subnets | Public Subnets | `list(object)` | - | yes |
| public_subnets.*.cidr | Public Subnet Cidr | `string` | - | yes |
| public_subnets.*.az | Public Subnet Availability Zone | `string` | - | yes |
| public_subnets.*.name | Public Subnet Name Tag | `string` | - | yes |
| public_subnets_route_table_name | Public Subnet Route Table Name Tag | `string` | - | yes |
| private_subnets | Private Subnets | `list(object)` | - | yes |
| private_subnets.*.cidr | Private Subnet Cidr | `string` | - | yes |
| private_subnets.*.az | Private Subnet Availability Zone | `string` | - | yes |
| private_subnets.*.name | Private Subnet Name Tag | `string` | - | yes |
| private_subnets.*.route_table_name | Private Subnet Route Table Name Tag | `string` | - | yes |
| private_secondary_subnets | Secondary Private Subnets | `list(object)` | - | yes |
| private_secondary_subnets.*.cidr | Secondary Private Subnet Cidr | `string` | - | yes |
| private_secondary_subnets.*.az | Secondary Private Subnet Availability Zone | `string` | - | yes |
| private_secondary_subnets.*.name | Secondary Private Subnet Name Tag| `string` | - | yes |
| private_secondary_subnets_route_table_name | Secondary Private Subnet Route Table Name Tag | `string` | - | yes |
| gateway | Gateway such as Internet Gateway and NAT Gateway | `object` | - | yes |
| gateway.igw_name | Internet Gateway Name Tag| `string` | - | yes |
| gateway.ngw_names | NAT Gateway Name Tags | `list(string)` | - | yes |

## Outputs

| Name | Description | Type |
|------|-------------|------|
| vpc_id | VPC ID | `string` |
| public_subnet_ids | Public Subnets IDs | `list(string)` |
| private_subnet_ids | Private Subnets IDs | `list(string)` |
| private_secondary_subnet_ids | Secondary Private Subnets IDs | `list(string)` |
