<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="javax.servlet.http.Cookie"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/adivinarNumero.css">

    </head>
    <body>
        <h1>Recordar nombre con Cookies</h1>
        <%

            Cookie cookie = null;
            Boolean existe = false;

            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    if (cookies[i].getName().equals("nombreConCookie")) {
                        cookie = cookies[i];
                        existe = true;
                        break;
                    }
                }
            }/*
            if (cookie == null) {
                cookie = new Cookie("nombreConCookie", URLEncoder.encode("María De La Cruz", "UTF-8"));
            } else {
                existe = Boolean.TRUE;
            }*/

            StringBuilder persona = new StringBuilder();
            // persona.append(cookie.getValue());
            if (existe) {
                persona.append("Hola, ").append(URLDecoder.decode(cookie.getValue(), "UTF-8"));
            } else {
                cookie = new Cookie("nombreConCookie", URLEncoder.encode("María De La Cruz", "UTF-8"));
                cookie.setMaxAge(3600);
                response.addCookie(cookie);
                persona.append("Todavía no existen datos");
            }

        %>
        <div class="contenedor">
            <p><%= persona.toString()%></p>
        </div>

        <div class="contenedor">
            <form action="miNombre.jsp" method="post">
                <button type="button" onclick="location.href = '<%=request.getContextPath()%>'">Men&uacute; Inicio</button>
            </form>
        </div>

    </body>
</html>
