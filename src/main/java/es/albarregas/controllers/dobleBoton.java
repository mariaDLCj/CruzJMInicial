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
public class dobleBoton extends HttpServlet {

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
            out.println("<title>Servlet dobleBoton</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet dobleBoton at " + request.getContextPath() + "</h1>");
            /*
            OBTENEMOS EL VALOR DEL BOTÓN, QUE SI ES ENUM NOS TRAERÁ
            LOS DATOS MEDIANTE EL ENUMERATION Y EN CASO CONTRARIO 
            MEDIANTE MAP
             */
            String valorNombre[] = request.getParameterValues("enviar");
            if (valorNombre[0].equals("enum")) {
                /*INICIO DEL ENUMERATION*/
                Enumeration<String> parametros = request.getParameterNames();
                if (parametros.hasMoreElements()) {
                    while (parametros.hasMoreElements()) {
                        String nombre = parametros.nextElement(); // nombre siguiente elemento 
                        if (nombre.equals("preferencias")) {
                            String[] preferencias = request.getParameterValues(nombre);
                            char mayuscula = nombre.toUpperCase().charAt(0);
                            String nuevoNombre = mayuscula + nombre.substring(1);
                            if (preferencias.length == 1) {
                                out.println("<p>El valor de " + nuevoNombre + " es " + preferencias[0] + "</p>");
                                out.println("Esto es si preferencias solo tiene una posición");
                            } else { // si hay solo una posicion  if (preferencias.length == 0)
                                out.println("<p>Esto es " + nuevoNombre + "</p>");
                                for (String p : preferencias) {
                                    if (p != null) { //si el valor no esta vacio que la imprima
                                        // imprimir e un alista desordenada
                                        out.println("<ul>");
                                        out.println("<li>" + p + "</li>");
                                        out.println("</ul>");
                                    }
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

                        } // este te imprime solo si el nombre no es enviar
                    }
                    /*FIN DEL ENUMERATION*/

                }
            } else {

                /*INICIO DEL MAP*/
                Map<String, String[]> parametros = request.getParameterMap();

                for (Map.Entry<String, String[]> p : parametros.entrySet()) {
                    String clave = p.getKey();
                    String valor[] = p.getValue();

                    if (clave.equals("preferencias")) { // si el valor 
                  
                        if (p.getValue().length >= 0) {
                            for (int i = 0; i < p.getValue().length; i++) {
                                if (!valor[i].equals("")) {

                                    // imprimir e un alista desordenada
                                    out.println("<ul>");
                                    out.println("<li>" + p.getValue()[i] + "</li>");
                                    out.println("</ul>");

                                }
                            }
                        }
                    } else if (!clave.equalsIgnoreCase("enviar")) {
                        if (!clave.equalsIgnoreCase("fecha_Nacimiento")) {
                            out.println("<p>" + clave + " : " + p.getValue()[0] + "</p>");
                        } else {
                            out.println("<p>" + clave + " : " + p.getValue()[0] + "</p>");
                        }

                    }

                }
                /*FIN DEL MAP*/
            }
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
