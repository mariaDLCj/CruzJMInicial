<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link  href="<%=request.getContextPath()%>/css/monedero.css"/>    </head>
    <body>
        <!-- EESTA ES VISTA QUE VA A MOSTRAR LOS MENSAJES Y RECOGER LOS PARÁMETROS -->
        <h1>VISTA</h1>
        
        <form action="../jsp/controlCookie.jsp">
            <label for="nombre">Nombre:</label>
            <input type="text" name="nombre"><br>
            <label for="contenido">Contenido:</label>
            <input type="text" name="contenido"><br>
            <input type="submit" name="enviar" value="Crear">
            <input type="submit" name="enviar" value="Visualizar">
            <input type="submit" name="enviar" value="Modificar">
            <input type="submit" name="enviar" value="Eliminar">
            <!-- PARA RECUPERAR LOS VALORES TIENES QUE TRAERTELOS CON EL REQUEST O ALGO ASI NO SÉ -->
            <button type="button" onclick="location.href = '<%=request.getContextPath()%>'">Men&uacute; Inicio</button>
        </form>
        <!-- meter un operador ternario que evalue si esta vacio mensaje si lo esta, que no imprima nada sino impime mendaje -->
        <p><%= request.getParameter("mensaje")%></p>        
    </body>
</html>
