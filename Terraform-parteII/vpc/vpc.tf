resource "aws_vpc" "main" { #main -> Nombre logico para referencia en terraform
  cidr_block       = "10.0.0.0/22"

  tags = {
    Name = "Vpc-Infra" #Nombre visual
  }
}

resource "aws_subnet" "subnet-public-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet-public-1"
  }
}

resource "aws_subnet" "subnet-public-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "subnet-public-2"
  }
}

resource "aws_subnet" "subnet-private-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet-private-1"
  }
}

resource "aws_subnet" "subnet-private-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "subnet-private-2"
  }
}

resource "aws_internet_gateway" "igwvpcinfra" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igwvpcinfra"
  }
}

resource "aws_route_table" "rt-public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igwvpcinfra.id
  }

  tags = {
    Name = "rt-public-vpcinfra"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet-public-1.id
  route_table_id = aws_route_table.rt-public.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnet-public-2.id
  route_table_id = aws_route_table.rt-public.id
}

resource "aws_security_group" "webserversg" {
  name        = "webserversg"
  description = "Permitir puerto 22 y 80"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "webserversg"
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # todos los protocolos
    cidr_blocks      = ["0.0.0.0/0"]
  }
}