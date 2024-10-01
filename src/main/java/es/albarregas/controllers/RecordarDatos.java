/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
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

            formulario.append(" <form action=\"../RecordarDatos\" method=\"post\">\n"
                    + "<label>Nombre:</label>\n"
                    + "<input type=\"text\" name=\"nombre\"><br>\n"
                    + "<label>Apellidos</label>\n"
                    + "<input type=\"text\" name=\"apellidos\"><br>\n"
                    + "<label>Fecha Nacimiento</label>\n"
                    + "<input type=\"date\" name=\"fecha_Nacimiento\"><br>\n"
                    + "<label>Domicilio</label>\n"
                    + "<input type=\"text\" name=\"domicilio\"><br>\n"
                    + "<input type=\"submit\" name=\"primerSubmit\">\n"
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
        
        /**/
        
        

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
            
            

            /*INICIO VALIDACIÓN DEL VACÍO*/
            
            

            /*FINAL DEL FORMULARIO*/
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
