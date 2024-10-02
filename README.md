# CruzJMInicial
Proyecto de servlets en netbeans
## Iniciación Servlet's
### Toma de contacto con @controller
Un Servlet es una clase java que se ejecuta en la parte del servidor para administrar las solicitudes (request) HTTP y las respuestas (response)
En el modelo vista controlador el controlador es el que permite que los request accedan al back-end, hay dos tipos de request en el form de html

- POST
- GET
  
Con los distintos enlaces podemos ver las diferentes formas en que trabajamos con los Controladores.
Estas son las opciones disponibles en el index actualmente:

- Llamada directa al controlador (get)
- Llamada directa al controlador por parámetros (get)

En este caso introducimos parámetros a la hora de llamar al Controlador.

- Formulario sencillo (post)

Contiene nombre y apellido y nos devuelve los datos ingresados en el Controlador.

- Formulario completo (enumeration)

Los datos se tratan con un Enumeration y se recorre para que muestre los datos correctamente.
Además en este formulario los datos se muestran modificados, por ejemplo, la fecha con formato dd-mm-aaaa,
y el nombre del campo aparece en mayúsculas la primera y con espacio en vez de "_".

- Formulario completo (map)

Esta opción muestra el resultado del formulario pero trata los datos mediante un mapa.

- Formulario validado (map)

Este enlace es igual que el anterior con la diferencia de que los campos nombre, apellidos y edad deben estar rellenos
o nos mostrará un mensaje de aviso.

- Acceso directo al controlador

Enlace que lleva al formulario, en caso de estar los campos vacíos nos avisa de que no se puede acceder directamente al controlador.

- Formulario dos botones

Se muestra un formulario con un botón para Enumeration y otro para Map, se valida en el controlador la opción seleccionada y se
maneja la información en función del botón.

- Formulario que recuerda datos

Se trata de enseñar el formulario en el get mediante el SpringBuilder, este formulario se envia por post al mismo controlador con el valor "primera" en el submit, que recibirá el doPost en el que validamos si el submit tiene el valor de "primera" en cuyo caso valida que todos
los campos estén escritos, en caso contrario muestra un formulario oculto, y el botón enviar con otro valor diferente para que entre por el else 
que valida si el valor es primera, de esta manera volvemos  amostrar el formulario.

