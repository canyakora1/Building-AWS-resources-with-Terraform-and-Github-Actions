# VPC
resource "aws_vpc" "playroom-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "playroom-vpc"
  }
}

# Subnets
resource "aws_subnet" "playroom-subnet-public" {
    count = length(var.public_subnet_cidr)
    vpc_id = aws_vpc.playroom-vpc.id
    cidr_block = var.public_subnet_cidr[count.index]
    availability_zone = data.aws_availability_zones.available.names[count.index]
    map_public_ip_on_launch = true

    tags = {
      "Name" = var.public_subnet_names[count.index]
    }
  
}

resource "aws_subnet" "playroom-subnet-private" {
    count = length(var.private_subnet_cidr)
    vpc_id = aws_vpc.playroom-vpc.id
    cidr_block = var.private_subnet_cidr[count.index]

    tags = {
      "Name" = var.private_subnet_names[count.index]
    }
  
}
# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.playroom-vpc.id

  tags = {
    Name = "playroom-igw"
  }
}

# Route Table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.playroom-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "playroom-public-rt"
  }
}

# Route Table Association
resource "aws_route_table_association" "public-subnet-rt-association" {
  count = length(var.public_subnet_cidr)
  subnet_id      = aws_subnet.playroom-subnet-public[count.index].id
  route_table_id = aws_route_table.public-rt.id
}