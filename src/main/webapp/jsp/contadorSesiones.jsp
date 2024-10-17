<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
    StringBuilder mensaje = new StringBuilder();
    // SACAR LA SESION ACTUAL O CREAR NUEVA
    HttpSession sesion = request.getSession();

    if (request.getParameter("eliminar") != null) {
        sesion.removeAttribute("contador");
        mensaje.append("La sesion se ha limpiado<br>");
    }
    // CONTADOR SI ES NULLO POR QUE NO EIXTE IGUALARLO A 0
    Integer contador = (Integer) sesion.getAttribute("contador");
    // SI ES == A NULL NO EXISTE Y LO INICIALIZO
    if (contador == null) {
        contador = 0;
    }
    // EXISTIESE O NO SE INCREMENTA
    contador++;
    // SE ESTABLECE EL NUEVO VALOR DEL CONTADOR
    mensaje.append("Se ha entrado ").append(contador).append(" número de veces.");
    sesion.setAttribute("contador", contador);

// BORRAR LA SESION CON  removeAttribute(java.lang.String name)
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Contador de Sesión</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/contadorSesiones.css">
    </head>
    <body>
        <h1>Contador de Sesión</h1>
        <div class="contenedor">
            <form method="post">
                <h2><%= mensaje%></h2>
                <a href="<%=request.getContextPath()%>">Inicio</a>
                <input type="checkbox" name="eliminar"> Eliminar            
                <input type="submit" name="enviar" value="enviar">
            </form>
        </div>

    </body>
</html>