output "vpc_id" {
  description = "VPC ID"
  value = aws_vpc.myvpc.id  
}

output "public_subnet_ids" {
  value = aws_subnet.my-subnet-public-useast2[*].id
  description = "Public Subnet IDs"
  }

output "private_subnet_ids" {
  value = aws_subnet.my-subnet-private-useast2[*].id
  description = "Private Subnet IDs"
  }