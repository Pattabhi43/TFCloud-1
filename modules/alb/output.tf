output "lb-01" {
  value = aws_lb.lb-01.id
}

output "tg-01" {
  value = aws_lb_target_group.tg-01.id
}

output "ear-01" {
  value = aws_lb_listener.ear-01.id
}