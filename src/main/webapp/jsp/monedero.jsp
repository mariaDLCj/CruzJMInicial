<%-- 
    Document   : monedero
    Created on : 9 oct 2024, 20:43:05
    Author     : badoe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            double cantidad = Double.parseDouble(request.getParameter("cantidad"));
            double precio = Double.parseDouble(request.getParameter("precio"));
            // DECLARAR EL STRINGBUILDER
            StringBuilder mensaje = new StringBuilder();

            // DECLARAMOS LAS VARIABLES A USAR
            int NumB500, NumB200, NumB100, NumB50, NumB20, NumB10, NumB5 = 0;
            int NumE2, NumE1, NumC50, NumC20, NumC10, NumC5, NumC05, NumC02, NumC01 = 0;

            try {
                // VAMOS A CALCULAR LA VUELTA
                double vuelta = cantidad - precio;
                // while (cantidad != 0) {

                /*
                Monedero: 

                posibles patrones:

                500 200 100 	x100

                50   20  10 	x10 5 / 2 como entero = 2

                5     2   1 		x1

                0.5 0.2 0.1  	x0.1 si contiene un 5 se divide entre 2'5 sino entre 2 
                                        lo pasas a cadena y miras si tiene un 5 con contains
                0.05 0.02 0.01  x0.01

                Se v adiviendo entre 10 desde el 100 hasta 0.01

                todo esto va en un while ()
                
                
                 */
                // VAMOS A SACAR LA CANTIDAD DE BILLETES O MONEDAS
            } catch (NumberFormatException e) {
                mensaje.append("Valores incorrectos");
            }
        %>
        <h1><%= mensaje%></h1>
        <button type="button" onclick="location.href = '<%=request.getContextPath()%>'">Men&uacute; Inicial</button>
    </body>
</html>
