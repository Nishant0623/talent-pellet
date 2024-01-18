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
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author HUDA
 */
public class email extends HttpServlet {
Connection con=null;
Statement smt=null;
ResultSet rs=null;
String e="";
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
            out.println("<title>Servlet email</title>");            
            out.println("</head>");
            out.println("<body>");
         
                        String u=request.getParameter("email");
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
            String query="select email from login where email";
            try {
                smt=con.createStatement();
            } catch (SQLException ex) {
                
                Logger.getLogger(singIn.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                rs=smt.executeQuery(query);
            } catch (SQLException ex) {
                Logger.getLogger(email.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                while(rs.next())
                {
                    e=rs.getString("email");
                    if(e.equals(u))
                        break;
                }
            } catch (SQLException ex) {
                Logger.getLogger(email.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(e.equals(u))
            {
                OTPgenerator o=new OTPgenerator();
            String randomNumber=o.otp();
            
       
                String subject="OTP for reset password";
                sendEmail e=new sendEmail();
                e.email(u,subject,randomNumber);
        
        
        RequestDispatcher rd=request.getRequestDispatcher("otp.html");
        rd.forward(request,response); 
            }
            else
            {
                out.println("Enter valid email");
                RequestDispatcher rd=request.getRequestDispatcher("login.html");
                rd.forward(request,response);
            }
                
  
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
