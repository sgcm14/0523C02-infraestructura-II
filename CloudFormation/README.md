Automatizar la creación de un recurso cloud
=========
En esta actividad vamos a poner a prueba nuestros conocimientos. Nuestro desafío
será la creación automatizada de un recurso de AWS, en este caso:
1. Un bucket S3.
2. Dos instancias EC2

Tengamos en cuenta las siguientes consideraciones:

- El bucket tiene que tener un nombre único.
- El bucket debe ser privado.
- Tenemos que activar el versionado del bucket.
- Ambas instancias tienen que tener las siguientes características:
    - "AvailabilityZone" : “Norte de virginia”
    - "DisableApiTermination" : “Que este deshabilitado”
    - "ImageId" : “De tipo Linux - recomendado ubuntu”
    - "InstanceType" : “Algún tipo de instancia que esté dentro de la capa
    gratuita”
    - "InstanceInitiatedShutdownBehavior" : “Que se apague”
    - "KeyName" : “El nombre de una llave ya creada anteriormente”
    - "Monitoring" : “Que esté deshabilitado”

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/CloudFormation/Captura1.PNG)
> Pantalla de crear pila - cloudFormation

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/CloudFormation/Captura2.PNG)
>  Pantalla de crear pila - cloudFormation

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/CloudFormation/Captura3.PNG)
>  Pantalla de crear pila - cloudFormation

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/CloudFormation/Captura4.PNG)
>  Pantalla de crear pila - cloudFormation

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/CloudFormation/Captura5.PNG)
>  Pantalla de crear pila - cloudFormation

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/CloudFormation/instancias.PNG)
>  Pantalla de instancias creadas

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/CloudFormation/bucket.PNG)
>  Pantalla de bucket creado

![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/CloudFormation/pila.PNG)
>  Pantalla de pila creada


**Challenge:**
-
Nuestro desafío será la creación automatizada de un recurso de AWS, en este caso:

Una instancia EC2. Tengamos en cuenta las siguientes consideraciones:
- La instancia va a tener 3 posibles ambientes: Producción, Desarrollo, Testing.
- El template/plantilla debe contener al menos las siguientes características
    - Tipo de instancia:
        - t2.micro para Producción y Testing
        - t1.micro para Desarrollo
    - Imagen:
        - Linux para Producción y Testing
        - Windows para Desarrollo.
    - Todas las instancias deben tener las mismas llaves de acceso
    (crearlas previamente en la consola de AWS).

**AYUDA**

Mapping:
https://docs.aws.amazon.com/es_es/AWSCloudFormation/latest/UserGuide/mappings-section-structure.html

Función a utilizar:
https://docs.aws.amazon.com/es_es/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-findinmap.html


![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/CloudFormation/challenge1.PNG)
>  Pantalla de crear pila - cloudFormation


En este caso como el template tiene varios entornos, al momento de elegir el template, debes seleccionar el template que quieres crear. De ahi se siguen los pasos como en el ejercicio anterior.
![](https://raw.githubusercontent.com/sgcm14/0523C02-infraestructura-II/main/CloudFormation/challenge2.PNG)
>  Pantalla de crear pila - cloudFormation

**Realizado por :** Sammy Gigi Cantoral Montejo (sgcm14)

<img src ="https://raw.githubusercontent.com/sgcm14/sgcm14/main/sammy.jpg" width="200">