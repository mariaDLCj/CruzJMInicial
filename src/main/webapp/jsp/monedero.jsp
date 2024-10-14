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

                // Monedas
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

                // Generamos el mensaje con los resultados
                if (NumB500 > 0) {
                    mensaje.append("Billetes de 500: ").append(NumB500).append("\n");
                }
                if (NumB200 > 0) {
                    mensaje.append("Billetes de 200: ").append(NumB200).append("\n");
                }
                if (NumB100 > 0) {
                    mensaje.append("Billetes de 100: ").append(NumB100).append("\n");
                }
                if (NumB50 > 0) {
                    mensaje.append("Billetes de 50: ").append(NumB50).append("\n");
                }
                if (NumB20 > 0) {
                    mensaje.append("Billetes de 20: ").append(NumB20).append("\n");
                }
                if (NumB10 > 0) {
                    mensaje.append("Billetes de 10: ").append(NumB10).append("\n");
                }
                if (NumB5 > 0) {
                    mensaje.append("Billetes de 5: ").append(NumB5).append("\n");
                }

                if (NumE2 > 0) {
                    mensaje.append("Monedas de 2: ").append(NumE2).append("\n");
                }
                if (NumE1 > 0) {
                    mensaje.append("Monedas de 1: ").append(NumE1).append("\n");
                }
                if (NumC50 > 0) {
                    mensaje.append("Monedas de 0.50: ").append(NumC50).append("\n");
                }
                if (NumC20 > 0) {
                    mensaje.append("Monedas de 0.20: ").append(NumC20).append("\n");
                }
                if (NumC10 > 0) {
                    mensaje.append("Monedas de 0.10: ").append(NumC10).append("\n");
                }
                if (NumC5 > 0) {
                    mensaje.append("Monedas de 0.05: ").append(NumC5).append("\n");
                }
                if (NumC02 > 0) {
                    mensaje.append("Monedas de 0.02: ").append(NumC02).append("\n");
                }
                if (NumC01 > 0) {
                    mensaje.append("Monedas de 0.01: ").append(NumC01).append("\n");
                }
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
