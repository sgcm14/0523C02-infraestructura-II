Creando un entorno de trabajo
=========

En esta actividad vamos a realizar la creación de un entorno de trabajo con las siguientes características:

1. Dos instancias EC2

    a. Las características tienen que ser similares a las del ejercicio de CloudFormation

Tengamos en cuenta las siguientes consideraciones:
- Tenemos que tener instalado AWS CLI
- Tener configurada correctamente la CLI
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs


![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Terraform-parteI/instancias/image1.png)
> Pantalla de carpeta de template

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Terraform-parteI/instancias/image2.png)
> Pantalla de terminal - aplicando **terraform init**

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Terraform-parteI/instancias/image3.png)
> Pantalla de terminal - aplicando **terraform apply** , antes se puede hacer **terraform plan**

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Terraform-parteI/instancias/image4.png)
> Pantalla de terminal - enter **yes**

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Terraform-parteI/instancias/image5.png)
> Pantalla de instancias creadas

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Terraform-parteI/instancias/image6.png)
> Pantalla de terminal - aplicando **terraform destroy**

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Terraform-parteI/instancias/image7.png)
> Pantalla de terminal - enter **yes**

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Terraform-parteI/instancias/image8.png)
> Pantalla de instancias eliminadas


**Realizado por :** Sammy Gigi Cantoral Montejo (sgcm14)

<img src ="https://raw.githubusercontent.com/sgcm14/sgcm14/main/sammy.jpg" width="200">