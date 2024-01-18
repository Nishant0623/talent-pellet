<%-- 
    Document   : editProject
    Created on : 18-Oct-2023, 10:48:34 pm
    Author     : HUDA
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" type="text/css" href="bootstrap.css"><!--  -->
        <link rel="stylesheet" type="text/css" href="frm4.css">
    </head>
    <body>
                  <%!String email;%>
          <%
                      email=request.getParameter("email");
            %> 
        <div class="container-fluid">
        <div class="row">
            <div class="col-3" id="c1" style="color:white;">
               <div class="container">
                <nav class="navbar bg-body-dark">
                    <div class="container-fluid">
                      <a class="navbar-brand" href="#">
                        <img src="pictures/document-management-big.png" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
                        <h4 style="color:white;">TalentPallets</h4>
                      </a>
                    </div>
                  </nav>
                  <nav class="navmenu">
                    <ul>
                      <li><a class="nav-link active">Header</a></li>
                      <li><a class="nav-link active">Experience</a></li>
                      <li><a class="nav-link active">Education</a></li>                  
                      <li><a class="nav-link active" href="#">Projects</a></li>
                      <li><a href="certificate.jsp?email=<%=email%>">Certifications</a></li>                      
                      <li><a href="#">Summary</a></li>
                      <li><a href="#">Finalize</a></li>
                    </ul>
                  </nav>
                    </div>
                       
              
             
        
        
             
              
             
      
        

               </div>
           
            <div class="col-9">
              <div class="container-fluid c2">
                <h1>Let's see your Projects</h1>
                <p>Start with your most recent Project first</p>
              </div>
                <form action="http://localhost:8088/WebApplication2/EditProject" method="post" enctype="multipart/form-data">
                    <%!String name;%>
          <%!String orga;%>
          <%!String date;%>
          <%!String url;%>
          <%!String desc;%>
     
             
            
            <%
                name=request.getParameter("name");
                Connection con=null;
                Statement smt=null;
                ResultSet rs=null;
                try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                
          
            }
            
            try {
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project?zeroDateTimeBehavior=CONVERT_TO_NULL","root","root");
               
            } catch (SQLException ex) {
                 out.println(ex);
               
            }
                try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
          
            }
            
          
            String query="select * from project where email='"+email+"' and name='"+name+"'";
              
            rs=smt.executeQuery(query);
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
                while(rs.next())
                {
                orga=rs.getString("org");
                date=rs.getString("dat");
                url=rs.getString("purl");
                desc=rs.getString("description");
                }
                
            %>
<div class="container">
  <div class="contact-form row">
    <div class="from-field col-lg-8">
      <label for="Give your Project a Title" class="label">Give your Project a Title</label>
      <input id="Give your Project a Title" class="input-text" type="text" name="title" value="<%=name%>">
    </div>
    <div class="from-field col-lg-8">
      <label for="In which Organization did you do your Project?" class="label">In which Organization did you do your Project?</label>
      <input id="In which Organization did you do your Project" class="input-text" type="text" name="org" value="<%=orga%>">
    </div>
    <div class="from-field col-lg-8">
      <label for="When did you do your Project?" class="label">When did you do your Project?</label>
      <input id="month" class="input-text" type="month" id="year" type="number" min="1990" max="1099" name="year" value="<%=date%>">
    </div>
    <div class="from-field col-lg-8">
        <label for="Project URL" class="label">Project URL</label>
        <input id="Project URL" class="input-text" type="text" name="purl" value="<%=url%>">
      </div>
          <div class="from-field col-lg-8">
        <label for="Project URL" class="label">Project photo</label>
        <input id="Project URL" class="input-text" type="file" name="file" value="<%=url%>">
      </div>
    <div class="from-field col-lg-8">
      <p><label for="Now Describe what you did?">Now Describe what you did?</label></p>
      <textarea class="input-text" name="description" rows="4" cols="106"><%=desc%></textarea>
    
    </div>
    <div class="from-field col-lg-4">
      <p><label for="Ask">Ask</label></p>
      <textarea class="input-text" name="Ask" rows="4" cols="106"></textarea>
      <div class="from-field col-lg-4">
        <a href="#" class="Ask" style="margin-right: 100px; padding-top: 10px; padding-left: 20px; padding-right: 20px;">Ask</a>
      </div>
      
    </div>
        <div class="from-field col-lg-6">
            <input type="submit" value="Submit" id="b1" class="Submit">
       
      </div>
       <div class="from-field col-lg-6">
 <input type="submit" value="Back" id="b2" class="Back">
        
      </div>
   <div class="from-field col-lg-6">
      
                          <input id="Job Title" class="input-text" type="text" name="email" value="<%=email%>">
    </div>
  
    </div>
  </div>
            </form>
</div>
               
            </div>
        </div>

    </div>
     </div>
    </body>
</html>
