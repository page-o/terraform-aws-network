# ------------------------------------------------------------#
#
#  Subnet
#
# ------------------------------------------------------------#
# Public Subnet
resource "aws_subnet" "public" {
  count = length(var.public_subnets)

  vpc_id                  = aws_vpc.this.id
  map_public_ip_on_launch = true
  cidr_block              = element(var.public_subnets.*.cidr, count.index)
  availability_zone       = element(var.public_subnets.*.az, count.index)

  tags = {
    Name = element(var.public_subnets.*.name, count.index)
  }
}


# Private Subnet
resource "aws_subnet" "private" {
  count = length(var.private_subnets)

  vpc_id                  = aws_vpc.this.id
  map_public_ip_on_launch = false
  cidr_block              = element(var.private_subnets.*.cidr, count.index)
  availability_zone       = element(var.private_subnets.*.az, count.index)

  tags = {
    Name = element(var.private_subnets.*.name, count.index)
  }
}


# Secondary Private Subnet
resource "aws_subnet" "private_secondary" {
  count = length(var.private_secondary_subnets)

  vpc_id                  = aws_vpc.this.id
  map_public_ip_on_launch = false
  cidr_block              = element(var.private_secondary_subnets.*.cidr, count.index)
  availability_zone       = element(var.private_secondary_subnets.*.az, count.index)

  tags = {
    Name = element(var.private_secondary_subnets.*.name, count.index)
  }
}
