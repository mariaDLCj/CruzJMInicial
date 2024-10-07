<%@page import="java.util.Random"%>
<%@page import="java.lang.StringBuilder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Número Secreto</title>
        <link  href="<%=request.getContextPath()%>/css/adivinarNumero.css"/>

    </head>
    <body>
        <h1>Juego del n&uacute;mero secreto</h1>
        <h2>El ordenador piensa en un n&uacute;mero del 1 al 100 y tenemos que adivinarlo en la menor cantirdad de intentos posibles.</h2>

        <%
            /*PARA PODER MANTENER LA INFORMACIÓN AL IGUAL QUE EN OTROS EJERCICIOS
            SE PASAN ALGUNOS PARÁMETROS A TRAVÉS DE CAMPOS INVISIBLES EN EL FORMULARIO
            EN ESTE CASO SERÁ EL NÚMERO SECRETO, EL NÚMERO DE INTENTOS Y EL MENSAJE
            PARA QUE NO SE BORRE A CADA INTENTO. SE RECUPERAN DE LA LÍNEA 81.*/
            String numeroSecretoParam = request.getParameter("numeroSecreto");
            String intentosParam = request.getParameter("intentos");
            String mensajeParam = request.getParameter("mensaje");
            String numerosJugadosParam = request.getParameter("numerosJugados");

            int numeroSecreto = 0;
            int intentos = 0;
            StringBuilder mensaje = new StringBuilder();
            StringBuilder numerosJugados = new StringBuilder();
            boolean conseguido = false;

            // SI LOS PARÁMETROS SON NULLOS ES QUE NO SE HAN INICIALIZADO
            if (numeroSecretoParam == null || intentosParam == null || mensajeParam == null || numerosJugadosParam == null) {
                Random aleatorio = new Random();
                //EL RANDOM HAY QUE PONERLE UN NÚMERO MÁS DEL QUE SE QUIERE
                numeroSecreto = aleatorio.nextInt(101);
                intentos = 0;
                // EN CASO CONTRARIO ES QUE SÍ SE HA EMPEZADO EL JUEGO Y SE RECUPERAN LOS DATOS
            } else {
                //IMPORTANTE CONVERTIRLOS, EN EL INPUT SE PASAN COMO STRING
                numeroSecreto = Integer.parseInt(numeroSecretoParam);
                intentos = Integer.parseInt(intentosParam);
                mensaje.append(mensajeParam);
                numerosJugados.append(numerosJugadosParam);
            }

            String intentoJugador = request.getParameter("numeroJugador");

            // SI EL NÚMERO INTRODUCIDO NO ES NULL ES UN NUEVO INTENTO
            if (intentoJugador != null) {
                //COMPROBAMOS SI ES EL NÚMERO Y SI ES UNA LETRA
                try {
                    int numeroJugador = Integer.parseInt(intentoJugador);
                    intentos++;
                    numerosJugados.append(numeroJugador).append("<br>"); // Agregar número jugado a la lista
                    // COMPROBAMOS QUE EL NÚMERO ES DEL RANGO ELEGIDO
                    if (numeroJugador > 100 || numeroJugador < 1) {
                        mensaje.append("Introduce un n&uacute;mero del 1 al 100, por favor.");
                    } else {
                        if (numeroJugador == numeroSecreto) {
                            mensaje.append("Intento ").append(intentos).append(": Acertado ");
                            conseguido = true;
                        } else if (numeroJugador < numeroSecreto) {
                            mensaje.append("Intento ").append(intentos).append(": ").append(numeroJugador).append(" el n&uacute;mero secreto es mayor<br>");
                        } else {
                            mensaje.append("Intento ").append(intentos).append(": ").append(numeroJugador).append(" el n&uacute;mero secreto es menor<br>");
                        }
                    }
                } catch (NumberFormatException e) {
                    mensaje.append("Por favor, introduce un n&uacute;mero v&aacute;lido.<br>");
                }
            }
        %>


        <form method="post" action="adivinarNumero.jsp">
            <label for="numeroJugador">Introduce un número del 1 al 100:</label>
            <!-- PARA INTRODUCIR LOS DATOS DEL USUARIO -->
            <input type="text" id="numeroJugador" name="numeroJugador" required>

            <!-- PASAMOS LOS PARÁMETROS PARA MANTENER LOS DATOS EN UN CAMPO OCULTO -->
            <input type="hidden" name="numeroSecreto" value="<%= numeroSecreto%>">
            <input type="hidden" name="intentos" value="<%= intentos%>">
            <input type="hidden" name="mensaje" value="<%= mensaje.toString()%>">
            <input type="hidden" name="numerosJugados" value="<%= numerosJugados.toString()%>">

            <input type="submit" value="Probar">
            <!-- AQUÍ SE MUESTRAN LOS INTENTOS DEL JUGADOR -->
            <table>
                <tr>
                    <th>Intentos</th>
                    <th>Números Jugados</th>
                </tr>
                <tr>
                    <td><p><%= mensaje.toString()%></p></td>
                    <td><p><%= numerosJugados.toString()%></p></td>
                </tr>
            </table>
            <%
                if (conseguido == true) {
            %>
            <p>Conseguido en: <%=intentos%> intentos</p>
            <%
                }
            %>

        </form>

        <br>
        <a href="adivinarNumero.jsp">Probar de nuevo</a>
        <a href="adivinarNumero.jsp">Inicio</a>

    </body>
</html>