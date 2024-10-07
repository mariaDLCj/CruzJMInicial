<%-- 
    Document   : comprobarEdad
    Created on : 4 oct 2024, 16:31:39
    Author     : badoe
--%>

<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comprobar edad</title>
    </head>
    <body>
        <%
            StringBuilder mensaje = new StringBuilder();
            LocalDate fechaNac = LocalDate.parse(request.getParameter("fecha_Nacimiento"));
            LocalDate ahora = LocalDate.now();

            Period periodo = Period.between(fechaNac, ahora);

            if (request.getParameter("nombre") != null && request.getParameter("fecha_Nacimiento") != null) {
                mensaje.append("Hola, ").append(request.getParameter("nombre"));

                // SI TODO ESTA A 0 HAS NACIDO HOY
                
                // PENSAR MEJOR LO DE LAS COMAS Y LAS Y
                
                // ESTO ESTA MAL
                if (fechaNac.isAfter(ahora)) {
                    mensaje.append(" aún no has nacido");
                }else{
                
                //COMPROBAMOS EL TIEMPO
                if (periodo.getYears() > 1) {
                    mensaje.append(" has nacido hace ").append(periodo.getYears()).append(" años");
                } else if (periodo.getYears() == 1) {
                    mensaje.append(" has nacido hace ").append(periodo.getYears()).append(" año");
                }

                if (periodo.getMonths() > 0) {
                    mensaje.append(", ");
                }

                if (periodo.getMonths() > 1) {
                    mensaje.append(periodo.getMonths()).append(" meses");
                } else if (periodo.getMonths() == 1) {
                    mensaje.append(periodo.getMonths()).append(" mes");
                }

                if (periodo.getMonths() >0 || periodo.getYears() > 0 && periodo.getDays() > 0) {
                    mensaje.append(" y ");
                } else {
                    mensaje.append(" has nacido hace ");
                }

                if (periodo.getDays() > 1) {
                    mensaje.append(periodo.getDays()).append(" días");
                } else if (periodo.getDays() == 1) {
                    mensaje.append(periodo.getDays()).append(" día");
                }                
            }
        %>
        <h2><%=mensaje.toString()%></h2>
    </body>
</html>
