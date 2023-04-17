data "aws_ami" "ami-01" {
  most_recent = true
}

resource "aws_instance" "ec2-01" {
  ami = data.aws_ami.ami-01
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  associate_public_ip_address = true
  security_groups = [var.security_groups]
}
