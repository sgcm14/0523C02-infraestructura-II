 GitLab + Docker Hub
=========

**Objetivo:**

Generar un pipeline en GitLab que me permita pushear el repositorio y generar una
imagen de docker hacia el repositorio de Docker Hub.

**Resolución**

La tarea principal es crear una cuenta en Docker Hub sino la tenemos.
Link : https://hub.docker.com/ Deberíamos poder llegar a nuestro perfil

Vamos a lanzar nuestra infraestructura (desde 0 - sin utilizar lo que ya habíamos
hecho en las 2 clases anteriores -) a través de un Docker Compose.

**Necesitamos instalar **docker-compose** sino lo tenemos con el comando:

    sudo apt update

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura1.PNG)
> Pantalla de PC huesped

    sudo apt install docker-compose

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura2.PNG)
> Pantalla de PC huesped

**Levantamos GitLab**

Creamos un directorio (en la raíz de nuestro usuario /home/usuario) en donde vamos a persistir todos los datos de nuestro servidor

    mkdir gitlab && cd gitlab

Ahora creamos un archivo (recomiendo que lo hagan en visual studio code)
llamado docker-compose.yml

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura3.PNG)
> Pantalla de PC huesped

y dentro de él colocamos lo siguiente:

    version: '3.7'
    services:
    gitlab:
    image: 'gitlab/gitlab-ce:latest'
    restart: always
    hostname: 'localhost'
    container_name: gitlab
    environment:
        GITLAB_OMNIBUS_CONFIG: |
          external_url 'http://localhost'
    ports:
        - '8080:80'
        - '8443:443'
    volumes:
        - '$GITLAB_HOME/config:/etc/gitlab'
        - '$GITLAB_HOME/logs:/var/log/gitlab'
        - '$GITLAB_HOME/data:/var/opt/gitlab'
    networks:
        - gitlab
    gitlab-runner:
        image: gitlab/gitlab-runner:alpine
        container_name: gitlab-runner
        restart: always
        depends_on:
            - gitlab
    volumes:
        - /var/run/docker.sock:/var/run/docker.sock
        - '$GITLAB_HOME/gitlab-runner:/etc/gitlab-runner'
    networks:
    - gitlab
    networks:
    gitlab:
    name: gitlab-network

Nos tiene que quedar similar a la siguiente imagen:

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Picture.png)
> Pantalla de modelo yml

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura4.PNG)
> Pantalla de PC huesped

Luego exportamos la variable que va a utilizar el docker-compose

    export GITLAB_HOME=$HOME/gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura5.PNG)
> Pantalla de PC huesped

Teniendo ya nuestro docker-compose.yml configurado lo vamos a ejecutar para poder desplegar la configuración GITLAB + RUNNER (2 contenedores). Ejecutamos el siguiente comando:

    sudo -E docker-compose up -d

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura6.PNG)
> Pantalla de PC huesped

Luego vamos a poder ejecutar el siguiente comando para obtener nuestra clave de root de GitLab:

    docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura7.PNG)
> Pantalla de PC huesped

Ya con estas credenciales podemos acceder a nuestro servidor Gitlab a través del localhost:8080

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura8.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura9.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura10.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura11.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura12.PNG)
> Pantalla de server Gitlab

Procedemos a crear un nuevo proyecto y dentro de él vamos a subir una plantilla web, puede ser la misma que estuvieron usando anteriormente o pueden buscar alguna diferente.

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura13.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura14.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura15.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura16.PNG)
> Pantalla de server Gitlab

Luego procedemos a crear un Dockerfile que va a ser quien construirá nuestra imagen con el proyecto web ya integrado de la siguiente manera:

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura17.PNG)
> Pantalla de server Gitlab

Creamos un archivo Llamado Dockerfile y lo completamos con el siguiente código:

        FROM nginx:latest
        WORKDIR /usr/share/nginx/html
        COPY . .

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura18.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura19.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura20.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura21.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura22.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura23.PNG)
> Pantalla de PC huesped

Guardamos nuestro archivo y nos quedaría de la siguiente manera nuestro
Proyecto + el Dockerfile:

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura24.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura25.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura26.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura27.PNG)
> Pantalla de server Gitlab

