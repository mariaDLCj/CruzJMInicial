<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cambiar divisas</h1>
        
        <%            
            String nuevaMoneda = request.getParameter("monedaCambio");
            String monedaOrigen = request.getParameter("origen");
            double cantidad = Double.parseDouble(request.getParameter("cantidad"));
            double cambioFinal = 0.0;
            StringBuilder mensaje = new StringBuilder();
            switch (nuevaMoneda) {
                case "Euros":
                    if (monedaOrigen.equals("Yenes")) {
                        cambioFinal = cantidad * 162.69;
                        mensaje.append("La cantidad " + cantidad + " ").append(monedaOrigen).append(" a ").append(nuevaMoneda).append(" es de " + cambioFinal);
                    } else if (monedaOrigen.equals("Dolares")) {
                        cambioFinal = cantidad * 1.10;
                        mensaje.append("La cantidad " + cantidad + " ").append(monedaOrigen).append(" a ").append(nuevaMoneda).append(" es de " + cambioFinal);
                    } else if (monedaOrigen.equals("Libras")) {
                        cambioFinal = cantidad * 0.84;
                        mensaje.append("La cantidad " + cantidad + " ").append(monedaOrigen).append(" a ").append(nuevaMoneda).append(" es de " + cambioFinal);
                    } else {
                        mensaje.append("La cantidad es la misma");
                    }
                    break;
                case "Yenes":
                    if (monedaOrigen.equals("Euros")) {
                        cambioFinal = cantidad * 0.0061;
                        mensaje.append("La cantidad " + cantidad + " ").append(monedaOrigen).append(" a ").append(nuevaMoneda).append(" es de " + cambioFinal);
                    } else if (monedaOrigen.equals("Dolares")) {
                        cambioFinal = cantidad * 0.0067;
                        mensaje.append("La cantidad " + cantidad + " ").append(monedaOrigen).append(" a ").append(nuevaMoneda).append(" es de " + cambioFinal);
                    } else if (monedaOrigen.equals("Libras")) {
                        cambioFinal = cantidad * 0.0052;
                        mensaje.append("La cantidad " + cantidad + " ").append(monedaOrigen).append(" a ").append(nuevaMoneda).append(" es de " + cambioFinal);
                    } else {
                        mensaje.append("La cantidad es la misma");
                    }
                    break;
                case "Dolares":
                    if (monedaOrigen.equals("Euros")) {
                        cambioFinal = cantidad * 0.91;
                        mensaje.append("La cantidad " + cantidad + " ").append(monedaOrigen).append(" a ").append(nuevaMoneda).append(" es de " + cambioFinal);
                    } else if (monedaOrigen.equals("Yenes")) {
                        cambioFinal = cantidad * 148.27;
                        mensaje.append("La cantidad " + cantidad + " ").append(monedaOrigen).append(" a ").append(nuevaMoneda).append(" es de " + cambioFinal);
                    } else if (monedaOrigen.equals("Libras")) {
                        cambioFinal = cantidad * 0.76;
                        mensaje.append("La cantidad " + cantidad + " ").append(monedaOrigen).append(" a ").append(nuevaMoneda).append(" es de " + cambioFinal);
                    } else {
                        mensaje.append("La cantidad es la misma");
                    }
                    break;
                case "Libras":
                    if (monedaOrigen.equals("Euros")) {
                        cambioFinal = cantidad * 1.19;
                        mensaje.append("La cantidad " + cantidad + " ").append(monedaOrigen).append(" a ").append(nuevaMoneda).append(" es de " + cambioFinal);
                    } else if (monedaOrigen.equals("Yenes")) {
                        cambioFinal = cantidad * 193.96;
                        mensaje.append("La cantidad " + cantidad + " ").append(monedaOrigen).append(" a ").append(nuevaMoneda).append(" es de " + cambioFinal);
                    } else if (monedaOrigen.equals("Dolares")) {
                        cambioFinal = cantidad * 1.31;
                        mensaje.append("La cantidad " + cantidad + " ").append(monedaOrigen).append(" a ").append(nuevaMoneda).append(" es de " + cambioFinal);
                    } else {
                        mensaje.append("La cantidad es la misma");
                    }
                    break;
            }
        %>

        <p><%=mensaje.toString()%></p>
        <a href="cambiarDivisas.jsp">Probar de nuevo</a>
        <a href="<%=request.getContextPath()%>">Inicio</a>

    </body>
</html>
