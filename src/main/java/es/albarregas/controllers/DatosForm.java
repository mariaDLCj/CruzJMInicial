/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.Date;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author badoe
 */
public class DatosForm extends HttpServlet {

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
        //   processRequest(request, response);

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
        // doGet(request, response); // te redirige al doget

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) { //este metodo printwriter es para obtener la escritura
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DatosForm</title>");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/cabeceraPeticion.css\"/>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Formulario de Datos</h1>");
            out.println("<div class=\"contenedor\">");

            Enumeration<String> parametros = request.getParameterNames();
            if (parametros.hasMoreElements()) {
                while (parametros.hasMoreElements()) {
                    String nombre = parametros.nextElement(); // nombre siguiente elemento 

                    if (nombre.equals("preferencias")) {
                        String[] preferencias = request.getParameterValues(nombre);
                        char mayuscula = nombre.toUpperCase().charAt(0);
                        String nuevoNombre = mayuscula + nombre.substring(1);
                        if (preferencias != null) {
                            if (preferencias.length == 1) { // o si la longitud es == a 1 entonces solo mostrar la posi 0
                                out.println("<p>El valor de " + nuevoNombre + " es " + preferencias[0] + "</p>");
                            } else {
                                out.println("<p>Esto es " + nuevoNombre + "</p>");
                                out.println("<ul>");
                                for (String p : preferencias) {
                                    if (!p.isEmpty() && !p.equals("")) { //si el valor no esta vacio que la imprima (!p.equals("")) 
                                        // imprimir e un alista desordenada
                                        out.println("<li>" + p + "</li>");
                                    }
                                }
                                out.println("</ul>");
                            }
                        }
                    } else if (!nombre.equalsIgnoreCase("enviar")) {// .replaceAll("."," ") sirve para poner espacion en blanco
                        char mayuscula = nombre.toUpperCase().charAt(0);
                        String nombre_Completo = mayuscula + nombre.substring(1);
                        String nuevoNombre = nombre_Completo.replaceAll("_", " ");
                        if (!nombre.equalsIgnoreCase("fecha_Nacimiento")) {
                            char respuesta_Mayus = request.getParameter(nombre).toUpperCase().charAt(0);
                            String respuesta_Completa = mayuscula + request.getParameter(nombre).substring(1);
                            String nueva_Respuesta = respuesta_Mayus + respuesta_Completa.substring(1);
                            out.println("<p>" + nuevoNombre + " : " + nueva_Respuesta + "</p>");
                        } else {
                            String anio = request.getParameter(nombre).substring(0, 4);
                            String mes = request.getParameter(nombre).substring(5, 7);
                            String dia = request.getParameter(nombre).substring(8, 10);
                            String nueva_Fecha = dia + " " + mes + " " + anio;

                            out.println("<p>" + nuevoNombre + " : " + nueva_Fecha + "</p>");

                        }
                    }
                }

            }
            out.println("<a href='" + request.getContextPath() + "'>Inicio</a>");
            out.println("</div>");

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
