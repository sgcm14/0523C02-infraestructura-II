Gestionamos servidores
=========
En esta actividad vamos a realizar la modificación de los servidores que creamos
con nuestra plantilla de CloudFormation. Para esto vamos a necesitar lo siguiente:
1. Archivo plano (txt) con nuestro inventario de servidores.
2. Playbook de Ansible.
Tengamos en cuenta las siguientes consideraciones:
● Tenemos que tener instalado Ansible y sus dependencias.
● Debemos tener descargado en nuestras PC la KeyPair(.PEM) para poder
utilizarla luego dentro del inventario.
—---------------------------------------------------------------------------
Ayuda
Para tu inventario
La configuración del servidor debe ser similar a la siguiente:

Los datos del inventario son los siguientes:
[<NOMBRE DE TU INVENTARIO>]
<NOMBRE> ansible_host=<DIRECCION IP> ansible_user=<USUARIO>
ansible_ssh_private_key_file=<DIRECCION DE LA KEYPAIR>
(Lo que está sobre bold NO se modifica)
Para el Playbook
A Continuación los datos del playbook son los siguientes:
---
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


**Realizado por :** Sammy Gigi Cantoral Montejo (sgcm14)

<img src ="https://raw.githubusercontent.com/sgcm14/sgcm14/main/sammy.jpg" width="200">