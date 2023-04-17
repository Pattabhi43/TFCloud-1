output "vpc_id" {
  value = aws_vpc.vpc-01.id
}

output "pbsn_id" {
  value = aws_subnet.pb-01.id
}

output "pvts_id" {
  value = aws_subnet.pvt-01.id
}