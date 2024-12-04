output "ec2_instances" {
  value = {
    Aara   = aws_instance.aara.public_ip
    Suriya = aws_instance.suriya.public_ip
  }
}
output "alb_dns_name" {
  value = aws_lb.main.dns_name
  description = "DNS name of the ALB"
}
