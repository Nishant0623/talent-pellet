<%-- 
    Document   : EditSkill
    Created on : 21-Oct-2023, 9:40:40 pm
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
        <link rel="stylesheet" type="text/css" href="frm6.css">
    </head>
    <body>
      <%!String email;%>
      <%!String skills;%>
      <%!String sk;%>
          <%
                      email=request.getParameter("email");
                      skills=request.getParameter("skill");
                      sk=request.getParameter("skill");
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
                        <li><a class="nav-link active" href="#">Header</a></li>
                      <li><a class="nav-link active" href="#">Experience</a></li>
                      <li><a class="nav-link active" href="#">Education</a></li>
                      <li><a class="nav-link active" href="#">Projects</a></li>
                      <li><a class="nav-link active" href="#">Certifications</a></li>                    
                      <li><a class="nav-link active" href="#">Summary</a></li> 
                      <li><a href="#">Finalize</a></li>
                    </ul>
                  </nav>
                   

               </div>
                            
        
      
       
     
             
            
       
           

            </div>
            <div class="col-9">
              <div class="container-fluid c2">
                <h1>Let me know about the skills you posses</h1>
                <p>Enter programming languages,framework,libraries,Ide's etc everything you know</p>
              </div>
<div class="container">
  <div class="contact-form row">
      <form action="http://localhost:8088/WebApplication2/EditSkill?sk=<%=sk%>" method="post" enctype="multipart/form-data">
    <div class="from-field col-lg-30">
        <p><label for="Write a Professional Summary">Enter skills one by one</label></p>
 <input id="Give your Project a Title" class="input-text" type="text" name="skills" value="<%=skills%>">
      </div>
        <div class="from-field col-lg-6">
        
          <input type="file" name="file">
      </div>
    <div class="from-field col-lg-6">
        
          <input type="submit" id="b1" class="Submit" value="Submit">
      </div>
      <div class="from-field col-lg-6">
         <input type="submit" id="b1" class="Submit" value="Back">
   
    
      </div>
        <div class="from-field col-lg-6">
      
                          <input id="Job Title" class="input-text" type="text" name="email" value="<%=email%>">
    </div>
  </form>
    </div>
  </div>
</div>
               
            </div>
        </div>

    </div>
    </body>
</html>
