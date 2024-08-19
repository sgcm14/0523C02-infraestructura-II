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
