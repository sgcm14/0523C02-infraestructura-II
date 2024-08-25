Server Apache & GitLab - CI/CD
=========

Armaremos la siguiente estructura:

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-Server-CI-CD/Modelo.jpeg)
> Pantalla de arquitectura a replicar

Ejecutamos el siguiente comando para correr nuestro contenedor GitLab

    docker run -d gitlab/gitlab-ce

Verificamos que se está ejecutando con el comando:

    docker ps

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-Server-CI-CD/Captura1.PNG)
> Pantalla de terminal server gitlab

Una vez en ejecución utilizamos el siguiente comando para poder ingresar al contenedor y realizar algunas verificaciones:

    docker exec -it <contenedor ID> bash

Para obtener la IP de Gitlab :
    
    hostname -i

Para obtener la clave root de Gitlab: 

    cat /etc/gitlab/initial_root_password

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-Server-CI-CD/Captura2.PNG)
> Pantalla de terminal server gitlab

Podemos verificar que ingresando a la ip que nos arrojó el comando anterior, podemos ingresar a nuestro servidor. 

Rellenamos los campos:

    Username: root
    Password: el que obtuvimos anteriormente con el comando

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-Server-CI-CD/Captura3.PNG)
> Pantalla de server gitlab

Creamos un nuevo proyecto desde el botón y seteamos los
parámetros según nuestros requisitos.

Nos va a llevar a una página muy similar a la siguiente, en donde vamos a tener nuestro proyecto.

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-Server-CI-CD/Captura4.PNG)
> Pantalla de server gitlab

Guardamos el link para poder clonar nuestro repositorio más adelante.

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-Server-CI-CD/Captura5.PNG)
> Pantalla de server gitlab

Clonamos nuestro repo localmente y hacemos un push a Gitlab

Usamos el siguiente comando para clonar:

git clone http://172.17.0.2/root/my-web.git (revisar que modificamos el clone y le colocamos la ip de nuestro servidor de Gitlab)

Colocamos nuestras credenciales

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-Server-CI-CD/Captura6.PNG)
> Pantalla de PC huesped (donde se instaló el docker)

Ahora si realizo un git status me figuran todos los archivos que he copiado dentro de la carpeta.

Procedemos a subirlos a nuestro gitlab con los siguientes comandos:
- git add .
- git commit -m “Mensaje commit”
- git push
Nuestro push quedaria algo asi:

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-Server-CI-CD/Captura7.PNG)
> Pantalla de PC huesped (donde se instaló el docker)


Si corroboramos en nuestro GitLab debería figurar lo siguiente:

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-Server-CI-CD/Captura8.PNG)
> Pantalla de server gitlab

Levantamos nuestro segundo contenedor que en este caso va a ser un Apache de la siguiente manera:

    docker run -dit ubuntu:latest

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/GitLab-Server-CI-CD/Captura9.PNG)
> Pantalla de PC huesped

Ya tenemos nuestros  2 contenedores:

- Contenedor 1: Nuestro servidor propio de GitLab
- Contenedor 2 : Nuestro servidor Apache

5 - Creamos una nueva red en Docker con el comando
docker network create <nombre de nuestra red>

Al tener 2 contenedores y entre ellos se van a comunicar, vamos a realizar la
conexión a una misma red a través del siguiente comando:
docker network connect <nombre de red que creamos> <container id>


Podemos verificar que nuestro contenedor ya tiene seteado la nueva red usando:
docker inspect <container id>

6 - Vamos a ingresar a nuestro contenedor de Apache para poder realizar algunas
modificaciones de la siguiente manera:
docker exec -it 29e3c0f41102 bash
Luego instalamos y actualizamos utilizando los siguientes comandos:
Actualizamos librerías: apt update
Instalamos wget para después instalar nuestro runner: apt install wget
Instalamos nuestro servidor web Apache: apt install apache2
Instalamos git para utilizarlo más adelante: apt install git
Inicializamos nuestro servidor: service apache2 start


Finalmente deberíamos llegar a la siguiente imagen, en donde nos va a devolver la ip
de nuestro servidor Apache

Corroboramos que efectivamente nuestro servidor esta ON ingresando al navegador
la ip anterior:

7 - Nos tocaría ahora reemplazar dicha web, por nuestro proyecto que tenemos en
GitLab. Ejecutamos lo siguiente:
● cd /var/www/html (nos posicionamos dentro del directorio del servidor)
● ls (verificamos nuestro que está nuestro archivo index.html)
● rm * : (borramos todo lo que exista dentro del directorio actual)
● git clone <el que utilizamos en el paso 3> /var/www/html/ (clonamos nuestro
repositorio)
Nos debería quedar algo similar a esto:


Y ambos están correctamente conectados a la misma red docker. Procedemos a instalar nuestro runner quien va a ser el responsable de ejecutar nuestro pipeline automáticamente.  Esto va a generar que evitemos el proceso manual que hicimos la clase pasada, cuando queríamos mostrar el cambio en nuestro servidor Apache.

Aclaración: Debemos desplegar nuestro Runner dentro del contenedor donde está alojado el Apache server,
Comandos para instalar el runner:
wget -O /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64

chmod 777 /usr/local/bin/gitlab-runner

gitlab-runner register (realizar pasos de registro para un runner de tipo shell)

Luego de registrar el runner deberíamos llegar a tener nuestro runner en correcto funcionamiento. Si no está en verde ejecutar el comando: gitlab-runner run

Ejemplo de Pipeline:

stages:
  - init
  - despliegue

hello:
  stage: init
  script:
    - echo "Nuestro primer pipeline"

deploy:
  stage: despliegue
  script:
    - cd /var/www/html
    - git pull http://<username>:<password>@<url del repositorio>


Como conectar y crear una red en docker:

docker network create <nombre de nuestra red>

docker network connect <nombre de red que creamos> <container id>

docker inspect <container id>
(Aca verificamos que nuestra red está attacheada en nuestro contenedor)




**Realizado por :** Sammy Gigi Cantoral Montejo (sgcm14)

<img src ="https://raw.githubusercontent.com/sgcm14/sgcm14/main/sammy.jpg" width="200">