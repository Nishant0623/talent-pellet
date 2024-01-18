<%-- 
    Document   : form7
    Created on : 21-Oct-2023, 9:53:10 pm
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
        <link rel="stylesheet" type="text/css" href="form7.css">
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
                        <li><a href="form1.jsp?email=<%=email%>" class="nav-link active" href="#">Header</a></li>
                      <li><a href="form2.jsp?email=<%=email%>" class="nav-link active" href="#">Experience</a></li>
                      <li><a href="form3.jsp?email=<%=email%>" class="nav-link active" href="#">Education</a></li>
                      <li><a href="form4.jsp?email=<%=email%>" class="nav-link active" href="#">Projects</a></li>
                           <li><a href="form5.jsp?email=<%=email%>" class="nav-link active" href="#">Certification</a></li>
                      <li><a href="form6.jsp?email=<%=email%>" class="nav-link active" href="#">Skills</a></li>                    
                      <li><a href="form7.jsp?email=<%=email%>" class="nav-link active" href="form7.jsp?email=<%=email%>">Acheivements</a></li> 
                      <li><a href="form8.jsp?email=<%=email%>">Summary</a></li>
                       
                    </ul>
                  </nav>
                   

               </div>
                <div class="panel-body">
      
    <table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0">
                  <thead>
                    <tr>
                      <th>
                       Acheivements
                      </th>
                   
                      <th>
                        Edit
                      </th>
                      <th>Delete</th>
                    </tr>
                  </thead>
              
             
        
        <%!String a;%>
       
     
             
            
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
            
          
            String query="select acheive from achivement where email='"+email+"'";
              
         
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
                while(rs.next())
                {
a=rs.getString("acheive");
                
            %>
            <tr>
              <td><%=a%></td><!-- comment -->
                
                <td><a href="EditA.jsp?a=<%=a%>&email=<%=email%>"><input type="button" id="b3" value="edit" name="edit"></a></td>
          
            <td><a href="http://localhost:8088/WebApplication2/DeleteA?a=<%=a%>&email=<%=email%>"><input type="button" id="b4" value="Delete" name="edit"></a></td>
            
            </tr>
          <%
              }
          %>
            
           </table>
      
     </div>

            </div>
            <div class="col-9">
              <div class="container-fluid c2">
                <h1>Let me know about the Acheivement's you accomplished</h1>
                <p>Enter your acheivements one by one</p>
              </div>
<div class="container">
  <div class="contact-form row">
      <form action="http://localhost:8088/WebApplication2/SaveA" method="post">
    <div class="from-field col-lg-30">
        <p><label for="Write about your chevivement roughly">Enter acheivement's one by one</label></p>
 <input id="Give your Project a Title" class="input-text" type="text" name="a">
      </div>
    <div class="from-field col-lg-6">
        
          <input type="submit" id="b1" class="Submit" value="Submit">
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
