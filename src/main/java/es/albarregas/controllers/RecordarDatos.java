/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Map;
import static javax.management.Query.value;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author badoe
 */
public class RecordarDatos extends HttpServlet {

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

        /*
            MOSTRAR FORMULARIO
            VALIDAR EN EL POST 
         */
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            StringBuilder formulario = new StringBuilder();

            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet validacionControladorPRUEBA</title>");

            formulario.append(" <form action=\"RecordarDatos\" method=\"post\">\n"
                    + "<label>Nombre:</label>\n"
                    + "<input type=\"text\" name=\"nombre\"><br>\n"
                    + "<label>Apellidos</label>\n"
                    + "<input type=\"text\" name=\"apellidos\"><br>\n"
                    + "<label>Fecha Nacimiento</label>\n"
                    + "<input type=\"date\" name=\"fecha_Nacimiento\"><br>\n"
                    + "<label>Domicilio</label>\n"
                    + "<input type=\"text\" name=\"domicilio\"><br>\n"
                    + "<input type=\"submit\" name=\"primerSubmit\" value=\"primera\">\n"
                    + "</form>");

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
        //processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RecordarDatos</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RecordarDatos at " + request.getContextPath() + "</h1>");

            /* INTENTO CON MAP*/
            boolean vacios = false;

            Map<String, String[]> parametros = request.getParameterMap();
            String primerSubmit = request.getParameter("primerSubmit"); // te dice el valor del submit del GET
            if (primerSubmit != null && primerSubmit.equals("primera")) {
                StringBuilder formulario = new StringBuilder();
                // String nombre = request.getParameter();

                for (Map.Entry<String, String[]> p : parametros.entrySet()) {
                    String clave = p.getKey();
                    String valor[] = p.getValue();

                    // PRIMERO COMPROBAR QUE LOS CAMPOS NO ESTÉN VACÍOS
                    if (valor[0].isEmpty()) {
                        vacios = true;
                    }
                }// cierre for de comprobacion vacio

                formulario.append(" <form action=\"RecordarDatos\" method=\"post\">\n");

                for (Map.Entry<String, String[]> p : parametros.entrySet()) {
                    String clave = p.getKey();
                    String valor[] = p.getValue();
                    String nombre = request.getParameter(clave);

                    // MOSTRAMOS LOS CAMPOS PORQUE NO ESTÁN VACÍOS
                    if (!vacios) {
                        out.println("<p>" + clave + valor[0] + "</p>");
                    } else { //EN CASO DE QUE SÍ SEAN VACÍOS
                        out.println("<p>Los campos deben estar rellenos</p>");

                        // ESTE FORMULARIO DEBE IR OCULTO Y CON EL SUBMIT VALUE != PRIMERA
                        // PARA QUE SE IMPRIMA PASANDO POR EL ELSE
                        out.println("<p>ESTE ES EL FORMULARIO SEGUNDO</p>");

                        formulario.append("<label>nombre</label>\n"
                                + "<input type=\"hidden\" name=\"clave\" value=\"request.getParameter(clave)\"><br>\n");
                        out.println(formulario.toString());
                    } //cierre else campos vacíos
                }// cierre for de muestra de parámetros
                formulario.append("<input type=\"submit\" name=\"Continuar\" value=\"segunda\">\n"
                        + "</form>");

                out.println(formulario.toString());

            } else { // si el valor del submit no es primera y es segunda muestra el formulario
                out.println("<p>Los campos deben estar rellenos</p>");

                for (Map.Entry<String, String[]> p : parametros.entrySet()) {
                    String clave = p.getKey();
                    String valor[] = p.getValue();

                    out.println("<p>ESTE ES EL FORMULARIO QUE SE MUESTRA SI NO ESTA RELLENO</p>");
                    StringBuilder formulario = new StringBuilder();

                    formulario.append(" <form action=\"RecordarDatos\" method=\"post\">\n"
                            + "<label>Nombre:</label>\n"
                            + "<input type=\"text\" name=\"nombre\" value=\"request.getParameter(clave)\"><br>\n"
                            + "<label>Apellidos</label>\n"
                            + "<input type=\"text\" name=\"apellidos\" value=\"request.getParameter(clave)\"><br>\n"
                            + "<label>Fecha Nacimiento</label>\n"
                            + "<input type=\"date\" name=\"fecha_Nacimiento\" value=\"request.getParameter(clave)\"><br>\n"
                            + "<label>Domicilio</label>\n"
                            + "<input type=\"text\" name=\"domicilio\" value=\"request.getParameter(clave)\"><br>\n"
                            + "<input type=\"submit\" name=\"Continuar\" value=\"primera\">\n"
                            + "</form>");

                    out.println(formulario.toString());

                }

                // ESTE FORMULARIO DEBE IR OCULTO Y CON EL SUBMIT VALUE != PRIMERA
                // PARA QUE SE IMPRIMA PASANDO POR EL ELSE
            }

