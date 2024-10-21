<%@page import="java.lang.NullPointerException"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <%
            Cookie cookie = null;
            Boolean existe = false;
            // cookie = new Cookie("cookieUsuario", URLEncoder.encode("Maria", "UTF-8"));
            String nombreUsuario = String.valueOf(request.getParameter("nombre")) ;
            String recordarUsuario = request.getParameter("recordarUsuario");
            
            //CREAS EL ARRAY DE COOKIES
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    if (cookies[i].getName().equals("cookieUsuario")) {
                        cookie = cookies[i];
                        //AHORA EL BREAK TE GUARDA LA POSICIÓN
                        break;
                    }
                }
            }
            
            if(request.getParameter("limpiar")!=null){
                cookie.setMaxAge(0);
            }

            if (cookie == null) { //recordarUsuario != null &&
                cookie = new Cookie("cookieUsuario", URLEncoder.encode(nombreUsuario, "UTF-8"));
        %>
        <p>La cookie no existe y la creo</p>
        <%        } else {
            existe = Boolean.TRUE;
        %>
        <p>La cookie sí existe</p>
        <%
            }
        %>
        <h1>Recordar Usuario Formulario</h1>

        <form action="../jsp/recordarUsuario.jsp" method="post">

            <%                
                if (existe == true) {
                // SI LA COOKIE HA SIDO CREADA COJO SU VALOR
                    String valorCookie = URLDecoder.decode(cookie.getValue(), "UTF-8");
                    // pones el checkBox en dissable
            %>
            <p>La cookie si existía y estas en el deshabilitado</p>
            <label for="nombre">Nombre:</label>
            <input type="text" name="nombre" value="<%= valorCookie %>"><br>
            <label for="contrasenia">Contraseña:</label>
            <input type="text" name="contrasenia"><br>
            <input name = "recordarUsuario" type = "checkbox" disabled> Recordar usuario<br>          
            <%
            } else {
            %>
            <p>La cookie No existía y estas en el habilitado</p>

            <label for="nombre">Nombre:</label>
            <input type="text" name="nombre"><br>
            <label for="contrasenia">Contraseña:</label>
            <input type="text" name="contrasenia"><br>
            <input name = "recordarUsuario" type = "checkbox" > Recordar usuario<br>   
            <%
                }
            %>

            <input type="submit" name="enviar">

        </form>
        <%
        %>
        <p>La cookie no existe pero se va a crear. Esto es el catch</p>
        <%            // final del try
            cookie.setMaxAge(3600);
            response.addCookie(cookie);
            /*response.addCookie(user) esto añade la cookie al request[] de las cookies

            si el nombre.lenth es != 0 
                    disabled
            sino pues el input normal*/
        %>

    </body>
</html>
