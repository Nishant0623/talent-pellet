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
import myClasses.User;
@MultipartConfig
/**
 *
 * @author HUDA
 */
public class EditProject extends HttpServlet {
Connection con=null;
Statement smt=null;
ResultSet rs=null;
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
            out.println("<title>Servlet EditProject</title>");            
            out.println("</head>");
            out.println("<body>");
                Part part=request.getPart("file");
         
            String fileName=part.getSubmittedFileName();
             String upload="C:\\Users\\HUDA\\Documents\\NetBeansProjects\\WebApplication2\\web\\pictures\\"+fileName;
           out.println(upload);
             InputStream is=part.getInputStream();
             boolean ans=uploadFile(is,upload);
            if(ans)
            {
                out.println("file uploaded");
            }
            else
            {
                out.println("not");
            }
             String title=request.getParameter("title");
              String org=request.getParameter("org");
                   String dat=request.getParameter("dat");
                        String purl=request.getParameter("purl");
            String description=request.getParameter("description");   
            
            String email=request.getParameter("email");
             try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                
            
            }
            
            try {
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project?zeroDateTimeBehavior=CONVERT_TO_NULL","root","root");
               
            } catch (SQLException ex) {
                 out.println(ex);

            }
            String query="update project set name='"+title+"',org='"+org+"',dat='"+dat+"',purl='"+purl+"',description='"+description+"',image='"+fileName+"' where email='"+email+"' and name='"+title+"'";
            
     
             
            try {
                smt=con.createStatement();
                
            } catch (SQLException ex) {
            out.println(ex);
            }
            try {
                smt.executeUpdate(query);
            } catch (SQLException ex) {
                   out.println(ex);
                Logger.getLogger(EditEducation.class.getName()).log(Level.SEVERE, null, ex);
            }
             User u=new User();
            u.setEmail(email);
            request.setAttribute("use",u);
            RequestDispatcher rd=request.getRequestDispatcher("form4.jsp?email="+email+"");
            rd.forward(request, response);   
            out.println("</body>");
            out.println("</html>");
        }
    }
     private boolean uploadFile(InputStream is, String upload) {
         // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
         boolean test=false;
         try
         {
             byte[] byt=new byte[is.available()];
             is.read(byt);
             try (FileOutputStream ops = new FileOutputStream(upload)) {
                 ops.write(byt);
                 ops.flush();
             }
             test=true;
             
         } catch (FileNotFoundException ex) {
            Logger.getLogger(imageServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(imageServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
         return test;
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
