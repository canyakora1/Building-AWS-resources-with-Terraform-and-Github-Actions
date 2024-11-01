variable "security_group_id" {
    description = "Public SG id for Applicaton Load Balancer"
    type = string
  
}

variable "public_subnet_id" {
    description = "Public subnet for Application"
    type = list(string)
  
}

variable "vpc_id" {
    description = "VPC ID"
    type = string
  
}

variable "instances" {
    description = "EC2 Instance id for target group attachmens"
    type = list(string)
  
}