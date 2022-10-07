output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "Public Subnets IDs"
  value       = aws_subnet.public.*.id
}

output "private_subnet_ids" {
  description = "Private Subnets IDs"
  value       = aws_subnet.private.*.id
}

output "private_secondary_subnet_ids" {
  description = "Secondary Private Subnets IDs"
  value       = aws_subnet.private_secondary.*.id
}
