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
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/comprobarEdad.css">

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
                    mensaje.append(" aún no has nacido.");
                } else if (fechaNac.isEqual(ahora)) {
                    mensaje.append(" has nacido hoy.");
                } else {

                    mensaje.append(" has nacido hace ");

                    //COMPROBAMOS AÑOS
                    if (periodo.getYears() > 1) {
                        mensaje.append(periodo.getYears()).append(" años");
                    } else if (periodo.getYears() == 1) {
                        mensaje.append(periodo.getYears()).append(" año");
                    }

                    // SU HAY MESES AÑADES UNA COMA, SINO HAY MESES Y HAY DÍAS AÑADES Y
                    // SI NINGUNO PUES AÑADES .
                    if (periodo.getYears() > 0 && periodo.getMonths() > 0 && periodo.getDays() > 0) {
                        mensaje.append(", ");
                        // sino hay meses pero si dias
                    } else if (periodo.getMonths() <= 0 && periodo.getDays() <= 0) {
                        mensaje.append(" .");
                    } else if (periodo.getMonths() > 0 && periodo.getYears() > 0 && periodo.getDays() <= 0) {
                        mensaje.append(" y ");
                    }

                    // SI ES UN MES O MÁS
                    if (periodo.getMonths() > 1) {
                        mensaje.append(periodo.getMonths()).append(" meses");
                    } else if (periodo.getMonths() == 1) {
                        mensaje.append(periodo.getMonths()).append(" mes");
                    }

                    // SI NO HAY DIAS PONES .
                    if (periodo.getDays() <= 0 && periodo.getMonths() > 0) {
                        mensaje.append(" .");
                    } else if (periodo.getDays() > 0 && (periodo.getMonths() > 0 || periodo.getYears() > 0)) {
                        mensaje.append(" y ");
                    }

                    if (periodo.getDays() > 1) {
                        mensaje.append(periodo.getDays()).append(" días.");
                    } else if (periodo.getDays() == 1) {
                        mensaje.append(periodo.getDays()).append(" un día.");
                    }
                }

            } else {
                mensaje.append(periodo.getDays()).append("Por favor, rellena los campos");
        %>
        <a href="<%=request.getContextPath()%>/html/comprobarEdad.html" >Volver</a>
        <%
            }
        %>
        <div class="contenedor">
            <h2><%=mensaje.toString()%></h2>
            <a href="<%=request.getContextPath()%>" >Inicio</a>
        </div>
    </body>
</html>
