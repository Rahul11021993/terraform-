resource "aws_lb_target_group" "target_elb" {
  name     = "ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-033a86c15b0b9ce07"
  health_check {
    path     = "/health"
    port     = 80
    protocol = "HTTP"
  }
}

# Example: main.tf or loadbalancer.tf in ~/myproject/Load balancer/

resource "aws_lb" "external-alb" {
  name               = "myproject"   # Choose a unique name for your ALB
  internal           = true          # Set to true for an internal LB
  load_balancer_type = "application" # Or "network" for an NLB
  # Replace with actual subnet IDs where your ALB should be deployed
  # These subnets should be public if it's an external ALB
  subnets = [
    "subnet-0cb6c2cfd616ab99f","subnet-0ceb864435741a1c2" # Replace with your actual public subnet ID 1

  ]
  # Replace with actual security group IDs that allow traffic to your ALB
  security_groups = [
    "sg-0b1a65a3a965b526b", # Replace with your actual security group ID
  ]
  # Optional: IP address type (ipv4 or dualstack)
  ip_address_type = "ipv4"

  tags = {
    Name        = "my-external-alb"
    Environment = "Dev" # Or whatever your environment variable is
  }
}

# You will also typically need an aws_lb_target_group and aws_lb_listener
# to route traffic to your instances.

# Example Target Group (for HTTP traffic to instances)
resource "aws_lb_target_group" "web_tg" {
  name     = "web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-033a86c15b0b9ce07" # Replace with your actual VPC ID

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  tags = {
    Name        = "web-tg"
    Environment = "Dev"
  }
}

# Example Listener (for HTTP traffic on port 80)
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.external-alb.arn # Referencing the ALB's ARN
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn # Referencing the Target Group's ARN
  }

  tags = {
    Name = "http-listener"
  }
}