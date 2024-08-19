terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # siempre colocar la versión para que no se actualice al siguiente
    }
  }
}

provider "aws" {
  region = "us-east-1"
  shared_credentials_files = ["/home/sammy/.aws/credentials"] #  ubicación de un archivo de credenciales compartidas de AWS
}

resource "aws_instance" "instanciaProduccion" {
  ami           = "ami-04a81a99f5ec58529" # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  key_name = "sammycantoral" # Aquí debes reemplazar con el nombre exacto de tu llave SSH en AWS

  tags = {
    Name = "Instancia_Produccion"
  }
}

resource "aws_instance" "instanciaDesarrollo" {
  ami           = "ami-04a81a99f5ec58529" # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type
  instance_type = "t2.micro"
  availability_zone = "us-east-1b"
  key_name = "sammycantoral" # Aquí debes reemplazar con el nombre exacto de tu llave SSH en AWS

  tags = {
    Name = "Instancia_Desarrollo"
  }
}
