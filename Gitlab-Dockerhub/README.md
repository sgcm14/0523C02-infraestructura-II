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

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura1.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura2.PNG)
> Pantalla de PC huesped

**Levantamos GitLab**

Creamos un directorio (en la raíz de nuestro usuario /home/usuario) en donde vamos a persistir todos los datos de nuestro servidor

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura3.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura4.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura5.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura6.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura7.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura8.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura9.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura10.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura11.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura12.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura13.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura14.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura15.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura16.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura17.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura18.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura19.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura20.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura21.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura22.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura23.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura24.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura25.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura26.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura27.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura28.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura29.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura30.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura31.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura32.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura33.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura34.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura35.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura36.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura37.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura38.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura39.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura40.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura41.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura42.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura43.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura44.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura45.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura46.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura47.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura48.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura49.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Captura50.PNG)
> Pantalla de PC huesped

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Gitlab-Dockerhub/Picture.png)
> Pantalla de PC huesped



**Realizado por :** Sammy Gigi Cantoral Montejo (sgcm14)

<img src ="https://raw.githubusercontent.com/sgcm14/sgcm14/main/sammy.jpg" width="200">