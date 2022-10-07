module "network" {
  source = "../../"

  vpc = {
    cidr_block = local.vpc_cidr_block
    name       = "vpc-${local.project}-${local.env}"
  }
  public_subnets = [
    {
      cidr = local.public_subnet1_cidr_block
      az   = "ap-northeast-1a"
      name = "public-subnet-${local.project}-${local.env}"
    },
    {
      cidr = local.public_subnet2_cidr_block
      az   = "ap-northeast-1c"
      name = "public-subnet-${local.project}-${local.env}"
    }
  ]
  public_subnets_route_table_name = "public-subnet-route-table-${local.project}-${local.env}"
  private_subnets = [
    {
      cidr             = local.private_subnet1_cidr_block
      az               = "ap-northeast-1a"
      name             = "private-subnet-${local.project}-${local.env}"
      route_table_name = "private-subnet-route-table-1a-${local.project}-${local.env}"
    },
    {
      cidr             = local.private_subnet2_cidr_block
      az               = "ap-northeast-1c"
      name             = "private-subnet-${local.project}-${local.env}"
      route_table_name = "private-subnet-route-table-1c-${local.project}-${local.env}"
    }
  ]
  private_secondary_subnets = [
    {
      cidr = local.private_secondary_subnet1_cidr_block
      az   = "ap-northeast-1a"
      name = "private-db-subnet-${local.project}-${local.env}"
    },
    {
      cidr = local.private_secondary_subnet2_cidr_block
      az   = "ap-northeast-1c"
      name = "private-db-subnet-${local.project}-${local.env}"
    }
  ]
  private_secondary_subnets_route_table_name = "private-db-subnet-route-table-${local.project}-${local.env}"
  gateway = {
    igw_name = "igw-${local.project}-${local.env}"
    ngw_names = [
      "ngw-1a-${local.project}-${local.env}",
      "ngw-1c-${local.project}-${local.env}"
    ]
  }
}
