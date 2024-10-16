
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/menuCookie.css"/>

    </head>
    <body>
        <h1>Contador Cookies</h1>
        <%!
            public void borrarCookie(Cookie cookie) {
                cookie.setMaxAge(0);
            }
        %>
        <%

            int contadorVeces = 0;
            Cookie cookie = null;
            Boolean existe = false;

            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    if (cookies[i].getName().equals("CookiePionera")) {
                        cookie = cookies[i];
                        break;
                    }
                }
            }
            if (cookie == null) {
            //new cookie contador cookie 0
            //if cookie get value = 1 info y primera vez 
            //else el otro
                cookie = new Cookie("CookiePionera", URLEncoder.encode("María De La Cruz", "UTF-8"));
            } else {
                existe = Boolean.TRUE;
            }

            cookie.setMaxAge(3600);
            response.addCookie(cookie);
            String edadCookie = Integer.toString(cookie.getMaxAge());
            String seguraCookie = Boolean.toString(cookie.getSecure());
            String versionCookie = Integer.toString(cookie.getVersion());
            StringBuilder persona = new StringBuilder();
            if (!existe) {
                contadorVeces++;
                persona.append("Has entrado ").append(contadorVeces).append(" veces").append("<br>");
            } else {
                contadorVeces++;
                persona.append("Esta es la primera vez que entras");
               // persona.append(URLDecoder.decode(cookie.getValue(), "UTF-8")).append("<br>");
                //persona.append(URLDecoder.decode(cookie.getName(), "UTF-8")).append("<br>");
                //persona.append(URLDecoder.decode(edadCookie, "UTF-8")).append("<br>");
                //persona.append(URLDecoder.decode(versionCookie, "UTF-8")).append("<br>");
                //persona.append(URLDecoder.decode(seguraCookie, "UTF-8")).append("<br>");
            }

        %>

        <p><%= persona.toString()%></p>
        <form action="../jsp/contadorCookie.jsp" method="post">
            <p>Nombre: <%= cookie.getName()%></p>
            <p>Caducidad: <%= edadCookie%></p>
            <p>Segura: <%= seguraCookie%></p>
            <p>Versión: <%= versionCookie %> </p>

            <input type="submit" name="recargar" value="Recargar">
            <button name="button" type="button"  onclick="borrarCookie()">Eliminar</button>

            <!-- ELIMINAS LA COOKIE IGUALANDO MAXAGE = 0 Y VUELVES AL INICIO -->
            <button name="button" type="button" onclick="Location.href = '<%=request.getContextPath()%>'">Volver</button>
        </form>

    </body>
</html>
