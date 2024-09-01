GitLab + AWS S3
=========

Armaremos la siguiente estructura:

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Modelo.jpeg)
> Pantalla de arquitectura a replicar

**Objetivo:**

Generar un pipeline en GitLab que me permita pushear el repositorio a un bucket s3 configurando el bucket como static website hosting para poder visualizar la página públicamente.

**Resolución:**

Continuamos integrando herramientas. En nuestro ambiente de GitLab debemos
subir a un nuevo proyecto un template web. Podemos obtenerlo desde esta url: https://plantillashtmlgratis.com/en/home/. Tendremos que configurar un nuevo runner.

Primero levantamos nuestros contenedores que habiamos creado previamente (Gitlab y Ubuntu con Apache)

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura1.PNG)
> Pantalla de terminal huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura2.PNG)
> Pantalla de server gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura3.PNG)
> Pantalla de server apache

Antes de realizar todo esto, debemos crear nuestro bucket S3 en AWS y setearlo para hospedar páginas web estáticas.

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura4.PNG)
> Pantalla de AWS - buckets

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura5.PNG)
> Pantalla de AWS - buckets

Verificamos que nuestro bucket posea acceso al público.

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura6.PNG)
> Pantalla de AWS - buckets

Y que no tenga bloqueos:

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura7.PNG)
> Pantalla de AWS - buckets

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura8.PNG)
> Pantalla de AWS - buckets

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura9.PNG)
> Pantalla de AWS - buckets

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura10.PNG)
> Pantalla de AWS - buckets

Esto lo hacemos desde la solapa propiedades del bucket:

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura11.PNG)
> Pantalla de AWS - buckets

Y vamos hasta el final hasta encontrar la siguiente opción:

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura12.PNG)
> Pantalla de AWS - buckets

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura13.PNG)
> Pantalla de AWS - buckets

Una vez que habilitamos la opción, indicamos en la documentación del index el archivo principal de nuestra web que sería el index.html como se muestra en la
imagen siguiente:

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura14.PNG)
> Pantalla de AWS - buckets

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura15.PNG)
> Pantalla de AWS - buckets


![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura16.PNG)
> Pantalla de AWS - buckets


![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura17.PNG)
> Pantalla de AWS - buckets


![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura18.PNG)
> Pantalla de AWS - buckets


![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura19.PNG)
> Pantalla de AWS - buckets
    

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura20.PNG)
> Pantalla de AWS - buckets


![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura21.PNG)
> Pantalla de AWS - buckets

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura22.PNG)
> Pantalla de AWS - buckets

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura23.PNG)
> Pantalla de AWS - buckets


![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura24.PNG)
> Pantalla de AWS - buckets

Generamos nuestra policy para el bucket del generador de policy de aws

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura25.PNG)
> Pantalla de AWS - buckets

Y nos quedaría de la siguiente manera:

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura26.PNG)
> Pantalla de AWS - buckets


![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura27.PNG)
> Pantalla de AWS - buckets


![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura28.PNG)
> Pantalla de AWS - buckets

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura29.PNG)
> Pantalla de bucket

Una vez ya teniendo nuestro bucket configurado procedemos a levantar un runner
y configurarlo.

        docker run -d --name gitlab-runner \
        -v /srv/gitlab-runner/config:/etc/gitlab-runner \
        -v /var/run/docker.sock:/var/run/docker.sock \
        gitlab/gitlab-runner:latest

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura30.PNG)
> Pantalla de terminal huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura31.PNG)
> Pantalla de terminal huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura32.PNG)
> Pantalla de terminal huesped

Tanto el contenedor de Gitlab y el del Runner, tienen que estar dentro de la misma red.

Crear la red con **“docker network create <nombre>”**

Conectarlo con **“docker network connect <nombre de la red creada>
<contenedor id>”**

Pueden verificarlo con el comando **“docker network inspect <contenedor id>”**

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura33.PNG)
> Pantalla de terminal huesped

Ingresamos al contenedor y registramos el Runner pero configuramos el executor
como docker y default image python:3.6

Sino recordamos con que comando registrar el runner es el siguientes:
        
        gitlab-runner register

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura34.PNG)
> Pantalla de terminal huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura35.PNG)
> Pantalla de server gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura36.PNG)
> Pantalla de terminal huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura37.PNG)
> Pantalla de server gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura38.PNG)
> Pantalla de server apache

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura39.PNG)
> Pantalla de server gitlab

Luego generamos nuestro archivo .gitlab-ci.yml dentro de nuestro repositorio de gitlab con los siguientes datos:

    stages:
    - despliegue
    deploy:
    stage: despliegue
    image: python:3.6
    script:
    - echo "Installing aws command line"
    - pip install awscli
    - aws --version
    - echo "Extracting the production build"
    - echo "Uploading files to AWS Bucket"
    - aws s3 cp --recursive . s3://<nuestro_bucket>

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura40.PNG)
> Pantalla de server gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura41.PNG)
> Pantalla de server gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura42.PNG)
> Pantalla de server gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura43.PNG)
> Pantalla de server gilab- runner

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura44.PNG)
> Pantalla de server gilab- runner

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura45.PNG)
> Pantalla de server gilab- runner

No nos olvidemos de que tenemos que configurar la red de nuestro runner y del
contenedor. Dentro del contenedor del runner modificamos el archivo
/etc/gitlab-runner/config.toml agregar el “network_mode = <nuestra red creada del contenedor>” al final de la línea.

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura46.PNG)
> Pantalla de server gilab- runner

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura47.PNG)
> Pantalla de server gilab- runner

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura48.PNG)
> Pantalla de server gilab- runner

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura49.PNG)
> Pantalla de server gilab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura50.PNG)
> Pantalla de server gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura51.PNG)
> Pantalla de server gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura52.PNG)
> Pantalla de server gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura53.PNG)
> Pantalla de server gitlab

Generar las variables de AWS en la solapa de Variables en GITLAB

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura54.PNG)
> Pantalla de server gilab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura55.PNG)
> Pantalla de server gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura56.PNG)
> Pantalla de server gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura57.PNG)
> Pantalla de server gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura58.PNG)
> Pantalla de server gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura59.PNG)
> Pantalla de server gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura60.PNG)
> Pantalla de server gitlab

Una vez ya nuestro pipeline se ejecutará de manera automática y para poder
visualizar nuestra web desde el bucket tenemos que ingresar al link del bucket que creamos:

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-AWS-S3/Captura61.PNG)
> Pantalla de server apache

**Realizado por :** Sammy Gigi Cantoral Montejo (sgcm14)

<img src ="https://raw.githubusercontent.com/sgcm14/sgcm14/main/sammy.jpg" width="200">