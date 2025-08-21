resource "aws_lb" "app_lb" {
  name               = "flask-express-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.public_subnets
  security_groups    = [aws_security_group.alb_sg.id]
}

resource "aws_security_group" "alb_sg" {
  name   = "alb-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb_target_group" "flask" {
  name     = "flask-tg"
  port     = 5000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip"
}

resource "aws_lb_target_group" "express" {
  name     = "express-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip"
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Not found"
      status_code  = "404"
    }
  }
}

resource "aws_lb_listener_rule" "flask" {
  listener_arn = aws_lb_listener.http.arn

  conditions {
    path_pattern {
      values = ["/flask"]
    }
  }

  actions {
    type             = "forward"
    target_group_arn = var.flask_target_group_arn
  }
}

resource "aws_lb_listener_rule" "express" {
  listener_arn = aws_lb_listener.http.arn

  conditions {
    path_pattern {
      values = ["/express"]
    }
  }

  actions {
    type             = "forward"
    target_group_arn = var.express_target_group_arn
  }
}

output "alb_dns_name" {
  value = aws_lb.app_lb.dns_name
}
