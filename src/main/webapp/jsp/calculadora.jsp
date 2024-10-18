<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculadora</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/calculadora.css"/>

    </head>
    <body>
        <h1>Calculadora!</h1>

        <%!
            StringBuilder mensaje = new StringBuilder();

            //FUNCIONES QUE VAN A HACER EL CÁLCULO
            public int sumar(int param1, int param2) {
                return param1 + param2;
            }

            public int multiplicar(int param1, int param2) {
                return param1 * param2;
            }

            public int restar(int param1, int param2) {
                return param1 - param2;
            }

            public double dividir(int param1, int param2) {
                if (param2 != 0) {
                    return param1 / param2;
                } else {
                    // LANZO LA EXCEPCIÓN DE DIVIDIR POR 0
                    throw new ArithmeticException("Se está intentando dividir entre 0");
                }
            }
        %>
        <div class="contenedor">
            <form method="post" action="calculadora.jsp">

                <tr>
                    <td>Primer n&uacute;mero:</td>
                    <td><input type="text" name="param1"></td>
                </tr>
                <tr>
                    <td>Segundo n&uacute;mero:</td>
                    <td><input type="text" name="param2"></td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="operacion" value="sumar" checked />
                        <label>Sumar</label>
                    </td>
                    <td>
                        <input type="radio" name="operacion" value="restar" />
                        <label>Restar</label>
                    </td>
                    <td>
                        <input type="radio" name="operacion" value="multiplicar"/>
                        <label>Multiplicar</label>
                    </td>
                    <td>
                        <input type="radio" name="operacion" value="dividir"/>
                        <label>Dividir</label>
                    </td>
                </tr>
                <tr>
                <input type="submit" name="enviar" value="Calcular"></td>
                </tr>

                </div>
            </form>

            <%
                if (request.getParameter("enviar") != null) {
                    mensaje = new StringBuilder();
                    // LIMPIO EL STRINGBUILDER
                    String operacion = request.getParameter("operacion");
                    try {
                        int param1 = Integer.parseInt(request.getParameter("param1"));
                        int param2 = Integer.parseInt(request.getParameter("param2"));

                        switch (operacion) {
                            case "sumar":
                                mensaje.append("El resultado de la suma es: ").append(sumar(param1, param2));
                                break;
                            case "restar":
                                mensaje.append("El resultado de la resta es: ").append(restar(param1, param2));
                                break;
                            case "multiplicar":
                                mensaje.append("El resultado de la multiplicación es: ").append(multiplicar(param1, param2));
                                break;
                            case "dividir":
                                mensaje.append("El resultado de la división es: ").append(dividir(param1, param2));
                                break;
                            default:
                                mensaje.append("Operación no válida.");
                                break;
                        }
                    } catch (NumberFormatException ex) {
                        // SI VAN VACÍO SALTA EL MENSAJE
                        mensaje.append("Todos los campos deben ir rellenos con datos válidos");
                    } catch (ArithmeticException e) {
                        // RECOJO LA EXCEPCIÓN DE ARRIBA
                        mensaje.append(e.getMessage());
                    }
            %>
            <div class="contenedor">
                <p><%= mensaje%></p>
                <%
                    }
                %>

                <p><%= Calendar.getInstance().getTime()%></p>
                <a href="../index.html">Inicio</a>
            </div>
    </body>
</html>
