/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author badoe
 */
public class DirectoControlador extends HttpServlet {

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
        // processRequest(request, response);

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DirectoControlador</title>");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/cabeceraPeticion.css\"/>");

            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DirectoControlador at " + request.getContextPath() + "</h1>");
            out.println("<div class=\"contenedor\">");

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
                out.println("<a href='.'>'VOLVER'</a>");
                // break;
            } else {
                doPost(request, response); // te redirige al doget
            }
            out.println("</div>");

            out.println("</body>");
            out.println("</html>");
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
            out.println("<title>Servlet DirectoControlador</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Directo al Controlador</h1>");

            Map<String, String[]> parametros = request.getParameterMap();

            for (Map.Entry<String, String[]> p : parametros.entrySet()) {
                String clave = p.getKey();
                String valor[] = p.getValue();
                // FORMULARIO CORRECTO
                if (clave.equals("preferencias")) { // si el valor 

                    if (p.getValue().length >= 0) { // o si la longitud es == a 1 entonces solo mostrar la posi 0
                        for (int i = 0; i < p.getValue().length; i++) {
                            if (valor[i] != null) {

                                // imprimir e un alista desordenada
                                out.println("<ul>");
                                out.println("<li>" + p.getValue()[i] + "</li>");
                                out.println("</ul>");

                            }
                        }

                    }
                } else if (!clave.equalsIgnoreCase("enviar")) {// .replaceAll("."," ") sirve para poner espacion en blanco

                    if (!clave.equalsIgnoreCase("fecha_Nacimiento")) {

                        out.println("<p>" + clave + " : " + p.getValue()[0] + "</p>");
                    } else {
                        out.println("<p>" + clave + " : " + p.getValue()[0] + "</p>");

                    }

                } // fin form correctamente

            } // fin for2
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
