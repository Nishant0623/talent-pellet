/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

 @MultipartConfig
/**
 *
 * @author HUDA
 */
public class SaveInformation extends HttpServlet {
Connection con=null;
Statement smt=null;
ResultSet rs=null;
int count=0;
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
            out.println("<title>Servlet SaveInformation</title>");            
            out.println("</head>");
            out.println("<body>");
         
        
        String fname=request.getParameter("firstname");
        String lname=request.getParameter("lastname");
        String city=request.getParameter("city");
           String state=request.getParameter("state");
                  String phone=request.getParameter("phone");
                         String mail=request.getParameter("mail");
                                String email=request.getParameter("email");
                                       String l=request.getParameter("l");
                                              String g=request.getParameter("g");
            

                                             
             
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
            String q="select count(*) from user where mail='"+email+"'";
            try {
                smt=con.createStatement();
            } catch (SQLException ex) {
                Logger.getLogger(SaveInformation.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                rs=smt.executeQuery(q);
            } catch (SQLException ex) {
                Logger.getLogger(SaveInformation.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                while(rs.next())
                {
                    try {
                        count=rs.getInt("count(*)");
                    } catch (SQLException ex) {
                        Logger.getLogger(SaveInformation.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            } catch (SQLException ex) {
                Logger.getLogger(SaveInformation.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(count==0)
            {
                   
                   String query="insert into user values('"+fname+"','"+lname+"','"+city+"','"+state+"','"+phone+"','"+mail+"','"+l+"','"+g+"','"+email+"')";
            try {
                smt=con.createStatement();
            } catch (SQLException ex) {
              out.println(ex);
            }
            try {
                smt.executeUpdate(query);
            } catch (SQLException ex) {
                  out.println(ex);

            } 
            }
            else
            {
                String query="update user set firstname='"+fname+"',lastname='"+lname+"',city='"+city+"',state='"+state+"',phone='"+phone+"',email='"+mail+"',linkedin='"+l+"',git='"+g+"' where mail='"+email+"'";
                try {
                    smt=con.createStatement();
                } catch (SQLException ex) {
                                 out.println(ex);

                }
                try {
                    smt.executeUpdate(query);
                } catch (SQLException ex) {
              out.println(ex);

                }
            }
             
                   RequestDispatcher rd=request.getRequestDispatcher("form2.jsp?email="+email+"");
            rd.forward(request,response);       
         
            
   
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
