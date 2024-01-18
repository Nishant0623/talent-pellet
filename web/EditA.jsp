<%-- 
    Document   : EditA
    Created on : 21-Oct-2023, 9:58:10 pm
    Author     : HUDA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="form7.css">
        <title>JSP Page</title>
    </head>
    <body>
         <%!String email;%>
      <%!String a;%>
      <%!String sk;%>
          <%
                      email=request.getParameter("email");
                      a=request.getParameter("a");
                      sk=request.getParameter("a");
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
      <form action="http://localhost:8088/WebApplication2/EditA?sk=<%=sk%>" method="post">
    <div class="from-field col-lg-30">
        <p><label for="Write a Professional Summary">Enter skills one by one</label></p>
 <input id="Give your Project a Title" class="input-text" type="text" name="a" value="<%=a%>">
      </div>
    <div class="from-field col-lg-6">
        
          <input type="submit" id="b1" class="Submit" value="Submit">
      </div>
      <div class="from-field col-lg-6">
         <input type="submit" id="b1" class="Submit" value="Back">
   
    
      </div>
        <div class="from-field col-lg-6">
      
                          <input id="Job Title" class="input-text" type="text" name="email">
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
