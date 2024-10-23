<%@page import="es.albarregas.controllers.beans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    StringBuilder mensaje = new StringBuilder();
    //SACO LA SESION
    HttpSession sesion = request.getSession();
    Boolean existe = false;

    /* -----------BORRAR ESTO AL TERMINAR------------
                 PLANIFICACIÓN DEL CÓDIGO
    -------------------------------------------------
    Primero vamos a comprobar si cuando no existen
    datos nos muestra la casillas de rellenar datos
    
    Segundo, cuando haga lo primero, si ya existe 
    que muestre los datsos.
    
     */
    // DECLARO PRIMERO EL BJETO USARIO PARA PODER
    // MANDAR EL MENSAJE O EL USUARIO
    Usuario usu = null;
    //ESTO ES DEL INPUT SEARCH
    String campoBuscar = request.getParameter("buscar");
    Boolean buscado = false;
    // PRIMERO TENGO QUE ASEGURARME DE QUE EL CAMPO DE BÚSQUEDA NO ESTÁ VACÍO
    // NI SEA NULL, ADEMÁS LO LIMPIO DE ESPACIOS BLANCOS CON TRIM PARA ASEGURAR
    if (campoBuscar != null && !campoBuscar.trim().isEmpty()) {
        // comprobar si existe el usuario
        buscado = true;
        usu = (Usuario) sesion.getAttribute(campoBuscar.trim());
        if (usu != null) {
            //LO QUE CONTIENE ESTE CAMPO ES EL NOMBRE DEL ATRIBUTO DE SESIÓN
            // QUE EN ESTE ASO ESE ATRIBUTO ES EL OBJETO USUARIO
            // SI EXISTE

            //EN ESTE CASO SI NO ES DISTINTO DE NULL ES QUE EXISTE
            //DEBEMOS PASAR EL OBJETO USUARIO
            existe = true;
            // EN CASO COBTRARIO PASAMOS UNA VARIABLE
            // Y QUE NOS MUESTRE EL CONTENIDO PARA RELLENAR
        }
    } else {
        mensaje.append("No se puede buscar un campo vacío");
    }
    if (existe) {
        request.setAttribute("usuario", usu);
    } else {
        request.setAttribute("mensaje", mensaje);
    }
    request.setAttribute("buscado", buscado);

    RequestDispatcher dispachador = request.getRequestDispatcher("vistaControlSesiones.jsp");
    dispachador.forward(request, response);
    //BUSCAR SI EXISTE EL ATRIBUTO NOMBRE X
    // SI EXISTE MOSTRAR DATOS
    // SINO MOSTRAR LOS CAMPOS VACÍOS
    // CREAR UN NUEVO USARIO
    // VER SI TODOS LOS CAMPOS != NULL
    // SI SON 
    // SACAR LA SESION ACTUAL O CREAR NUEVA
    /*  if (request.getParameter("eliminar") != null) {
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

     */
// BORRAR LA SESION CON  removeAttribute(java.lang.String name)

%>