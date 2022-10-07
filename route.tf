# ------------------------------------------------------------#
#
#  Route table
#
# ------------------------------------------------------------#
# Public Subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = var.public_subnets_route_table_name
  }
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnets)

  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}


# Private Subnet
resource "aws_route_table" "private" {
  count = length(var.gateway.ngw_names)

  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.this.*.id, count.index)
  }

  tags = {
    Name = element(var.private_subnets.*.route_table_name, count.index)
  }
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnets)

  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}


# Secondary Private Subnet
resource "aws_route_table" "private_secondary" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = var.public_subnets_route_table_name
  }
}

resource "aws_route_table_association" "private_secondary" {
  count = length(var.private_secondary_subnets)

  subnet_id      = element(aws_subnet.private_secondary.*.id, count.index)
  route_table_id = aws_route_table.private_secondary.id
}
