<%-- 
    Document   : form2.jsp
    Created on : 14-Oct-2023, 2:45:16 pm
    Author     : HUDA
--%>

<%@page import="myClasses.Main"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="myClasses.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%!String message="";%>
<%!String r="";%>
<%!String t="";%>
<%!String e="";%>
<%!String s="";%><!-- comment -->
<%!String c="";%>
<%!String st="";%>
<%!String en="";%>
 <%!String email="";%>
 <%!int count;%>


<%
       email=request.getParameter("email");
   

%>
<%
    if(request.getParameter("ask")!=null)
    {
    t=request.getParameter("title");
    e=request.getParameter("employer");
    s=request.getParameter("state");
    c=request.getParameter("city");
    st=request.getParameter("start");
    en=request.getParameter("end");
    message="I want you funtion as a resume writer and help me to write a short summarzied description in two or three numbered concise short points mainly one line points in first form past tense of my role as a"+t+" where I worked on and used following technologies"+request.getParameter("d")+" in two or three concise points";
    r=Main.chatGPT(message);
    
    count=1;
}
else
{
count=0;
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Experience</title>
          <link rel="stylesheet" type="text/css" href="bootstrap.css"><!--  -->
        <link rel="stylesheet" type="text/css" href="frm1.css">
             
    </head>
    <body>
       
        
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
                      <li><a  href="form1.jsp?email=<%=email%>" class="nav-link active">Header</a></li>
                      <li><a  href="form2.jsp?email=<%=email%>" class="nav-link active" href="#">Experience</a></li>
                      <li><a href="form3.jsp?email=<%=email%>">Education</a></li>
                      <li><a href="#">Projects</a></li>
                      <li><a href="#">Certifications</a></li>                      
                      <li><a href="#">Skills</a></li>
                      <li><a href="#">Acheivemnts</a></li>
                      <li><a href="#">Home</a></li>

                    </ul>
                  </nav>

               </div>
                <div class="panel-body">
      
    <table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0">
                  <thead>
                    <tr>
                      <th>
                        Employer
                      </th>
                      <th>
                        Role
                      </th>
                      <th>
                        Edit
                      </th>
                      <th>Delete</th>
                    </tr>
                  </thead>
              
             
        
        <%!String title;%>
        <%!String employer;%>
             
            
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
          
            String query="select title,employer from job where email='"+email+"'";
              
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
                
            %>
            <tr>
              <td><%=title%></td><!-- comment -->
                <td><%=employer%></td>
                <td><a href="edit.jsp?title=<%=title%>&employer=<%=employer%>&email=<%=email%>"><input type="button" id="b3" value="edit" name="edit"></a></td>
          
            <td><a href="http://localhost:8088/WebApplication2/DeleteJob?title=<%=title%>&employer=<%=employer%>&email=<%=email%>"><input type="button" id="b4" value="Delete" name="edit"></a></td>
            
            </tr>
          <%
              }
          %>
            
           </table>
      
     </div>
                
                
            </div>
            <div class="col-9">
              <div class="container-fluid c2">
                <h1>Let's work on your experience</h1>
                <p>Start with your most recent job first</p>
              </div>
                 
                <form action="http://localhost:8088/WebApplication2/New?c=<%=count%>" method="post">
<div class="container">
  <div class="contact-form row">
    <div class="from-field col-lg-6">
      <label for="Job Title" class="label">Job Title</label>
      <input id="Job Title" class="input-text" type="text" name="title" value="<%=t%>">
    </div>
    <div class="from-field col-lg-6">
      <label for="Employer" class="label">Employer</label>
      <input id="Employer" class="input-text" type="text" name="employer" value="<%=e%>">
    </div>
  <div class="from-field col-lg-6">
        <label for="City" class="label">City</label>
        <input id="City" class="input-text" type="text" name="city" value="<%=c%>">
        <div id="p5"></div>
      </div>
      <div class="from-field col-lg-6">
        <label for="State" class="label">State</label>
        <input id="State" class="input-text" type="text" name="state" value="<%=s%>">
        <div id="p6"></div>
      </div>
     
      <div class="from-field col-lg-6">
        <label for="Start Date" class="label">Start Date</label>
        <input id="month" class="input-text" type="month" name="start" value="<%=st%>">
      </div>
      <div class="from-field col-lg-6">
        <label for="End Date" class="label">End Date</label>
        <input id="month" class="input-text" type="month" name="end" value="<%=en%>">
      </div>
      <div class="from-field col-lg-6">
        <p><label for="Now Describe what you did?">Now Describe what you did?</label></p>
        <textarea class="input-text" rows="14" cols="106" name="description"><%=r%></textarea>
       
      </div>
         <form action="#?email=<%=email%>" method="post">
         <div class="from-field col-lg-6">
        <p><label for="Ask">Ask</label></p>
        <textarea class="input-text" rows="14" cols="106" name="d" placeholder="First start with technology i.e write names of technology you worked on and thenwrite description of your role "></textarea>
      
                  <input type="submit" name="ask" value="ask" id="ask">  
       
  
        
      </div>
     
           <div class="from-field col-lg-6">
        
        <input class="Submit" type="submit" value="Submit" id="b1" onclick="validate()" name="submit">
      </div>
      <div class="from-field col-lg-6">
        
        <input class="Submit" type="submit" value="Back" id="b2">
      </div>
      
    </div>
  </div>
                      <div class="from-field col-lg-6">
      
                          <input id="Job Title" class="input-text" type="text" name="email" value="<%=email%>">
    </div>
     </form>
                                    </form>
    

</div>
               
            </div>
        </div>

    </div>
    
       
    </body>
</html>
