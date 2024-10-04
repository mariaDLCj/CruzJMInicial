<%@page import="java.time.LocalTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!-- esta es la directiva y viene por defecto -->
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Saludo</title>
        <link  href="<%=request.getContextPath()%>/css/style.css"/>
        <!-- request.getContextPath esto te da el contexto
            En controlador lo tienes en el titulo 1
        
        request.getContextPath()
        PONER ESTO EN EL RETSO DE LINKS DE ESTILOS
        
        EL "TRUCO"
        no vamos a usar etqiuetas d declaracion global a la clase que generan las variables globales
        para tener toda la logica de la app en el principio
        
        -->
        <!--
        te va a venir el genero y el nombre
        Como todos los sms empiezan por buen lo ponemos en el contructo 
        en hora sva la hora actual te da la hora actual
        localtiem importas la clase de java
        
        ahora hay que saber que poner en genero si señor o señora
        que vendra desde el form genero
        buenos dias de 8 a 13
        buenas tardes desde 13 hasta las 20 tarde
        buenas noches de 20 a 8
        -->
    </head>
    <body>
        <%
            StringBuilder mensaje = new StringBuilder("Buen");
            int horas = LocalTime.now().getHour();
            String sexo = (request.getParameter("sexo").equals("hombre")) ? " señor " : " señora ";
            if (horas >= 8 && horas < 13) {
                mensaje.append("os días");
            } else if (horas >= 13 && horas < 20) {
                mensaje.append("as tardes");
            } else {
                mensaje.append("as noches");
            }

            mensaje.append(sexo).append(request.getParameter("nombre"));
        %>
        <<h2><%=mensaje.toString()%></h2>
        <p> <a href="<%=request.getContextPath() %>" >Menú </p>
        
        <!-- Lo que falta son los campos del input y sexo valor y el submit -->
        
        <input name="sexo">

    </body>    
</html>
