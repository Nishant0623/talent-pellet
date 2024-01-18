/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import myClasses.Huda;
import myClasses.User;

/**
 *
 * @author HUDA
 */
public class regestration extends HttpServlet {
Connection con=null;
Statement smt=null;
ResultSet rs=null;
String pass=" ";
String user=" ";
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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet regestration</title>");            
            out.println("</head>");
            out.println("<body>");
                
            String e=request.getParameter("email");
            String p=request.getParameter("password");
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                out.println("dikkat in driver");
                Logger.getLogger(singIn.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project?zeroDateTimeBehavior=CONVERT_TO_NULL","root","root");
               
            } catch (SQLException ex) {
                 out.println(ex);
                Logger.getLogger(singIn.class.getName()).log(Level.SEVERE, null, ex);
            }
            String query="select password,name from login where email='"+e+"'";
            try {
                smt=con.createStatement();
            } catch (SQLException ex) {
                out.println("dikkat in con create");
                Logger.getLogger(singIn.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            rs=smt.executeQuery(query);
            while(rs.next())
            {
              pass=rs.getString("password");
              user=rs.getString("name");
            }
            out.println(pass);
            if(pass.equals(p))
            {
              

                
                RequestDispatcher rd=request.getRequestDispatcher("webPage.jsp?email="+e);
                rd.forward(request,response);
            }
            else
            {
                if(pass.equals(" "))
                {
                     RequestDispatcher rd=request.getRequestDispatcher("login.html");
                rd.forward(request,response);
                }
                else
                {
                  
                
                   RequestDispatcher rd=request.getRequestDispatcher("relogin.html");
                rd.forward(request,response);  
                }
            }
            out.println("</body>");
            out.println("</html>");
        } catch (SQLException ex) {
        Logger.getLogger(regestration.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
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
