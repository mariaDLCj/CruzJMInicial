<%-- 
    Document   : vistaControlSesiones
    Created on : 17 oct 2024, 16:44:12
    Author     : badoe
--%>

<%@page import="es.albarregas.controllers.beans.Usuario"%>
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
        <%
            Boolean buscado = (Boolean) request.getAttribute("buscado");
        %>
        <div>
            <form action="action" method="post">
                <!-- ESTE DIV SE MUESTRA SSIEMPRE -->
                <div class="contenedor">
                    <p>Atributo de sesi&oacute;n</p>
                    <input type="search" name="buscar">
                    <input type="submit" name="enviar" value="buscar">
                </div>

                <%
                    if (buscado!=null) {
                        // SE TRAEN LOS DATOS DESDE EL CONTROLADOR
                        String mensaje = (String) request.getAttribute("mensaje");
                        Usuario usu = (Usuario) request.getAttribute("usuario");

                        boolean existeUsu = false;
                        boolean existeMensaje = false;

                        if (usu != null) {
                            existeUsu = true;
                            // SI EXISTE EL USUARIO PONERMOS SUS DATOS EN EL VALUE
                %>
                <div class="contenedorCampos">
                    <p>Datos del atributo de sesi&oacute;n</p>
                    <label for="nombre">Nombre</label>
                    <input type="text" name="nombre" value="<%= usu.getNombre()%>">
                    <label for="hijos">N&uacute;mero hijos</label>
                    <input type="number" name="hijos" value="<%= usu.getHijos()%>">
                    <label for="fecha">Fecha Nacimiento</label>
                    <input type="date" name="fecha" value="<%= usu.getFechaNacimiento()%>">
                    <label for="salario">Salario:</label>
                    <input type="number" name="salario" step="0.01" value="<%= usu.getSalario()%>">
                </div>
                <div class="contenedor">
                    <p>Acciones</p>
                    <input type="submit" name="enviar" value="Crear">
                    <input type="submit" name="enviar" value="Cancelar">
                    <a href="<%=request.getContextPath()%>" >Inicio</a>
                </div>
                <%
                } else {
                    //SI NO EXISTE EL USUARIO SE PREGUNTA POR SUS DATOS
                %>
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
                    <input type="submit" name="enviar" value="Cancelar">
                    <input type="submit" name="enviar" value="Modificar">
                    <input type="submit" name="enviar" value="Eliminar">
                    <a href="<%=request.getContextPath()%>" >Inicio</a>
                </div>
                <%
                        }// fin del if usuario!=null
                    } // fin buscado

                   /* if (mensaje != null) {
                        existeMensaje = true;
                    }
*/
                %>
                <!--
                                <div class="contenedor">
                                    <p>Acciones</p>
                                    <input type="submit" name="enviar" value="Crear">
                                    <input type="submit" name="enviar" value="Cancelar">
                                    <input type="submit" name="enviar" value="Modificar">
                                    <input type="submit" name="enviar" value="Eliminar">
                                    <a href="< %=request.getContextPath()%>" >Inicio</a>
                                </div>
                -->
            </form>

        </div>
    </body>
</html>
