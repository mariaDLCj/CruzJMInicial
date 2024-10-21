<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>

<%
    String nombreCookie = request.getParameter("nombre");
    String valorCookie = request.getParameter("contenido");
    String mensaje = "";
    Cookie cookie = null;
    Boolean existe = false;
    Cookie[] cookies = request.getCookies();

    // SI LA COOKIE EXISTE
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals(nombreCookie)) {
                cookie = cookies[i];
                existe = true;
                break;
            }
        }
    }

    // SI ENVIAR NO ESN ULL
    if (request.getParameter("enviar") != null) {
    // HAY QUE AÑADIR LA COOKIE EN TODOS LOS CASOS QUE CONLLEVEN UNA MODIFICACIÓN
        switch (request.getParameter("enviar")) {
            case "Crear":
                if (existe) {
                    mensaje = "La cookie " + nombreCookie + " ya existe.";
                } else {
                    cookie = new Cookie(nombreCookie, URLEncoder.encode(valorCookie, "UTF-8"));
                    cookie.setMaxAge(3600);
                    response.addCookie(cookie);
                    mensaje = "La cookie " + nombreCookie + " ha sido creada.";
                }
                break;
            case "Visualizar":
                if (existe) {
                    mensaje = "La cookie " + nombreCookie + " tiene valor de " + cookie.getValue();
                } else {
                    mensaje = "La cookie " + nombreCookie + " no existe.";
                }
                break;
            case "Modificar":
                if (existe) {
                    cookie.setValue(URLEncoder.encode(valorCookie, "UTF-8"));
                    response.addCookie(cookie);
                    mensaje = "La cookie " + nombreCookie + " ha cambiado su valor.";
                } else {
                    mensaje = "La cookie " + nombreCookie + " no existe.";
                }
                break;
            case "Eliminar":
                if (existe) {
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                    mensaje = "La cookie " + nombreCookie + " ha sido eliminada.";
                } else {
                    mensaje = "La cookie " + nombreCookie + " no existe.";
                }
                break;
        }
    }

    // PASO EL MENSAJE A LA VISTA
    response.sendRedirect("../jsp/menuCookie.jsp?mensaje=" + URLEncoder.encode(mensaje, "UTF-8"));
%>

