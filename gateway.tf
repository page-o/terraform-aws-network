# ------------------------------------------------------------#
#
#  Internet Gateway
#
# ------------------------------------------------------------#
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = var.gateway.igw_name
  }
}

# ------------------------------------------------------------#
#
#  NAT Gateway
#
# ------------------------------------------------------------#
resource "aws_eip" "this" {
  count = length(var.gateway.ngw_names)
}

resource "aws_nat_gateway" "this" {
  count = length(var.gateway.ngw_names)

  allocation_id = element(aws_eip.this.*.id, count.index)
  subnet_id     = element(aws_subnet.public.*.id, count.index)

  tags = {
    Name = element(var.gateway.ngw_names, count.index)
  }
}
