<%-- 
    Document   : calculadora
    Created on : 3 oct 2024, 17:04:09
    Author     : badoe
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Calculadora!</h1>

        <%!
            public int sumar(int param1, int param2) {
                return param1 + param2;
            }

            public int multiplicar(int param1, int param2) {
                return param1 * param2;
            }

            public int restar(int param1, int param2) {
                return param1 - param2;
            }

            public int dividir(int param1, int param2) {
                if (param2 > 0 && param1 > 0) {
                    return param1 / param2;

                } else {
        %>
        <p>Se está intentando dividir entre 0</p>
        <%!   return -1;
                }
            }
            //puedes mandar por texto el mesnaje de error con 
%>
<%
            if (request.getParameter("enviar") == null) {
        %>
        <form method="post" action="calculadora.jsp" >
            <input type="submit" name="enviar" value="true">
            <table>
                <tr>
                    <td>Primer número:</td>
                    <td><input name="param1"></td>
                </tr>
                <tr>
                    <td>Segundo número:</td>
                    <td><input name="param2"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Sumar"></td>
                </tr>

                <tr>
                    <td> <input type="radio" name="operacion" value="sumar" checked />
                        <label>Sumar</label></td>
                    <td> <input type="radio" name="operacion" value="restar" />
                        <label>Restar</label></td>
                    <td> <input type="radio" name="operacion" value="multiplicar"/>
                        <label>Multiplicar</label></td>
                    <td> <input type="radio" name="operacion" value="dividir"/>
                        <label>Dividir</label></td>
                </tr>
            </table>
        </form>

        <%
        } else {
            String operacion = request.getParameter("operacion");
            switch (operacion) {
                case "sumar":
                    try {
                    int param1 = Integer.parseInt(request.getParameter("param1"));
                    int param2 = Integer.parseInt(request.getParameter("param2"));
                    int result = param1 + param2;
        %>
        <p>El resultado de la suma es: <%= sumar(param1, param2)%></p>
        <%
        } catch (NumberFormatException ex) {
        %>
        <p>Alguno de los números no contenía dígitos válidos...</p>
        <%
        }//CIERRE DEL CATCH SUMAR
        break; // BREAK DE SUMAR
        %>
        <p><%= Calendar.getInstance().getTime()%></p>
        <a href="../index.html">Volver atrás...</a>

        <%
            case "restar":
                    try {
                int param1 = Integer.parseInt(request.getParameter("param1"));
                int param2 = Integer.parseInt(request.getParameter("param2"));
                int result = param1 - param2;
        %>
        <p>El resultado de la resta es: <%= restar(param1, param2)%></p>
        <%
        } catch (NumberFormatException ex) {
        %>
        <p>Alguno de los números no contenía dígitos válidos...</p>
        <%
            }//CIERRE DEL CATCH RESTAR
            break; // BREAK DE RESTAR
        %>

        <%
            case "multiplicar":
                    try {
                int param1 = Integer.parseInt(request.getParameter("param1"));
                int param2 = Integer.parseInt(request.getParameter("param2"));
                int result = param1 * param2;
        %>
        <p>El resultado de la multiplicación es: <%= multiplicar(param1, param2)%></p>
        <%
        } catch (NumberFormatException ex) {
        %>
        <p>Alguno de los números no contenía dígitos válidos...</p>
        <%
            }//CIERRE DEL CATCH MULTIPLICAR
            break; // BREAK DE MULTIPLICAR
        %>

        <%
            case "dividir":
                    try {
                int param1 = Integer.parseInt(request.getParameter("param1"));
                int param2 = Integer.parseInt(request.getParameter("param2"));
                int result = param1 / param2;
        %>
        <p>El resultado de la división es: <%= dividir(param1, param2)%></p>
        <%
        } catch (NumberFormatException ex) {
        %>
        <p>Alguno de los números no contenía dígitos válidos...</p>
        <%
            }//CIERRE DEL CATCH DIVIDIR
            break; // BREAK DE DIVIDIR
        %>

        <%
            default:
                    try {
                int param1 = Integer.parseInt(request.getParameter("param1"));
                int param2 = Integer.parseInt(request.getParameter("param2"));
                int result = param1 + param2;
        %>
        <p>El resultado de la suma es: <%= sumar(param1, param2)%></p>
        <%
        } catch (NumberFormatException ex) {
        %>
        <p>Alguno de los números no contenía dígitos válidos...</p>
        <%
            }//CIERRE DEL CATCH DEFAULT
            break; // BREAK DE DIVIDIR
        %>

        <%
                }// CIERRE DEL SWITCH
            }// CIERRE DEL ELSE
%>

    </body>
</html>
