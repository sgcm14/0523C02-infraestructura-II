Creando un entorno de trabajo - P2
=========

En esta actividad vamos a continuar trabajando con la actividad anterior. Pero vamos a balancear nuestro entorno con un ELB. 

Aplicaremos los modulos para los archivos.

1. Una VPC

    a. Cuatro subredes:

        i. Dos subredes Públicas
        ii. Dos subredes Privadas
2. Dos instancias EC2

    a. Las características tienen que ser similares a las del ejercicio de
CloudFormation

3. Balancear las cargas entre los 2 servidores:
    -  El ELB debe ser de tipo Application load Balancer.
    - Debe estar dentro de la misma VPC que el resto de los componentes.

Tengamos en cuenta las siguientes consideraciones:
- Tenemos que tener instalado AWS CLI
- Tener configurada correctamente la CLI
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs


Arquitectura a codear:
![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Terraform-parteII/balanceador/Ejemplo.PNG)
> Pantalla de arquitectura a replicar


![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Terraform-parteII/balanceador/image1.png)
> Pantalla de balanceador creado y conectado


![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Terraform-parteII/balanceador/image2.png)
> Pantalla de web server 1 desde balanceador

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Terraform-parteII/balanceador/image3.png)
> Pantalla de web server 2 desde balanceador



**Realizado por :** Sammy Gigi Cantoral Montejo (sgcm14)

<img src ="https://raw.githubusercontent.com/sgcm14/sgcm14/main/sammy.jpg" width="200">