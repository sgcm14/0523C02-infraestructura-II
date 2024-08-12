terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # siempre colocar la versión para que no se actualice al siguiente
    }
  }
}

provider "aws" {
  region                   = "us-east-1"
   shared_credentials_files = ["/home/sammy/.aws/credentials"] #  ubicación de un archivo de credenciales compartidas de AWS
}

resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Main_VPC"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public_Subnet_1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public_Subnet_2"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Private_Subnet_1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Private_Subnet_2"
  }
}

resource "aws_instance" "instanciaProduccion" {
  ami           = "ami-04a81a99f5ec58529" # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet_1.id
  key_name      = "sammycantoral" # Aquí debes reemplazar con el nombre exacto de tu llave SSH en AWS

  tags = {
    Name = "Instancia_Produccion"
  }
}

resource "aws_instance" "instanciaDesarrollo" {
  ami           = "ami-04a81a99f5ec58529" # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet_2.id
  key_name      = "sammycantoral" # Aquí debes reemplazar con el nombre exacto de tu llave SSH en AWS

  tags = {
    Name = "Instancia_Desarrollo"
  }
}