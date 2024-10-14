<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1></h1>
        <%

            Cookie cookie = null;
            Boolean existe = false;

            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    if (cookies[i].getName().equals("nombreConCookie")) {
                        cookie = cookies[i];
                        break;
                    }
                }
            }
            if (cookie == null) {
                cookie = new Cookie("nombreConCookie",URLEncoder.encode("María De La Cruz","UTF-8"));
            } else {
                existe = Boolean.TRUE;
            }
            cookie.setMaxAge(3600);
            response.addCookie(cookie);
            StringBuilder persona = new StringBuilder();
            if(!existe){
                persona.append("Hola, ").append(URLDecoder.decode(cookie.getValue(),"UTF-8"));
            }else{
            persona.append("Todavía no exitend dtos");
            }
            
        %>
        
        <h1><%= persona.toString() %></h1>
        <form action="miNombre.jsp" method="post">
            
            <input type="" onclick="Location.href='<%=request.getContextPath()%>'">
        </form>
    </body>
</html>
