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
                // VAMOS A CALCULAR LA VUELTA
                double vuelta = cantidad - precio;
                // while (cantidad != 0) {

                NumB500 = (int) (vuelta / 500);
                vuelta -= NumB500 * 500;

                NumB200 = (int) (vuelta / 200);
                vuelta -= NumB200 * 200;

                NumB100 = (int) (vuelta / 100);
                vuelta -= NumB100 * 100;

                NumB50 = (int) (vuelta / 50);
                vuelta -= NumB50 * 50;

                NumB20 = (int) (vuelta / 20);
                vuelta -= NumB20 * 20;

                NumB10 = (int) (vuelta / 10);
                vuelta -= NumB10 * 10;

                NumB5 = (int) (vuelta / 5);
                vuelta -= NumB5 * 5;

                NumE2 = (int) (vuelta / 2);
                vuelta -= NumE2 * 2;

                NumE1 = (int) (vuelta / 1);
                vuelta -= NumE1 * 1;

                NumC50 = (int) (vuelta / 0.50);
                vuelta -= NumC50 * 0.50;

                NumC20 = (int) (vuelta / 0.20);
                vuelta -= NumC20 * 0.20;

                NumC10 = (int) (vuelta / 0.10);
                vuelta -= NumC10 * 0.10;

                NumC5 = (int) (vuelta / 0.05);
                vuelta -= NumC5 * 0.05;

                NumC02 = (int) (vuelta / 0.02);
                vuelta -= NumC02 * 0.02;

                NumC01 = (int) (vuelta / 0.01);
                vuelta -= NumC01 * 0.01;

                if (NumB500 > 0) {
                %>
                <p>Billete 500: <%= NumB500 %> </p>
                <%
                }
                if (NumB200 > 0) {
                %>
                <p>Billete 200: <%= NumB200 %> </p>
                <%                }
                if (NumB100 > 0) {
                %>
                <p>Billete 100: <%= NumB100 %> </p>
                <%                }
                if (NumB50 > 0) {
                %>
                <p>Billete 50: <%= NumB50 %> </p>
                <%                 }
                if (NumB20 > 0) {
                %>
                <p>Billete 20: <%= NumB20 %> </p>
                <%                 }
                if (NumB10 > 0) {
                %>
                <p>Billete 10: <%= NumB10 %> </p>
                <%                 }
                if (NumB5 > 0) {
                %>
                <p>Billete 5: <%= NumB5 %> </p>
                <%                 }

                if (NumE2 > 0) {
                %>
                <p>Monedas 2 <%= NumE2 %> </p>
                <%                 }
                if (NumE1 > 0) {
                %>
                <p>Monedas 1 <%= NumE1 %> </p>
                <%                  }
                if (NumC50 > 0) {
                %>
                <p>Monedas 50 Cent <%= NumC50 %> </p>
                <%                  }
                if (NumC20 > 0) {
                %>
                <p>Monedas 20 Cent <%= NumC20 %> </p>
                <%                  }
                if (NumC10 > 0) {
                %>
                <p>Monedas 10 Cent <%= NumC10 %> </p>
                <%                  }
                if (NumC5 > 0) {
                %>
                <p>Monedas 5 Cent <%= NumC5 %> </p>
                <%                  }
                if (NumC02 > 0) {
                %>
                <p>Monedas 2 Cent <%= NumC02 %> </p>
                <%                  }
                if (NumC01 > 0) {
                %>
                <p>Monedas 1 Cent <%= NumC01 %> </p>
                <%                  }
                //}
                // VAMOS A SACAR LA CANTIDAD DE BILLETES O MONEDAS
            } catch (NumberFormatException e) {
                mensaje.append("Valores incorrectos");
            }
        %>
        <h1><%= mensaje %></h1>
        <button type="button" onclick="location.href = '<%=request.getContextPath()%>'">Men&uacute; Inicial</button>
    </body>
</html>
