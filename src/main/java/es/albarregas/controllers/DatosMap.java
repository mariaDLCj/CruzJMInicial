/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import static java.util.Map.entry;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author badoe
 */
public class DatosMap extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DatosMap</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DatosMap at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        processRequest(request, response);
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
        /*
        
        para la pagina directa al controlador se hace en el doget
        
 /*
        NUEVA TAREA 
        validar formulario como antes y que haya una pagina intermedia que diga que todos los campos son obligatorios 
        en una nueva pagina que diga eso y tenga un boton para enviar que lleve al formulario de nuevio
        Aquí el controlador lo va a hacer todo hasta el formulario
        todas las url tienen que ir a través de el contexto de la app. 
         */
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) { //este metodo printwriter es para obtener la escritura
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DatosForm</title>");
            out.println("</head>");
            out.println("<body>");

            Map<String, String[]> parametros = request.getParameterMap();

            for (Map.Entry<String, String[]> p : parametros.entrySet()) {
                String clave = p.getKey();
                String valor[] = p.getValue();

                if (clave.equals("preferencias")) { // si el valor 
                   
                    if (p.getValue().length > -1) { // o si la longitud es == a 1 entonces solo mostrar la posi 0
                        for (int i = 0; i < p.getValue().length; i++) {

                            if (!p.getValue()[i].equals("")) {

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

                }

            }

            //ITERAR SOBRE EL MAP
            // INICIO TEXTO ADAPTAR
            out.println("<h1>Servlet DatosForm at " + request.getContextPath() + "</h1>");
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
