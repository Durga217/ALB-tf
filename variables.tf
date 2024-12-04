variable "vpc_id" {
  default = "vpc-0c0dd7fa0fd720322"
}
variable "subnet_ids" {
  default = ["subnet-0cf3685471085e39c", "subnet-0b730b55f59ae1403"]
}
variable "internet_gateway_id" {
  default = "igw-09b2012d0a76b2220"
}
variable "route_table_id" {
  default = "rtb-0a701469359517c9e"
}
variable "hosted_zone_id" {
  default = "Z10447028HVKYK1G8XKP"
}
variable "domain_name" {
  default = "saamadev.com"
}
variable "instance_names" {
  default = ["Aara", "Suriya"]
}
variable "instance_ami" {
  default = "ami-0dee22c13ea7a9a67"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "security_groups" {
  default = {
    alb_sg     = "sg-0186d5ddc354e4199"
    instance_sg = "sg-059e228b185e32004"
    ssh_sg     = "sg-0703d8afd0b70d872"
  }
}
variable "key_name" {
  description = "The name of the PEM key pair for EC2 instances"
  default     = "Test-Durga"
}
