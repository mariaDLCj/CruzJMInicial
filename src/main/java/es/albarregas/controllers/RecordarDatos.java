/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
                    + "<input type=\"submit\" name=\"primera\" value=\"Enviar\">\n"
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

            /* INTENTO CON ENUMERATION  */
            //PODRÍA SER QUE TUVIERAS QUE LIMPIAR PARAMETROS SI USAS EL ENUMERATION AQUI ARRIBA DE TODO
            boolean vacios = false;

            if (request.getParameter("primera") == null) {
                Enumeration<String> parametros = request.getParameterNames();
                //COMPRUEBA QUE NO ESTÉ VACÍO
                if (parametros.hasMoreElements()) {
                    while (parametros.hasMoreElements()) {
                        String nombreParametro = parametros.nextElement(); // Obtener el siguiente nombre de parámetro
                        // String valorParametro = request.getParameter(nombreParametro);
                        // si hay algún parámetro vacío
                        if (nombreParametro == null || nombreParametro.isEmpty()) { // probar sino con isEmpty o con .equals("")
                            vacios = true;
                        }
                    }
                }
                // SI NO ESTÁ VACÍO MUESTRA LOS DATOS
                if (vacios == false) {
                    //MOSTRAREMOS LOS DATOS CON MAP
                    Map<String, String[]> parametrosMapa = request.getParameterMap();
                    StringBuilder respuestaFormulario = new StringBuilder();
                    //CON MAP MOSTRAREMOS LAS RESPUESTAS POR CLAVE Y VALOR
                    for (Map.Entry<String, String[]> p : parametrosMapa.entrySet()) {
                        String clave = p.getKey();
                        String valor[] = p.getValue();
                        respuestaFormulario.append("\n<p>").append(clave).append(" ").append(valor[0]).append("</p>\n");
                    }
                    out.println(respuestaFormulario.toString());
                } else {// SI ESTÁN VACÍOS AVISAMOS Y PASAMOS EL FORMULARIO EN OCULTP
                    StringBuilder aviso = new StringBuilder();
                    aviso.append("<p>Todos los campos del formulario son obligatorios</p>").append("<form action=\"RecordarDatos\" method=\"post\">\n");

                    if (parametros.hasMoreElements()) {
                        while (parametros.hasMoreElements()) {
                            String nombreParametro = null; // limpiando; 
                            nombreParametro = parametros.nextElement();
                            String parametro = request.getParameter(nombreParametro);

                            // Obtener el siguiente nombre de parámetro
                            aviso.append("<label>").append(nombreParametro).append("</label>")
                                    .append("<input type=\"hidden\" name=\"").append(nombreParametro).append("\" value=\"").append(parametro).append("\"><br>\n");
                        }// fin while
                        aviso.append("<input type=\"submit\" name=\"segunda\" value=\"Continuar\">\n").append("</form>");
                        out.println(aviso.toString());
                    }
                }
            } else {// SI NO ES PRIMERA mostramos el fomulario de nuevo
                Enumeration<String> parametros = request.getParameterNames();
                StringBuilder formulario = new StringBuilder();
                formulario.append("<form action=\"RecordarDatos\" method=\"post\">\n");

                if (parametros.hasMoreElements()) {
                    while (parametros.hasMoreElements()) {
                        String nombreParametro = parametros.nextElement(); // Obtener el siguiente nombre de parámetro
                        //EN CASO DE QUE SEA FECHA EL TIPO ES DATE SINO ES TEXT
                        if (nombreParametro.equals("fecha_Nacimiento")) {
                            formulario.append("<label>").append(nombreParametro).append("</label>")
                                    .append("<input type=\"date\" name=\"").append(request.getParameter(nombreParametro)).append("\"><br>\n");
                        } else {
                            formulario.append("<label>").append(nombreParametro).append("</label>")
                                    .append("<input type=\"text\" name=\"").append(request.getParameter(nombreParametro)).append("\"><br>\n");
                        }
                    }// fin while
                    formulario.append("<input type=\"submit\" name=\"primera\" value=\"Enviar\">\n").append("</form>");
                    out.println(formulario.toString());
                }// fin if de parametroshasmore

            }// fin del if else inicial
            out.println("</body>");
            out.println("</html>");
        }//fin try
    }//fin post
    
    


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
