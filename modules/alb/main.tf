resource "aws_lb" "lb-01" {
  name = var.lb-name
  subnets = var.subnets
  internal = false
  security_groups = [var.security_groups]
  enable_deletion_protection = var.del_protect
  load_balancer_type = var.lb_type
}

resource "aws_lb_target_group" "tg-01" {
  port = var.lb_port
  protocol = var.lb_protocol
  vpc_id = var.vpc_id
  name = var.tgt-Name
}

resource "aws_lb_listener" "ear-01" {
    load_balancer_arn = aws_lb.lb-01.arn
    port = var.lb_port
    protocol = var.lb_protocol
    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.tg-01.arn
    }
}
