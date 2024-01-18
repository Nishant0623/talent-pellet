<%-- 
    Document   : form4.jsp
    Created on : 18-Oct-2023, 8:04:23 pm
    Author     : HUDA
--%>

<%@page import="myClasses.Main"%>
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
          <%!String n="";%>
          <%!String u="";%>
          <%!String y="";%>
          <%!String d="";%>
          <%!String o="";%>
          <%!String r="";%>
          <%!String message="";%>
          <%!int count;%>
          
          <%
                      email=request.getParameter("email");
            %> 
            <%
                 if(request.getParameter("ask")!=null)
    {
    n=request.getParameter("title");
    o=request.getParameter("org");
    y=request.getParameter("year");
    u=request.getParameter("url");
    
    message="I want you function as a resume writer and help me  to write a short summarized description in three or four  numbered concise short points  in first form past tense of my project named "+n+" in this project I used the following technology  "+request.getParameter("d")+" first point of description should be the tech stack used to develop this project";
    r=Main.chatGPT(message);
    
    count=1;
}
else
{
count=0;
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
                      <li><a href="form1.jsp?email=<%=email%>" class="nav-link active">Header</a></li>
                      <li><a href="form2.jsp?email=<%=email%>" class="nav-link active">Experience</a></li>
                      <li><a href="form3.jsp?email=<%=email%>" class="nav-link active">Education</a></li>                  
                      <li><a href="form4.jsp?email=<%=email%>" class="nav-link active" href="#">Projects</a></li>
                      <li><a href="certificate.jsp?email=<%=email%>">Certifications</a></li>                      
                      <li><a href="#">Skills</a></li>
                      <li><a href="#">Acheivements</a></li>
                      <li><a href="#">Home</a></li>
                    </ul>
                  </nav>
                    </div>
                                <div class="panel-body">
      
    <table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0">
                  <thead>
                    <tr>
                      <th>
                       Project
                      </th>
                   
                      <th>
                        Edit
                      </th>
                      <th>Delete</th>
                    </tr>
                  </thead>
              
             
        
        <%!String name;%>
       
     
             
            
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
            
          
            String query="select name from project where email='"+email+"'";
              
            rs=smt.executeQuery(query);
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
                while(rs.next())
                {
name=rs.getString("name");
                
            %>
            <tr>
              <td><%=name%></td><!-- comment -->
                
                <td><a href="editProject.jsp?name=<%=name%>&email=<%=email%>"><input type="button" id="b3" value="edit" name="edit"></a></td>
          
            <td><a href="http://localhost:8088/WebApplication2/DeleteProject?name=<%=name%>&email=<%=email%>"><input type="button" id="b4" value="Delete" name="edit"></a></td>
            
            </tr>
          <%
              }
          %>
            
           </table>
      
     </div>

               </div>
           
            <div class="col-9">
              <div class="container-fluid c2">
                <h1>Let's see your Projects</h1>
                <p>Start with your most recent Project first</p>
              </div>
                <form action="http://localhost:8088/WebApplication2/SaveProject?c=<%=count%>" method="post" enctype="multipart/form-data">
<div class="container">
  <div class="contact-form row">
    <div class="from-field col-lg-8">
      <label for="Give your Project a Title" class="label">Give your Project a Title</label>
      <input id="Give your Project a Title" class="input-text" type="text" name="title" value="<%=n%>">
    </div>
    <div class="from-field col-lg-8">
      <label for="In which Organization did you do your Project?" class="label">In which Organization did you do your Project?</label>
      <input id="In which Organization did you do your Project" class="input-text" type="text" name="org" value="<%=o%>">
    </div>
    <div class="from-field col-lg-8">
      <label for="When did you do your Project?" class="label">When did you do your Project?</label>
      <input id="month" class="input-text" type="month" id="year" type="number" min="1990" max="1099" name="year" value="<%=y%>">
    </div>
    <div class="from-field col-lg-8">
        <label for="Project URL" class="label">Project URL</label>
        <input id="Project URL" class="input-text" type="text" name="purl" value="<%=y%>">
      </div>
          <div class="from-field col-lg-8">
        <label for="Project URL" class="label">Project photo</label>
        <input id="Project URL" class="input-text" type="file" name="file">
      </div>
    <div class="from-field col-lg-8">
      <p><label for="Now Describe what you did?">Now Describe what you did?</label></p>
      <textarea class="input-text" name="description" rows="4" cols="106"><%=r%></textarea>
    
    </div>
      <form action="#" method="post">
    <div class="from-field col-lg-4">
      <p><label for="Ask">Ask</label></p>
      <textarea class="input-text" name="d" rows="4" cols="106"></textarea>
   
      <input type="submit" name="ask" value="ask" id="ask">  

      
    </div>
        <div class="from-field col-lg-6">
            <input type="submit" value="Submit" id="b1" class="Submit">
       
      </div>

   <div class="from-field col-lg-6">
      
                          <input id="Job Title" class="input-text" type="text" name="email" value="<%=email%>">
    </div>
    <a href="form4.jsp"></a>
    </div>
  </div>
          </form>
            </form>
</div>
               
            </div>
        </div>

    </div>
     </div>
    </body>
</html>
