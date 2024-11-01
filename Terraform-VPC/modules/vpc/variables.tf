variable "vpc_cidr" {
    description = "VPC CIDR Range"
    type = string
}

variable "public_subnet_cidr" {
  description = "Public Subnet CIDR"
  type = list(string)
}

variable "private_subnet_cidr" {
  description = "Private Subnet CIDR"
  type = list(string)
}

variable "public_subnet_names" {
    description = "Public Subnet Names"
    type = list(string)
    default = [ "Public-subnet-1", "Public-subnet-2" ]
}

variable "private_subnet_names" {
    description = "Private Subnet Names"
    type = list(string)
    default = [ "Private-subnet-1", "Private-subnet-2" ]
}