Ya estamos prácticamente listos para que el pipeline corra automáticamente, para ello vamos a tener que configurar nuestro Runner con el token correspondiente al proyecto. Ejecutemos el siguiente comando (modificar solo lo que está en rojo):

    sudo docker exec -it gitlab-runner gitlab-runner register
    --url "http://gitlab" --clone-url "http://gitlab"
    --registration-token <TOKEN de nuestro Runner>

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura28.PNG)
> Pantalla de PC huesped

Pulsamos Enter en todas las opciones, menos cuando nos pida Enter an
executor, allí tipeamos docker y pulsamos Enter nuevamente, la siguiente opción que nos preguntará será Enter the default Docker image, alli ingresamos ruby:2.7 y pulsamos Enter.

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura29.PNG)
> Pantalla de PC huesped

Ahora si volvemos a ingresar nuevamente a Settings → CI/CD → Runner, nos
debiera aparecer el runner activado, como se muestra en la siguiente imagen:

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura30.PNG)
> Pantalla de server Gitlab

Una vez nuestro runner en ejecución falta configurar algunos parámetros dentro del mismo. Para ello vamos a ingresar al contenedor a través del siguiente comando:

    sudo docker exec -it gitlab-runner bash

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura31.PNG)
> Pantalla de PC huesped

Después modificamos el archivo config.toml desde la siguiente ruta y con el comando:

    vi /etc/gitlab-runner/config.toml

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura32.PNG)
> Pantalla de PC huesped

Los siguientes parámetros:

    privileged = true
    network_mode = "gitlab-network"

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura33.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura34.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura35.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura36.PNG)
> Pantalla de server Gitlab

Luego dentro de gitlab en la solapa de BUILD vamos a cargar nuestro pipeline:

    stages:
    - compose
    stage_compose:
    stage: compose
    image: docker:stable
    when: manual
    services:
    - docker:dind
    - name: docker:dind
    alias: thedockerhost
    variables:
    DOCKER_HOST: tcp://thedockerhost:2375/
    DOCKER_DRIVER: overlay2
    DOCKER_TLS_CERTDIR: ""
    script:
    - docker login -u $CI_REGISTRY_USER -p
    $CI_REGISTRY_PASSWORD $CI_REGISTRY
    - docker build -t test:latest .
    - docker tag test:latest $CI_REGISTRY_USER/test:latest
    - docker push $CI_REGISTRY_USER/test:latest

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura37.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura38.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura39.PNG)
> Pantalla de server Gitlab

Si prestamos atención, hay 3 variables que vamos a tener que cargar en nuestra sección de variables para que GitLab las utilice. Para ello dentro de nuestro proyecto vamos a Settings > CI/CD > Variables , Una vez ahí cargamos nuestras credenciales de la siguiente manera:

    ● CI_REGISTRY = docker.io
    ● CI_REGISTRY_PASSWORD = tupassoword (de dockerhub)
    ● CI_REGISTRY_USER = tuusuario (de dockerhub)

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura40.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura41.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura42.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura43.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura44.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura45.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura46.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura47.PNG)
> Pantalla de server Gitlab

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura48.PNG)
> Pantalla de server Gitlab

Nuestro pipeline debería pasar a passed:
Sino lo volvemos a lanzar desde el siguiente botón; reiniciar el server del runner, o tagear el run y ponerlo en el .gitlab-ci.yml

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura49.PNG)
> Pantalla de server Gitlab

Ahora deberíamos tener nuestra imagen en Docker Hub

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura50.PNG)
> Pantalla de docker hub -  perfil


A continuación accederemos a esta imagen desde una máquina con Windows, para esto accedemos como un usuario público aqui: le damos click a Copy 
![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura51.PNG)
> Pantalla de repositorio de docker hub -  perfil publico

Abrimos la terminal y pegamos el comando
![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura52.PNG)
> Pantalla de terminal en Windows

Y el siguiente comando para poder ejecutar la imagen descargada en el puerto 8074
![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura53.PNG)
> Pantalla de terminal en Windows

Si accedemos a Docker desktop podemos observar la imagen descargada:
![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura54.PNG)
> Pantalla de Docker desktop -  Images

Ahora observamos el contenedor corriendo y l damos click al Port para que nos lleve al localhost
![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura55.PNG)
> Pantalla de Docker desktop -  Containers


![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura56.PNG)
> Pantalla navegador -  localhost de la imagen


**Realizado por :** Sammy Gigi Cantoral Montejo (sgcm14)

<img src ="https://raw.githubusercontent.com/sgcm14/sgcm14/main/sammy.jpg" width="200">