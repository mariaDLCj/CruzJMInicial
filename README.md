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

- Ciclo de vida de un servlet
En esta página no aparecerá nada de primeras, debemos abrir la consola de netbeans para poder ver cómo funciona un servlet.
El proceso que sigue es inicializar con el método init(), después se ejecuta el metodo service(), donde se dan doPost y doGet, las posibles solicitudes y
por último el servlet se destruye con el método destry().

- Cabecera petición
Es el primer contacto con las sesiones, en ella mostramos los valores de la cabecera de una sesión haciendo uso de request.getHeadersNames().

## Páginas JSP
- Sumadora
Un programa muy sencillo que suma dos números en un jsp, en el cual usamos tanto html como java

- Saludo
En función de la elección de gérnero nos dedicará buenos días señor o buenos días señora con el nombre que se introdujo.

- Calculadora
Una calculadora generada también con html y java, en ella se impide la división por 0 mediante excepción.

- Comprobar edad
Este programa nos dirá cuantos años, meses y días tenemos de vida, también contempla que no hayamos nacido o que hayamos nacido hoy y gestiona
mediante condicionales las comas, los puntos y la conjunción "y".

- Número Secreto
Se trata de adivinar en el menor número de intentos posibles el número que la máquina piensa, mientras vamos mostrando los intentos al usuario en pantalla.

- Cambiar divisas
Este programa cambia el número de moneda de un tipo a la cantidad que corresponda del segundo tipo seleccionado.

- Monedero
Este ejercicio consiste en dar el cambio más eficiente al usuario, con la dificultad de no hacer uso de if concatenados, bucles anidados ni de arrays.

- Mi nombre con cookies
Este programa genera una cookie con el nombre del usuario, en este caso, mi nombre, la primera vez que se entra en el programa, aunque lo que muestre esta primera vez
es que no se tenían datos, la segunda vez y posteriores saluda al usuario haciendo uso de las cookies para guardar el nombre.

- Contador de cookie
Cuenta el número de veces que se ha ingresado en la página mediante una cookie, la primera vez el contador será de uno y muestra los datos de la cookie recién creada, las posteriores sólo muestra el número de veces que se ha ingresado.

- Recordar usuario con cookies
Debe recordar al usuario si se ha seleccionado dicha opción una vez se envíe el formulario. Si el usuario ha pulsado el botón de recordar en la siguiente vuelta se deshabilita.

- La gestión de una cookie
Se trata del manejo de las operaciones CRUD con una cookie que genera el usuario mediante un formulario. Este ejercicio tiene una peculiaridad y es que tiene vista y controlador aunque ambos son archivos jsp.

- Contador de Sesiones
Es muy similar al ejercicio del contador de la cookie, en este caso se hace uso de las sesiones para recordar los datos. Se comprueba si la sesión está creada o no y se permite que el usuario borre dicha sesión en el formulario.





