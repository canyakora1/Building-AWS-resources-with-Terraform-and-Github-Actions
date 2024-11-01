resource "aws_instance" "web-server" {
  count = length(var.ec2_names)
  ami           = data.aws_ami.amazon-linux.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true
  subnet_id = var.public_subnet[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  user_data = <<EOF
  #!/bin/bash
  dnf install curl git wget php-mysqlnd httpd php-fpm php-mysqli mariadb105-server php-json php php-devel -y
  EOF

  tags = {
    Name = var.ec2_names[count.index]
  }
}