            /*
            INTENTO CON ENUMERATION
             String primerSubmit = request.getParameter("primerSubmit");
            Enumeration<String> parametros = request.getParameterNames();

            boolean vacios = false;
            if (parametros.hasMoreElements()) {

                while (parametros.hasMoreElements()) {
                    String nombreParametro = parametros.nextElement(); // Obtener el siguiente nombre de parámetro
                    String valorParametro = request.getParameter(nombreParametro);
                    
                    if (valorParametro.isEmpty()) {
                        vacios = true;
                    }
                }

                while (parametros.hasMoreElements()) {
                    String nombreParametro = parametros.nextElement(); // Obtener el siguiente nombre de parámetro
                    String valorParametro = request.getParameter(nombreParametro);

                    //COMPROBAMOS QUE EL VALOR DEL FORMULARIO SEA PRIMERA 
                    if (primerSubmit != null && primerSubmit.equals("primera")) {

                        if (vacios == false) {
                            out.println("<p>El " + nombreParametro + " es " + valorParametro + "</p>");
                        } else {
                            out.println("<p>Has de rellenar todos los campos</p>");

                            StringBuilder formulario = new StringBuilder();
                            // ESTE FORMULARIO DEBE IR OCULTO Y CON EL SUBMIT VALUE != PRIMERA
                            // PARA QUE SE IMPRIMA PASANDO POR EL ELSE
                            out.println("<p>ESTE ES EL FORMULARIO SEGUNDO</p>");

                            formulario.append(" <form action=\"RecordarDatos\" method=\"post\">\n"
                                    + "<label>Nombre:</label>\n"
                                    + "<input type=\"text\" name=\"nombre\" value=\"valorParametro\"><br>\n"
                                    + "<label>Apellidos</label>\n"
                                    + "<input type=\"text\" name=\"apellidos\" value=\"valorParametro\"><br>\n"
                                    + "<label>Fecha Nacimiento</label>\n"
                                    + "<input type=\"date\" name=\"fecha_Nacimiento\" value=\"valorParametro\"><br>\n"
                                    + "<label>Domicilio</label>\n"
                                    + "<input type=\"text\" name=\"domicilio\" value=\"valorParametro\"><br>\n"
                                    + "<input type=\"submit\" name=\"primerSubmit\" value=\"segundo\">\n"
                                    + "</form>");
                            out.println(formulario.toString());

                        }//fin comprobacion si esta vacio formulario primera

                    } else {
                        // ESTE FORMULARIO QUE SE MUESTRA Y VALUE == PRIMERA
                        // PARA QUE SE IMPRIMA PASANDO POR EL ELSE
                        StringBuilder formulario = new StringBuilder();
                        out.println("<p>ESTE ES EL FORMULARIO PRIMERA DEL POST</p>");

                        formulario.append(" <form action=\"RecordarDatos\" method=\"post\">\n"
                                + "<label>Nombre:</label>\n"
                                + "<input type=\"text\" name=\"nombre\" value=\"valorParametro\"><br>\n"
                                + "<label>Apellidos</label>\n"
                                + "<input type=\"text\" name=\"apellidos\" value=\"valorParametro\"><br>\n"
                                + "<label>Fecha Nacimiento</label>\n"
                                + "<input type=\"date\" name=\"fecha_Nacimiento\" value=\"valorParametro\"><br>\n"
                                + "<label>Domicilio</label>\n"
                                + "<input type=\"text\" name=\"domicilio\" value=\"valorParametro\"><br>\n"
                                + "<input type=\"submit\" name=\"primerSubmit\" value=\"primera\">\n"
                                + "</form>");
                        out.println(formulario.toString());
                    }

                }
            }// final if parametros hasmoreElements
             */
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
