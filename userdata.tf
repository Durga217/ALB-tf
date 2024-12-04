data "template_file" "apache_userdata_aara" {
  template = <<EOT
#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Welcome to Aara Instance</h1>" > /var/www/html/index.html
EOT
}
data "template_file" "apache_userdata_suriya" {
  template = <<EOT
#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Welcome to Suriya Instance</h1>" > /var/www/html/index.html
EOT
}
