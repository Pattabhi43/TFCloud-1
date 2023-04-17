variable "vpc_cidr" {}

variable "subnet_cidr" {}

variable "pvt_cidr" {}

variable "pub_ip" {
    default = "0.0.0.0/0"
}