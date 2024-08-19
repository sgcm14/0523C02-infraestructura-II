resource "aws_instance" "webserver1" {
  ami           = "ami-04a81a99f5ec58529" # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type
  instance_type = "t2.micro"
  associate_public_ip_address = true # se debe asignar una IP automaticamente
  key_name = "sammycantoral" # Aquí debes reemplazar con el nombre exacto de tu llave SSH en AWS
  subnet_id = aws_subnet.subnet-public-1.id
  security_groups = [ aws_security_group.webserversg.id ]
  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y apache2
              sed -i 's/Apache2 Ubuntu Default Page/Web Server 1/' /var/www/html/index.html
              systemctl enable apache2
              systemctl start apache2
              EOF

  tags = {
    Name = "WebServer - 1"
  }

}

resource "aws_instance" "webserver2" {
  ami           = "ami-04a81a99f5ec58529"  # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type
  instance_type = "t2.micro"
  associate_public_ip_address = true # se debe asignar una IP automaticamente
  key_name = "sammycantoral" # Aquí debes reemplazar con el nombre exacto de tu llave SSH en AWS
  subnet_id = aws_subnet.subnet-public-2.id
  security_groups = [ aws_security_group.webserversg.id ]
  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y apache2
              sed -i 's/Apache2 Ubuntu Default Page/Web Server 2/' /var/www/html/index.html
              systemctl enable apache2
              systemctl start apache2
              EOF

  tags = {
    Name = "WebServer - 2"
  }
}