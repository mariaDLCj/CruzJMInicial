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

            // VAMOS A CALCULAR LA VUELTA
            double vuelta = cantidad - precio;
            boolean correcto = false;
            Double numero = 500.0;
            int numBilletes = 0;

            while (vuelta >= 0.01) {
                if (numero != 0) {
                    numBilletes = (int) (vuelta / numero);
                    vuelta = vuelta - (numero * numBilletes); 
                    if (numero > 0.00) {
                        %>
                        <p>"Billetes/Monedas de <%= numero %> : <%=numBilletes%>);</p>
                        <%
                    }
                }
                String numText = String.valueOf(numero);
                if (numText.contains("5")) {
                    numero /= 2.5;
                } else {
                    numero /= 2;
                }
            }// fin

// Imprimir la vuelta restante
            

            /*
Monedero bueno:
numero = 500 double
int numBilletes = 0
            
pasas los reuqest a double en el try
si se aprse abien se calcula la diferencia es mi vuelta
MEterle un formateador a la vuelta
imprimri si las cantodDES SON validas imprimes la diferencia
            
while (diferencia >= 0.01) {
if numero != 0 pa que no dibida entre 0
nuemroBilletes = int diferencia / numero
diferencia = diferencia -(diferencia *numBillete);
                   
si el numBilletes es > 0.00{
imprimes el 
}
<p>  2 billetes de 500
} fin del if primero
cojo el numero double y lo transformo en texto
String numTExt= String.valueOf(numero);
if (numText.contains("5") {
        numero /= 2.5;
    } else {
        numero /= numero / 2;
    }                
} // fin del while
                        
abre div que se cierra tras el while 
metes 500€ 1 canyidad
fin monedero bueno
        
             */
 /*          
if (precio <= cantidad) {
if (vuelta != 0) {
while (billeteMoneda >= 0.01 && vuelta != 0) {
    contadormoneda = 0;
    while (vuelta >= billeteMoneda) {
        vuelta -= billeteMoneda;
        vuelta = Math.round(vuelta * 100) / 100;
        // vuelta = MathRandom.round (vuelta * 100) /100; // - para que vueltas n te den tantos decimales sino 2
        //mirar en intermet que te salgan 2 números
        contadormoneda++;
    }
    if (contadormoneda > 0) {
        mensaje.append("Billete de ").append(billeteMoneda).append(": ").append(contadormoneda).append("<br>");
        //imprimes la moneda
        //jpg y la clase
    }
    if (billeteMoneda > 2) {
        mensaje.append("Monedas de ").append(billeteMoneda).append(": ").append(contadormoneda).append("<br>");
        //imprimes la moneda
        //png y la clase
    }
    if (String.valueOf(billeteMoneda).contains("5")) {
        billeteMoneda = billeteMoneda / 2.5;
    } else {
        billeteMoneda = billeteMoneda / 2;
    }
}
//  mensaje.append(billeteMoneda);
}
}
             */
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
        %>
        <h1><%= mensaje%></h1>
        <button type="button" onclick="location.href = '<%=request.getContextPath()%>'">Men&uacute; Inicial</button>
    </body>
</html>
