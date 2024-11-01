resource "aws_lb" "alb" {
  name               = "Application-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.public_subnet_id


#   access_logs {
#     bucket  = aws_s3_bucket.lb_logs.id
#     prefix  = "test-lb"
#     enabled = true
#   }

  tags = {
    Environment = "dev"
  }
}

# Creating a ALB Listener
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

# Creating a Target Group
resource "aws_lb_target_group" "alb_target_group" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

# Creating a Target Group attachment
resource "aws_lb_target_group_attachment" "alb_tg_attachments" {
  count = length((var.instances))
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = var.instances[count.index]
  port             = 80
}