variable "vpc_cidr" {
  description = "value"
  type        = string

}

variable "public_subnet_cidr" {
  description = "Public Subnet CIDR"
  type        = list(string)
}

variable "private_subnet_cidr" {
  description = "Private Subnet CIDR"
  type        = list(string)
}