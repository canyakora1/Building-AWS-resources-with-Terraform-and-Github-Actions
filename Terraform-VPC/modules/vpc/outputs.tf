output "vpc_id" {
    value = aws_vpc.playroom-vpc.id
}

output "private_subnet_id" {
    value = aws_subnet.playroom-subnet-private.*.id
  
}

output "public_subnet_id" {
  value = aws_subnet.playroom-subnet-public.*.id
}

