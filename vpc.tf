# ------------------------------------------------------------#
#
#  VPC
#
# ------------------------------------------------------------#
resource "aws_vpc" "this" {
  cidr_block           = var.vpc.cidr_block
  instance_tenancy     = var.vpc.instance_tenancy
  enable_dns_hostnames = var.vpc.enable_dns_hostnames
  enable_dns_support   = var.vpc.enable_dns_support

  tags = {
    Name = var.vpc.name
  }
}
