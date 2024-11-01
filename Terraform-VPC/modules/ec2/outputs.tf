output "instances" {
    value = aws_instance.web-server.*.id
}