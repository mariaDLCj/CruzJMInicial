
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/adivinarNumero.css">

    </head>
    <body>
        <h1>Contador Cookies</h1>
        <%!
            public void borrarCookie(Cookie cookie, Cookie contador) {
                cookie.setMaxAge(0);
                contador.setMaxAge(0);
            }
        %>
        <%

            // INCIALIZO TODO
            Cookie contadorCookie = null;
            int contador = 0;
            Cookie cookie = null;
            Boolean existe = false;
            Boolean existeContador = false;

            // COMPRUEBO SI LA COOKIE EXISTE, SI LO HACE TAMBIÉN LO HARÁ LA CONTADORA
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    if (cookies[i].getName().equals("nombreConCookie")) {
                        cookie = cookies[i];
                        existe = true;
                        //break
                    }
                    if (cookies[i].getName().equals("contador")) {
                        contadorCookie = cookies[i];
                        existeContador = true;
                        //break
                    }
                }
            }

            if (existeContador) {
                contador = Integer.parseInt(URLDecoder.decode(contadorCookie.getValue(), "UTF-8"));
                contador++;
                contadorCookie.setValue(URLEncoder.encode(String.valueOf(contador), "UTF-8"));
                response.addCookie(contadorCookie);
            } else {
                contador = 1;
                contadorCookie = new Cookie("contador", URLEncoder.encode(String.valueOf(contador), "UTF-8"));
                contadorCookie.setMaxAge(3600);
                response.addCookie(contadorCookie);
            }

            if (!existe) {
                cookie = new Cookie("nombreConCookie", URLEncoder.encode("María De La Cruz", "UTF-8"));
                cookie.setMaxAge(3600);
                response.addCookie(cookie);
            }

        %>
        <div class="contenedor">
            <form action="../jsp/contadorCookie.jsp" method="post">

                <% if (contador > 1) {
                %>
                <p>Hola, has entrado un total de: <%= contadorCookie.getValue()%> veces</p>
                <%
                } else {
                %>
                <p>Hola, esta es la primera vez que entras.</p>
                <p>Nombre:<%=cookie.getName()%></p>
                <p>Caducidad:<%=cookie.getMaxAge()%></p>
                <p>Segura:<%=cookie.getSecure()%></p>
                <p>Versión:<%=cookie.getVersion()%></p>
                <p>Veces entradas:<%=contador%></p>
                <%
                    }

                %>

                <input type="submit" name="recargar" value="Recargar">
                <button name="button" type="button" onclick="borrarCookie(cookie,contadorCookie)">Eliminar</button>

                <!-- ELIMINAS LA COOKIE IGUALANDO MAXAGE = 0 Y VUELVES AL INICIO -->
                <button type="button" onclick="location.href = '<%=request.getContextPath()%>'">Men&uacute; Inicio</button>
            </form>
        </div>

    </body>
</html>
