/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author badoe
 */
public class cabeceraPeticion extends HttpServlet {

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
            out.println("<title>Servlet cabeceraPeticion</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet cabeceraPeticion at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) { //este metodo printwriter es para obtener la escritura
            StringBuilder mensaje = new StringBuilder();
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<head>");
            out.println("<title>Cabeceras</title>");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/cabeceraPeticion.css\"/>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Formulario de Datos</h1>");
            out.println("<div class=\"contenedor\">");

            Enumeration<String> sesionValores = request.getHeaderNames();

            if (sesionValores.hasMoreElements()) {
                while (sesionValores.hasMoreElements()) {
                    String nombre = sesionValores.nextElement(); // nombre siguiente elemento 
                    mensaje.append("<p>" + "<strong>" + nombre + "</strong>" + ": " + request.getHeader(nombre) + "</p>");
                }
                out.println(mensaje.toString());
            }
            out.println("/<div>");

            out.println("<a href='" + request.getContextPath() + "'>Inicio</a>");
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
        //HttpSession javax.servlet.http.HttpServletRequest.getSession();
        //  getHeaderNames();
        // boolean create = true;
        // HttpSession session = request.getSession(create);
        //   HttpSession session = request.getSession();

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
