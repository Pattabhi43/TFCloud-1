resource "aws_security_group" "sg-01" {
    name = var.sg-name
    vpc_id = var.vpc_id

    ingress {
        from_port = var.port
        to_port = var.port
        protocol = var.protocol
        cidr_blocks = var.in_cidr
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
