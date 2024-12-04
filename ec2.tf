resource "aws_instance" "aara" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.key_name  # Reference the key name here
  subnet_id     = var.subnet_ids[0]  # First subnet for Aara
  security_groups = [var.security_groups["instance_sg"]]  # Using security group for EC2 instances
  tags = {
    Name = "Aara"
  }
  user_data = data.template_file.apache_userdata_aara.rendered
}
resource "aws_instance" "suriya" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.key_name  # Reference the key name here
  subnet_id     = var.subnet_ids[1]  # Second subnet for Suriya
  security_groups = [var.security_groups["instance_sg"]]  # Using security group for EC2 instances
  tags = {
    Name = "Suriya"
  }
  user_data = data.template_file.apache_userdata_suriya.rendered
}
resource "aws_lb_target_group" "web_target_group" {
  name     = "web-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path = "/"
    interval = 30
    timeout  = 5
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
}
resource "aws_lb_target_group_attachment" "aara_attachment" {
  target_group_arn = aws_lb_target_group.web_target_group.arn
  target_id        = aws_instance.aara.id  # Referring to the Aara instance
  port             = 80
}
resource "aws_lb_target_group_attachment" "suriya_attachment" {
  target_group_arn = aws_lb_target_group.web_target_group.arn
  target_id        = aws_instance.suriya.id  # Referring to the Suriya instance
  port             = 80
}
