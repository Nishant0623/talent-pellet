<%-- 
    Document   : editEducation
    Created on : 18-Oct-2023, 6:44:57 pm
    Author     : HUDA
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
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
        <link rel="stylesheet" type="text/css" href="form2.css">
           <link rel="stylesheet" type="text/css" href="frm3.css">
    </head>
    <body>
        <%!String degree;%>
        <%!String name;%>
        <%!String city;%>
        <%!String state;%>
        <%!String year;%>
        <%!String cgpa;%>
        <%!String email;%>
        
        
        <%
            Connection con=null;
            Statement smt=null;
            ResultSet rs=null;
            email=request.getParameter("email");
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
            String query="select * from education where degree='"+request.getParameter("degree")+"' and email='"+request.getParameter("email")+"'";
                  try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);

            }
            while(rs.next())
            {
            degree=rs.getString("degree");
            name=rs.getString("name");
            city=rs.getString("city");
            state=rs.getString("state");
            year=rs.getString("year");
            cgpa=rs.getString("cgpa");
            
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
                      <li><a class="nav-link active">Experience</a></li>
                      <li><a class="nav-link active" href="#">Education</a></li>
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
                <h1>Let's see your Educational Background</h1>
                <p>Start with your most recent Qualification</p>
              </div>
                <form action="http://localhost:8088/WebApplication2/EditEducation" method="post">
<div class="container">
  <div class="contact-form row">
    <div class="from-field col-lg-10">
      <label for="What is your Degree or other Qualification and Major?" class="label">What is your Degree or other Qualification and Major?</label>
      <input id="What is your Degree or other Qualification and Major" class="input-text" type="text" name="degree" value="<%=degree%>">
    </div>
    <div class="from-field col-lg-10">
      <label for="Where did you earn your Degree/Qualification?" class="label">Where did you earn your Degree/Qualification?</label>
      <input id="Where did you earn your Degree/Qualification?" class="input-text" type="text" name="institute" value="<%=name%>">
    </div>
    <div class="from-field col-lg-10">
      <label for="Where is the Institution located?" class="label">Where is the Institution located?</label>
      <input id="Where is the Institution located" class="input-text" type="text" name="city" value="<%=city%>">
    </div>
       <div class="from-field col-lg-10">
        <label for="Open field for Additional Information" class="label">In which state is institute located?</label>
        <input id="Open field for Additional Information" class="input-text" type="text" name="state" value="<%=state%>">
      </div>
      <div class="from-field col-lg-10">
        <label for="When did you earn your Degree/Qualification?" class="label">When did you earn your Degree/Qualification?</label>
        <input id="year" class="input-text" type="number" name="year" value="<%=year%>">
      </div>
      <div class="from-field col-lg-10">
        <label for="CGPA" class="label">CGPA</label>
        <input id="CGPA" class="input-text" type="number" min="0" max="10" step="0.01" name="cgpa" value="<%=cgpa%>">
      </div>
     
       <div class="from-field col-lg-6">
        
        <input class="Submit" type="submit" value="Submit" id="b1" onclick="validate()">
      </div>
      <div class="from-field col-lg-6">
        
        <input class="Submit" type="submit" value="Back" id="b2">
      </div>
       <div class="from-field col-lg-6">
      
                          <input id="Job Title" class="input-text" type="text" name="email" value="<%=email%>">
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
