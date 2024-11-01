variable "security_group_id" {
    description = "Security Group for Jump Server"
    type = string
  
}

variable "public_subnet" {
    description = "Public subnet for ec2"
    type = list(string)
}

variable "ec2_names" {
    description = "value"
    type = list(string)
    default = [ "web-server-1", "web-server-2" ]

}