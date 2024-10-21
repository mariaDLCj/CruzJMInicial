<%-- 
    Document   : vistaControlSesiones
    Created on : 17 oct 2024, 16:44:12
    Author     : badoe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/gestionSesion.css">

    </head>
    <body>
        <h1>Controlador de Sesiones</h1>
        <div>

            <form action="action" method="post">
                <div class="contenedor">
                    <p>Atributo de sesi&oacute;n</p>
                    <input type="search" name="buscar">
                    <input type="submit" name="enviar" value="buscar">
                </div>

                <div class="contenedorCampos">
                    <p>Datos del atributo de sesi&oacute;n</p>
                    <label for="nombre">Nombre</label>
                    <input type="text" name="nombre">
                    <label for="hijos">N&uacute;mero hijos</label>
                    <input type="number" name="hijos">
                    <label for="fecha">Fecha Nacimiento</label>
                    <input type="date" name="fecha">
                    <label for="salario">Salario:</label>
                    <input type="number" name="salario" step="0.01">
                </div>

                <div class="contenedor">
                    <p>Acciones</p>
                    <input type="submit" name="enviar" value="Crear">
                    <input type="submit" name="enviar" value="Cancelar">
                    <input type="submit" name="enviar" value="Modificar">
                    <input type="submit" name="enviar" value="Eliminar">
                    <a href="<%=request.getContextPath()%>" >Inicio</a>
                </div>

            </form>

        </div>
    </body>
</html>
