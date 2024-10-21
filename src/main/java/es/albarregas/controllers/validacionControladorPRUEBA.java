/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author badoe
 */
public class validacionControladorPRUEBA extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            StringBuilder formulario = new StringBuilder();

            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet validacionControladorPRUEBA</title>");

            formulario.append("<h1>Formulario de Datos</h1>").append("<form action=\"validacionControladorPRUEBA\" method=\"post\">")
                    .append(" <label>Nombre:</label>\n"
                            + "            <input type=\"text\" name=\"nombre\"><br>\n"
                            + "            <label>Apellidos</label>\n"
                            + "            <input type=\"text\" name=\"apellidos\"><br>\n"
                            + "            <label>Fecha Nacimiento</label>\n"
                            + "            <input type=\"date\" name=\"fecha_Nacimiento\"><br>")
                    .append("<br>\n"
                            + "            <br>\n"
                            + "            <label>Preferencias(Elija varias)</label>\n"
                            + "                      \n"
                            + "            <input name=\"preferencias\" type=\"checkbox\">Cine<br>\n"
                            + "            <input name=\"preferencias\" type=\"checkbox\">Teatro<br>\n"
                            + "            <input name=\"preferencias\" type=\"checkbox\">m&uacute;sica<br>\n"
                            + "            <input name=\"preferencias\" type=\"checkbox\">Video juegos<br>\n"
                            + "            \n"
                            + "            <br> ")
                    .append("<br> \n"
                            + "            <label>Sistemas Operativos (Elija uno)</label>\n"
                            + "            <select name=\"sistemas_Operativos\">\n"
                            + "                <option value=\"ubuntu\">Ubuntu</option>\n"
                            + "                <option value=\"windows\">Windows</option>\n"
                            + "                <option value=\"mac\">Mac</option>\n"
                            + "                <option value=\"debian\">Debian</option>\n"
                            + "            </select>")
                    .append("<br><br>\n"
                            + "            <label>Sexo</label>\n"
                            + "            <br>\n"
                            + "            <input type=\"radio\" name=\"genero\" value=\"mujer\"> Mujer           \n"
                            + "            <input type=\"radio\" name=\"genero\" value=\"hombre\"> Hombre\n"
                            + "            <input type=\"radio\" name=\"genero\" value=\"otro\"> Otro\n"
                            + "\n"
                            + "            <input type=\"submit\" name=\"enviar\">\n"
                            + "\n"
                            + "        </form>");

            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet validacionControladorPRUEBA at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            out.println(formulario.toString());

        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //  processRequest(request, response);
        try (PrintWriter out = response.getWriter()) {
            response.setContentType("text/html;charset=UTF-8");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Esto es el do POST</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Formulario de Validado</h1>");

            Map<String, String[]> parametros = request.getParameterMap();

            boolean vacio = false;

            for (Map.Entry<String, String[]> p : parametros.entrySet()) {
                String clave = p.getKey();
                String valor[] = p.getValue();

                if (clave.equals("nombre") && p.getValue()[0].equals("")) {
                    vacio = true;
                } else if (clave.equals("apellidos") && p.getValue()[0].equals("")) {
                    vacio = true;
                } else if (clave.equals("fecha_Nacimiento") && p.getValue()[0].equals("")) {
                    vacio = true;
                }
            }

            if (vacio == true) {
                out.println("<h1> No puedes mandar el formulario vacio</h1>");
                // break;
            } else {

                for (Map.Entry<String, String[]> p : parametros.entrySet()) {
                    String clave = p.getKey();
                    String valor[] = p.getValue();
                    // FORMULARIO CORRECTO
                    if (clave.equals("preferencias")) {

                        if (p.getValue().length >= 0) { // o si la longitud es == a 1 entonces solo mostrar la posi 0
                            for (int i = 0; i < p.getValue().length; i++) {
                                if (valor[i] != null) {

                                    // imprimir e un alista desordenada
                                    out.println("<ul>");
                                    out.println("<li>" + p.getValue()[i] + "</li>");
                                    out.println("</ul>");

                                }
                            }
                            //.toUpperCase().charAt(0)
                            //request.getParameter(preferencias[0])
                        }
                    } else if (!clave.equalsIgnoreCase("enviar")) {

                        if (!clave.equalsIgnoreCase("fecha_Nacimiento")) {

                            out.println("<p>" + clave + " : " + p.getValue()[0] + "</p>");
                        } else {

                            out.println("<p>" + clave + " : " + p.getValue()[0] + "</p>");

                        }

                    } // fin form correctamente

                } // fin for2
            } // fin else

            out.println("<a href='" + request.getContextPath() + "'>Inicio</a>");
            out.println("</body>");
            out.println("</html>");

        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
