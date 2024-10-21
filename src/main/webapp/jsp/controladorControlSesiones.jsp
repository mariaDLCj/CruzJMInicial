<%@page import="es.albarregas.controllers.beans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    StringBuilder mensaje = new StringBuilder();
    //SACO LA SESION
    HttpSession sesion = request.getSession();
    Boolean existe=false;
    //ESTO ES DEL INPUT SEARCH
    String nombreUsuario=request.getParameter("buscar");

    Usuario usu = (Usuario) sesion.getAttribute(nombreUsuario);

    if (nombreUsuario != null) {
    // comprobar si existe el usuario
        existe = true;
    }else{
        mensaje.append("No se puede buscar un campo vacío");
    }

    //BUSCAR SI EXISTE EL ATRIBUTO NOMBRE X
    // SI EXISTE MOSTRAR DATOS
    // SINO MOSTRAR LOS CAMPOS VACÍOS
    // CREAR UN NUEVO USARIO
    // VER SI TODOS LOS CAMPOS != NULL
    // SI SON 
    // SACAR LA SESION ACTUAL O CREAR NUEVA
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