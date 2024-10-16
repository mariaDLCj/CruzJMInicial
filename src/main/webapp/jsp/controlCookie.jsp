
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%

// response.sendRedirect("NombreServlet?NombreVariable="+ValorVariable);
// PRIMERO TENEMOS QUE PASARLE AL JSP LOS PARÁMETROS DE LA VISTA
    String nombreCookie = request.getParameter("nombre");
    String valorCookie = request.getParameter("contenido");
    String mensaje = "";
// LOS DATOS DE LAS COOKIES
    Cookie cookie = null;
    Boolean existe = false;
    Cookie[] cookies = request.getCookies();

    //COMPROBAMOS SI EXISTE EL NOMBRE DE LA COOKIE
    for (int i = 0; i < cookies.length; i++) {
        //BUSCAMOS EL NOMBRE DE LA COOKIE SI ESTÁ ES QUE EXISTE
        if (cookies[i].getName().equals(nombreCookie)) {
            cookie = cookies[i];
            mensaje = "La cookie " + nombreCookie + " ya existe.";
            existe = true;
            break;
            // LA COOKIE YA EXISTE
        }

        if (request.getParameter("crear") != null && !request.getParameter("crear").isEmpty()) {
            if (existe == true) {
                mensaje = "La cookie " + nombreCookie + " ya existe";
            } else {
                cookie = new Cookie(nombreCookie, URLEncoder.encode(valorCookie, "UTF-8"));
                cookie.setMaxAge(3600);
                mensaje = "La cookie " + nombreCookie + " ha sido creada";
                response.addCookie(cookie);
            }
        }
    }

    if (request.getParameter("visualizar") != null && !request.getParameter("visualizar").isEmpty()) {
        if (existe == true) {
            mensaje = "La cookie " + nombreCookie + " tiene valor de " + cookie.getValue();
            response.addCookie(cookie);
        } else {
            mensaje = "La cookie " + nombreCookie + " no existe";
        }
    }

    if (request.getParameter("modificar") != null && !request.getParameter("modificar").isEmpty()) {
        if (existe == true) {
            cookie.setValue(valorCookie);
            mensaje = "La cookie " + nombreCookie + " ha cambiado su valor a " + nombreCookie;
            response.addCookie(cookie);
        } else {
            mensaje = "La cookie " + nombreCookie + " no existe";
        }
    }

    if (request.getParameter("eliminar") != null && !request.getParameter("eliminar").isEmpty()) {
        if (existe == true) {
            cookie.setMaxAge(0);
            mensaje = "La cookie " + nombreCookie + " ha sido eliminada";
            response.addCookie(cookie);
        } else {
            mensaje = "La cookie " + nombreCookie + " no existe";
        }
    }
// PASAMOS EL MENSAJE A LA VISTA
    response.sendRedirect("../jsp/menuCookie.jsp?mensaje=" + URLEncoder.encode(mensaje, "UTF-8"));


%>
