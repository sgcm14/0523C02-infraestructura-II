Gestionamos servidores
=========
En esta actividad vamos a realizar la modificación de los servidores que creamos
con nuestra plantilla de CloudFormation. Para esto vamos a necesitar lo siguiente:
1. Archivo plano (txt) con nuestro inventario de servidores.
2. Playbook de Ansible.

Tengamos en cuenta las siguientes consideraciones:
- Tenemos que tener instalado Ansible y sus dependencias.
- Debemos tener descargado en nuestras PC la KeyPair(.PEM) para poder
utilizarla luego dentro del inventario.



Ayuda:
---

* Para tu inventario:

    La configuración del servidor debe ser similar a la siguiente:

        [<NOMBRE DE TU INVENTARIO>]
        <NOMBRE> ansible_host=<DIRECCION IP> ansible_user=<USUARIO>
        ansible_ssh_private_key_file=<DIRECCION DE LA KEYPAIR>
        (Lo que está sobre bold NO se modifica)

* Para el Playbook:

    A Continuación los datos del playbook son los siguientes:

        - name: Instalar Apache
          hosts: apache_servers
          become: yes
          tasks:
            - name: Actualizar caché de paquetes
              apt:
                update_cache: yes

            - name: Instalar Apache
              apt:
                name: apache2
                state: present
            - name: Iniciar Apache
              service:
                name: apache2
                state: started
                enabled: yes

Para ejecutar un playbook debemos ejecutar:
En donde -i “inventario” - - - - > Colocamos la ruta de donde está nuestro
inventario.

Primero se crea la instancia desde cloudformation para poder luego continuar desde el servidor con Ansible

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Ansible/image1.png)
> Pantalla de instancia creada desde cloudFormation

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Ansible/image2.png)
> Pantalla de Archivos de inventario

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Ansible/image3.png)
> Pantalla de Archivo playbook

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Ansible/image4.png)
> Pantalla de Archivo inventario

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Ansible/image5.png)
> Pantalla de terminal ejecutando playbook

Si al momento de correr el comando anterior sale un problema con la llave descargada de aws (token para crear instancia): 

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Ansible/image6.png)
> Pantalla de terminal ejecutando playbook

entonces poner el siguiente comando:

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Ansible/image7.png)
> Pantalla de terminal cambiando permiso

Si da un problema de que no puede conectar puerto ssh :

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Ansible/image8.png)
> Pantalla de terminal ejecutando playbook

Ejecutar el siguiente comando:
![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Ansible/image9.png)
> Pantalla de terminal

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Ansible/image10.png)
> Pantalla de terminal

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Ansible/image11.png)
> Pantalla de instancia direccion IP publica (quitarle el s del https)

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/Ansible/image12.png)
> Pantalla de Exito

**Realizado por :** Sammy Gigi Cantoral Montejo (sgcm14)

<img src ="https://raw.githubusercontent.com/sgcm14/sgcm14/main/sammy.jpg" width="200">