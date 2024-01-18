<%-- 
    Document   : form3.jsp
    Created on : 17-Oct-2023, 3:21:47 pm
    Author     : HUDA
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>
         <link rel="stylesheet" type="text/css" href="bootstrap.css"><!--  -->
           <link rel="stylesheet" type="text/css" href="frm1.css">
        <link rel="stylesheet" type="text/css" href="form2.css">
    </head>
    <body>
     
       
             <%!String title;%>
        <%!String employer;%>
          <%!String start_date;%>
        <%!String end_date;%>
          <%!String description;%>
            <%!String email;%>
        <%!String city;%>
        <%!String state;%>
       
     
            
            <%
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
          
            String query="select * from job where email='"+request.getParameter("email")+"' and title='"+request.getParameter("title")+"' and employer='"+request.getParameter("employer")+"'";
              
            rs=smt.executeQuery(query);
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);

            }
                while(rs.next())
                {
                title=rs.getString("title");
                employer=rs.getString("employer");
                start_date=rs.getString("start_date");
                end_date=rs.getString("end_date");
                description=rs.getString("description");
                email=rs.getString("email");
                city=rs.getString("city");
                state=rs.getString("state");
                
                }
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
                      <li><a class="nav-link active" href="#">Experience</a></li>
                      <li><a href="#">Education</a></li>
                      <li><a href="#">Projects</a></li>
                      <li><a href="#">Certifications</a></li>                      
                      <li><a href="#">Summary</a></li>
                      <li><a href="#">Finalize</a></li>
                    </ul>
                  </nav>

               </div>
       
            </div>
            
            <div class="col-9">
              <div class="container-fluid c2">
                <h1>Let's work on your experience</h1>
            
              </div>
                <form action="http://localhost:8088/WebApplication2/EditJob?email=<%=email%>" method="post">
                    
               
<div class="container">
    <div class="contact-form row">
    <div class="from-field col-lg-6">
      <label for="Job Title" class="label">Job Title</label>
      <input id="Job Title" class="input-text" type="text" name="title" value="<%out.println(request.getParameter("title"));%>">
    </div>
    <div class="from-field col-lg-6">
      <label for="Employer" class="label">Employer</label>
      <input id="Employer" class="input-text" type="text" name="employer" value="<%=employer%>">
    </div>
  <div class="from-field col-lg-6">
        <label for="City" class="label">City</label>
        <input id="City" class="input-text" type="text" name="city" value="<%=city%>">
        <div id="p5"></div>
      </div>
      <div class="from-field col-lg-6">
        <label for="State" class="label">State</label>
        <input id="State" class="input-text" type="text" name="state" value="<%=state%>" >
        <div id="p6"></div>
      </div>
     
      <div class="from-field col-lg-6">
        <label for="Start Date" class="label">Start Date</label>
        <input id="month" class="input-text" type="month" name="start" value="<%=start_date%>">
      </div>
      <div class="from-field col-lg-6">
        <label for="End Date" class="label">End Date</label>
        <input id="month" class="input-text" type="month" name="end" value="<%=end_date%>">
      </div>
      <div class="from-field col-lg-6">
        <p><label for="Now Describe what you did?">Now Describe what you did?</label></p>
        <textarea class="input-text" rows="14" cols="106" name="description"><%=description%></textarea>
       
      </div>
      <div class="from-field col-lg-6">
        <p><label for="Ask">Ask</label></p>
        <textarea class="input-text" name="Ask" rows="14" cols="106" value="hello"></textarea>
        
          <a href="#" class="Ask" style="margin-right: 100px; padding-top: 10px; padding-left: 20px; padding-right: 20px;">Ask</a>
        
      </div>
           <div class="from-field col-lg-6">
        
        <input class="Submit" type="submit" value="Edit" id="b1" onclick="validate()">
      </div>
      <div class="from-field col-lg-6">
        
        <input class="Submit" type="submit" value="Back" id="b2">
      </div>
      
    </div>
  </div>
            </from>
</div>
               
            </div>
        </div>

    </div>
    
  
          
           
      
     
    </body>
</html>
